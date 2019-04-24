package com.gengyu.modules.sys.dao;

import com.gengyu.base.CrudDao;
import com.gengyu.modules.sys.entity.RoleMenu;

import java.util.List;

/**
 * 角色权限数据处理层
 * @author Exrick
 */
public interface RoleMenuDao extends CrudDao<RoleMenu> {

    /**
     * 通过permissionId获取
     * @param menuId
     * @return
     */
    List<RoleMenu> findByMenuId(String menuId);

    /**
     * 通过roleId获取
     * @param roleId
     */
    List<RoleMenu> findByRoleId(String roleId);

    /**
     * 通过roleId删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

}