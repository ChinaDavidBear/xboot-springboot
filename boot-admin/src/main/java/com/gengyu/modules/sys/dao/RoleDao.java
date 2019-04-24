package com.gengyu.modules.sys.dao;

import com.gengyu.base.CrudDao;
import com.gengyu.modules.sys.entity.Role;

import java.util.List;

/**
 * 角色数据处理层
 * @author Exrickx
 */
public interface RoleDao extends  CrudDao<Role> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
