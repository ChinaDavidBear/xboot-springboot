package com.gengyu.modules.sys.controller;

import com.gengyu.common.annotation.SystemLog;
import com.gengyu.common.enums.LogType;
import com.gengyu.common.utils.ResultUtil;
import com.gengyu.common.vo.Result;
import com.gengyu.modules.sys.entity.Dict;
import com.gengyu.modules.sys.entity.Messages;
import com.gengyu.modules.sys.service.MessagesService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@Api(description = "消息管理接口")
@RequestMapping("/admin/message")
public class MessageController {


  @Autowired
  private MessagesService messagesService;


  @PostMapping(value = "/add")
  @ApiOperation(value = "保存消息")
  @SystemLog(description = "保存消息",type = LogType.OPERATION)
  public Result<Dict> save(@RequestBody Messages messages){
    messagesService.insert(messages);
    return new ResultUtil().setSuccessMsg("保存成功");
  }
  @PostMapping(value = "/edit")
  @ApiOperation(value = "编辑消息")
  @SystemLog(description = "编辑消息",type = LogType.OPERATION)
  public Result<Dict> edit(@RequestBody Messages messages){
    messagesService.update(messages);
    return new ResultUtil().setSuccessMsg("修改成功");
  }


  @RequestMapping(value = "/getAllByPage",method = RequestMethod.GET)
  @ApiOperation(value = "分页获取全部")
  public Result<PageInfo<Messages>> getAllByPage(@ModelAttribute Messages messages, Integer pageNo, Integer pageSize){
    PageInfo<Messages> logs = messagesService.findPage(messages, pageNo, pageSize);
    return new ResultUtil<PageInfo<Messages>>().setData(logs);
  }

  @RequestMapping(value = "/delByIds/{ids}",method = RequestMethod.DELETE)
  @ApiOperation(value = "批量删除")
  public Result<Object> delByIds(@PathVariable String[] ids){
    for(String id : ids){
      messagesService.delete(id);
    }
    return new ResultUtil<Object>().setSuccessMsg("删除成功");
  }

  @RequestMapping(value = "/delAll",method = RequestMethod.DELETE)
  @ApiOperation(value = "全部删除")
  public Result<Object> delAll(){
    messagesService.deleteAll();
    return new ResultUtil<Object>().setSuccessMsg("删除成功");
  }
}
