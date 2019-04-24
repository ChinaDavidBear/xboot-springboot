package com.gengyu.modules.sys.dao;

import com.gengyu.base.CrudDao;
import com.gengyu.modules.sys.entity.RoleOffice;

import java.util.List;

/**
 * 角色部门数据处理层
 * @author Exrick
 */
public interface RoleOfficeDao extends CrudDao<RoleOffice> {

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RoleOffice> findByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param officeId
     */
    void deleteByOfficeId(String officeId);
}