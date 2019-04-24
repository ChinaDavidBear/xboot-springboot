package com.gengyu.modules.sys.controller;

import com.gengyu.common.annotation.SystemLog;
import com.gengyu.common.constant.CommonConstant;
import com.gengyu.common.enums.LogType;
import com.gengyu.common.utils.ResultUtil;
import com.gengyu.common.vo.Result;
import com.gengyu.modules.sys.entity.Dict;
import com.gengyu.modules.sys.service.DictService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: 六娃
 * @description: 字典Controller
 * @create: 2018-12-21 17:33
 */
@Slf4j
@RestController
@RequestMapping(value = "/admin/dict")
@Api(description = "字典管理接口")
public class DictController {
    @Autowired
    private DictService dictService;
    @ApiOperation(value = "分页获取全部字典数据")
    @GetMapping(value = "/findDictList")
    public Result<Object> findDictList(Dict dict,Integer pageNo,Integer pageSize){
        PageInfo<Dict> page=dictService.findPage(dict,pageNo,pageSize);
        Map<String,Object> data=new HashMap<>(16);
        data.put("page",page);
        data.put("dictList",dictService.findAllList(dict));
        return new ResultUtil<Object>().setData(data);
    }
    @PostMapping(value = "/add")
    @ApiOperation(value = "保存字典")
    @SystemLog(description = "保存字典",type = LogType.OPERATION)
    public Result<Dict> save(@RequestBody Dict dict){
        dictService.insert(dict);
        return new ResultUtil().setSuccessMsg("保存成功");
    }
    @PostMapping(value = "/edit")
    @ApiOperation(value = "编辑字典")
    @SystemLog(description = "编辑字典",type = LogType.OPERATION)
    public Result<Dict> edit(@RequestBody Dict dict){
        dictService.update(dict);
        return new ResultUtil().setSuccessMsg("修改成功");
    }
    @DeleteMapping(value = "/delByIds/{ids}")
    @ApiOperation(value = "删除字典")
    @SystemLog(description = "批量删除字典",type = LogType.OPERATION)
    public Result<Object> edit(@PathVariable String[] ids){
        for(String id :ids){
            dictService.delete(id);
        }
        return new ResultUtil().setSuccessMsg("删除字典成功");
    }
    @ApiOperation(value = "分页获取全部字典数据")
    @GetMapping(value = "/findDictByType")
    public Result<Object> findDictByType(String type){
        List<Dict> list=dictService.findByType(type);
        return new ResultUtil<>().setData(list);
    }
    @PostMapping(value = "/enableDict")
    @ApiOperation(value = "启用/禁用字典")
    @SystemLog(description = "启用/禁用字典",type = LogType.OPERATION)
    public Result<Dict> enableDict(Dict dict){
        Integer status=dict.getStatus().equals(CommonConstant.STATUS_NORMAL)?CommonConstant.STATUS_DISABLE:CommonConstant.STATUS_NORMAL;
        dict.setStatus(status);
        dictService.update(dict);
        return new ResultUtil().setSuccessMsg("操作成功");
    }
}
