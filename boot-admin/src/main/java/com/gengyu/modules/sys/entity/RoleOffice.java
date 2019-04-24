package com.gengyu.modules.sys.entity;

import com.gengyu.base.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RoleOffice extends BaseEntity<RoleOffice> {


    @ApiModelProperty(value = "角色id")
    private String roleId;

    @ApiModelProperty(value = "部门id")
    private String officeId;
}