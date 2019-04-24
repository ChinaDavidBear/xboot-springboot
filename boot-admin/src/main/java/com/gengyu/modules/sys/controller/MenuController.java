package com.gengyu.modules.sys.controller;
import cn.hutool.core.util.StrUtil;
import com.gengyu.common.annotation.SystemLog;
import com.gengyu.common.constant.CommonConstant;
import com.gengyu.common.enums.LogType;
import com.gengyu.common.utils.ResultUtil;
import com.gengyu.common.utils.SecurityUtil;
import com.gengyu.common.vo.Result;
import com.gengyu.config.security.permission.MySecurityMetadataSource;
import com.gengyu.modules.sys.entity.Menu;
import com.gengyu.modules.sys.entity.RoleMenu;
import com.gengyu.modules.sys.entity.User;
import com.gengyu.modules.sys.service.MenuService;
import com.gengyu.modules.sys.service.RoleMenuService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;


/**
 * @author Exrick
 */
@Slf4j
@RestController
@Api(description = "菜单/权限管理接口")
@RequestMapping("/admin/menu")
@CacheConfig(cacheNames = "menu")
@Transactional
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private RoleMenuService roleMenuService;


    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private MySecurityMetadataSource mySecurityMetadataSource;

    @RequestMapping(value = "/getMenuList",method = RequestMethod.GET)
    @ApiOperation(value = "获取用户页面菜单数据")
    @SystemLog(description = "获取用户页面菜单数据",type = LogType.OPERATION)
    public Result<List<Menu>> getAllMenuList(){

        List<Menu> list = new ArrayList<>();
        // 读取缓存
        User u = securityUtil.getCurrUser();
        String key = "menu::userMenuList:" + u.getId();
////        String v = redisTemplate.opsForValue().get(key);
//        if(StrUtil.isNotBlank(v)){
//            list = new Gson().fromJson(v, new TypeToken<List<Menu>>(){}.getType());
//            return new ResultUtil<List<Menu>>().setData(list);
//        }

        // 用户所有权限 已排序去重
        list = menuService.findByUserId(u.getId());

        List<Menu> menuList = new ArrayList<>();
        //筛选一级页面
        for(Menu p : list){
            if(CommonConstant.PERMISSION_PAGE.equals(p.getType())&&CommonConstant.LEVEL_ONE.equals(p.getLevel())){
                menuList.add(p);
            }
        }
        //筛选二级页面
        List<Menu> secondMenuList = new ArrayList<>();
        for(Menu p : list){
            if(CommonConstant.PERMISSION_PAGE.equals(p.getType())&&CommonConstant.LEVEL_TWO.equals(p.getLevel())){
                secondMenuList.add(p);
            }
        }
        //筛选二级页面拥有的按钮权限
        List<Menu> buttonPermissions = new ArrayList<>();
        for(Menu p : list){
            if(CommonConstant.PERMISSION_OPERATION.equals(p.getType())&&CommonConstant.LEVEL_THREE.equals(p.getLevel())){
                buttonPermissions.add(p);
            }
        }

        //匹配二级页面拥有权限
        for(Menu p : secondMenuList){
            List<String> permTypes = new ArrayList<>();
            for(Menu pe : buttonPermissions){
                if(p.getId().equals(pe.getParentId())){
                    permTypes.add(pe.getButtonType());
                }
            }
            p.setPermTypes(permTypes);
        }
        //匹配一级页面拥有二级页面
        for(Menu p : menuList){
            List<Menu> secondMenu = new ArrayList<>();
            for(Menu pe : secondMenuList){
                if(p.getId().equals(pe.getParentId())){
                    secondMenu.add(pe);
                }
            }
            p.setChildren(secondMenu);
        }

        // 缓存
//        redisTemplate.opsForValue().set(key, new Gson().toJson(menuList));
        return new ResultUtil<List<Menu>>().setData(menuList);
    }

    @RequestMapping(value = "/getAllList",method = RequestMethod.GET)
    @ApiOperation(value = "获取权限菜单树")
    @SystemLog(description = "获取权限菜单树",type = LogType.OPERATION)
    public Result<List<Menu>> getAllList(){

        //一级
        List<Menu> list = menuService.findByLevelOrderBySortOrder(CommonConstant.LEVEL_ONE);
        //二级
        for(Menu p1 : list){
            List<Menu> children1 = menuService.findByParentIdOrderBySortOrder(p1.getId());
            p1.setChildren(children1);
            //三级
            for(Menu p2 : children1){
                List<Menu> children2 = menuService.findByParentIdOrderBySortOrder(p2.getId());
                p2.setChildren(children2);
            }
        }
        return new ResultUtil<List<Menu>>().setData(list);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加")
    @CacheEvict(key = "'menuList'")
    @SystemLog(description = "添加菜单",type = LogType.OPERATION)
    public Result<Menu> add(@RequestBody Menu menu){

        // 判断拦截请求的操作权限按钮名是否已存在
        if(CommonConstant.PERMISSION_OPERATION.equals(menu.getType())){
            List<Menu> list = menuService.findByTitle(menu.getTitle());
            if(list!=null&&list.size()>0){
                return new ResultUtil<Menu>().setErrorMsg("名称已存在");
            }
        }
        menuService.insert(menu);
        //重新加载权限
        mySecurityMetadataSource.loadResourceDefine();
        //手动删除缓存
        redisTemplate.delete("menu::allList");
        return new ResultUtil<Menu>().setData(menu);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "编辑")
    @SystemLog(description = "编辑菜单",type = LogType.OPERATION)
    public Result<Menu> edit(@RequestBody Menu menu){

        // 判断拦截请求的操作权限按钮名是否已存在
        if(CommonConstant.PERMISSION_OPERATION.equals(menu.getType())){
            // 若名称修改
            Menu p = menuService.get(menu.getId());
            if(!p.getTitle().equals(menu.getTitle())){
                List<Menu> list = menuService.findByTitle(menu.getTitle());
                if(list!=null&&list.size()>0){
                    return new ResultUtil<Menu>().setErrorMsg("名称已存在");
                }
            }
        }
         menuService.update(menu);
        //重新加载权限
        mySecurityMetadataSource.loadResourceDefine();
        //手动批量删除缓存
        Set<String> keys = redisTemplate.keys("userMenu:" + "*");
        redisTemplate.delete(keys);
        Set<String> keysUser = redisTemplate.keys("user:" + "*");
        redisTemplate.delete(keysUser);
        Set<String> keysUserMenu = redisTemplate.keys("menu::userMenuList:*");
        redisTemplate.delete(keysUserMenu);
        redisTemplate.delete("menu::allList");
        return new ResultUtil<Menu>().setData(menu);
    }

    @RequestMapping(value = "/delByIds/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "批量通过id删除")
    @CacheEvict(key = "'menuList'")
    @SystemLog(description = "批量删除菜单",type = LogType.OPERATION)
    public Result<Object> delByIds(@PathVariable String[] ids){

        for(String id:ids){
            List<RoleMenu> list = roleMenuService.findByMenuId(id);
            if(list!=null&&list.size()>0){
                return new ResultUtil<Object>().setErrorMsg("删除失败，包含正被角色使用关联的菜单或权限");
            }
        }
        for(String id:ids){
            menuService.delete(id);
        }
        //重新加载权限
        mySecurityMetadataSource.loadResourceDefine();
        //手动删除缓存
        redisTemplate.delete("menu::allList");
        return new ResultUtil<Object>().setSuccessMsg("批量通过id删除数据成功");
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ApiOperation(value = "搜索菜单")
    public Result<List<Menu>> searchPermissionList(@RequestParam String title){
        List<Menu> list = menuService.findByTitleLikeOrderBySortOrder("%"+title+"%");
        return new ResultUtil<List<Menu>>().setData(list);
    }
}
