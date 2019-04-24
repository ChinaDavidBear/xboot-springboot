package com.gengyu.modules.sys.controller;

import com.gengyu.common.annotation.SystemLog;
import com.gengyu.common.enums.LogType;
import com.gengyu.common.utils.ResultUtil;
import com.gengyu.common.vo.Result;
import com.gengyu.modules.sys.entity.Role;
import com.gengyu.modules.sys.entity.RoleMenu;
import com.gengyu.modules.sys.entity.RoleOffice;
import com.gengyu.modules.sys.entity.UserRole;
import com.gengyu.modules.sys.service.RoleMenuService;
import com.gengyu.modules.sys.service.RoleOfficeService;
import com.gengyu.modules.sys.service.RoleService;
import com.gengyu.modules.sys.service.UserRoleService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;


/**
 * @author Exrickx
 */
@Slf4j
@RestController
@Api(description = "角色管理接口")
@RequestMapping("/admin/role")
@Transactional(rollbackFor = RuntimeException.class)
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleMenuService roleMenuService;

    @Autowired
    private RoleOfficeService roleOfficeService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/getAllList",method = RequestMethod.GET)
    @ApiOperation(value = "获取全部角色")
    @SystemLog(description = "获取全部角色",type = LogType.OPERATION)
    public Result<Object> roleGetAll(){
        List<Role> list = roleService.findList(new Role());
        return new ResultUtil<Object>().setData(list);
    }

    @RequestMapping(value = "/getAllByPage",method = RequestMethod.GET)
    @ApiOperation(value = "分页获取角色")
    @SystemLog(description = "分页获取角色",type = LogType.OPERATION)
    public Result<PageInfo<Role>> getRoleByPage(Role role,Integer pageNo,Integer pageSize){
        PageInfo<Role> list = roleService.findPage(role,pageNo,pageSize);;
        for(Role roles : list.getList()){
            // 角色拥有权限
            List<RoleMenu> permissions = roleMenuService.findByRoleId(roles.getId());
            roles.setMenuList(permissions);
            // 角色拥有数据权限
            List<RoleOffice> departments = roleOfficeService.findByRoleId(roles.getId());
            roles.setOfficeList(departments);
        }
        return new ResultUtil<PageInfo<Role>>().setData(list);
    }

    @RequestMapping(value = "/setDefault",method = RequestMethod.POST)
    @ApiOperation(value = "设置或取消默认角色")
    @SystemLog(description = "设置或取消默认角色",type = LogType.OPERATION)
    public Result<Object> setDefault(@RequestParam String id,
                                     @RequestParam Boolean isDefault){

        Role role = roleService.get(id);
        if(role==null){
            return new ResultUtil<Object>().setErrorMsg("角色不存在");
        }
        role.setDefaultRole(isDefault);
        roleService.update(role);
        return new ResultUtil<Object>().setSuccessMsg("设置成功");
    }

    @RequestMapping(value = "/editRolePerm",method = RequestMethod.POST)
    @ApiOperation(value = "编辑角色分配菜单权限")
    @SystemLog(description = "角色分配菜单权限",type = LogType.OPERATION)
    public Result<Object> editRolePerm(@RequestParam String roleId,
                                       @RequestParam(required = false) String[] permIds){

        //删除其关联权限
        roleMenuService.deleteByRoleId(roleId);
        //分配新权限
        for(String permId : permIds){
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(permId);
            roleMenuService.insert(roleMenu);
        }
        //手动批量删除缓存
        Set<String> keysUser = redisTemplate.keys("user:" + "*");
        redisTemplate.delete(keysUser);
        Set<String> keysUserRole = redisTemplate.keys("userRole:" + "*");
        redisTemplate.delete(keysUserRole);
        Set<String> keysUserPerm = redisTemplate.keys("userMenu:" + "*");
        redisTemplate.delete(keysUserPerm);
        Set<String> keysUserMenu = redisTemplate.keys("menu::userMenuList:*");
        redisTemplate.delete(keysUserMenu);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/editRoleDep",method = RequestMethod.POST)
    @ApiOperation(value = "编辑角色分配数据权限")
    @SystemLog(description = "角色分配数据权限",type = LogType.OPERATION)
    public Result<Object> editRoleDep(@RequestParam String roleId,
                                      @RequestParam Integer dataType,
                                      @RequestParam(required = false) String[] depIds){

        Role r = roleService.get(roleId);
        r.setDataType(dataType);
        roleService.update(r);
        // 删除其关联数据权限
        roleOfficeService.deleteByRoleId(roleId);
        // 分配新数据权限
        for(String depId : depIds){
            RoleOffice roleOffice = new RoleOffice();
            roleOffice.setRoleId(roleId);
            roleOffice.setOfficeId(depId);
            roleOfficeService.insert(roleOffice);
        }
        // 手动删除相关缓存
        Set<String> keys = redisTemplate.keys("office:" + "*");
        redisTemplate.delete(keys);
        Set<String> keysUserRole = redisTemplate.keys("userRole:" + "*");
        redisTemplate.delete(keysUserRole);

        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ApiOperation(value = "保存数据")
    @SystemLog(description = "新增角色",type = LogType.OPERATION)
    public Result<Role> save(@RequestBody Role role){

        roleService.insert(role);
        return new ResultUtil<Role>().setData(role);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "更新数据")
    @SystemLog(description = "更新角色",type = LogType.OPERATION)
    public Result<Role> edit(@RequestBody Role entity){
        roleService.update(entity);
        //手动批量删除缓存
        Set<String> keysUser = redisTemplate.keys("user:" + "*");
        redisTemplate.delete(keysUser);
        Set<String> keysUserRole = redisTemplate.keys("userRole:" + "*");
        redisTemplate.delete(keysUserRole);
        return new ResultUtil<Role>().setData(entity);
    }

    @RequestMapping(value = "/delAllByIds/{ids}",method = RequestMethod.DELETE)
    @ApiOperation(value = "批量通过ids删除")
    @SystemLog(description = "批量删除角色",type = LogType.OPERATION)
    public Result<Object> delByIds(@PathVariable String[] ids){

        for(String id:ids){
            List<UserRole> list = userRoleService.findByRoleId(id);
            if(list!=null&&list.size()>0){
                return new ResultUtil<>().setErrorMsg("删除失败，包含正被用户使用关联的角色");
            }
        }
        for(String id:ids){
            roleService.delete(id);
            //删除关联菜单权限
            roleMenuService.deleteByRoleId(id);
            //删除关联数据权限
            roleOfficeService.deleteByRoleId(id);
        }
        return new ResultUtil<>().setSuccessMsg("批量通过id删除数据成功");
    }

}
