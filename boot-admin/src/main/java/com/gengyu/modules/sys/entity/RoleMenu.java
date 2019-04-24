package com.gengyu.modules.sys.entity;

import com.gengyu.base.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
public class RoleMenu extends BaseEntity<RoleMenu> {


    @ApiModelProperty(value = "角色id")
    private String roleId;

    @ApiModelProperty(value = "权限id")
    private String menuId;
}