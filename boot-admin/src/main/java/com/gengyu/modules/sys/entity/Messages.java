package com.gengyu.modules.sys.entity;

import com.gengyu.base.BaseEntity;
import com.gengyu.common.utils.ObjectUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Map;

@Data
public class Messages extends BaseEntity<Messages> {


  @ApiModelProperty(value = "消息名称")
  private String title;

  @ApiModelProperty(value = "消息内容")
  private String context;

  private String startDate;

  private String endDate;
  @ApiModelProperty(value = "请求参数")
  private String requestParam;
  /**
   * 转换请求参数为Json
   * @param paramMap
   */
  public void setMapToParams(Map<String, String[]> paramMap) {

    this.requestParam = ObjectUtil.mapToString(paramMap);
  }

}
