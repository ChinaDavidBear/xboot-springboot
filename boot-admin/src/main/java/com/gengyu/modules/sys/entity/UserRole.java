package com.gengyu.modules.sys.entity;

import com.gengyu.base.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserRole extends BaseEntity<UserRole> {


    @ApiModelProperty(value = "用户唯一id")
    private String userId;

    @ApiModelProperty(value = "角色唯一id")
    private String roleId;

    @Transient
    @ApiModelProperty(value = "角色名")
    private String roleName;
}
