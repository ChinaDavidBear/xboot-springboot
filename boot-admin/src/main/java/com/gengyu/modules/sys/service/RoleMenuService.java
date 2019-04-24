package com.gengyu.modules.sys.service;

import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.RoleMenuDao;
import com.gengyu.modules.sys.entity.RoleMenu;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色权限接口实现
 */
@Slf4j
@Service
@Transactional
public class RoleMenuService extends CrudService<RoleMenuDao, RoleMenu> {

    @Autowired
    private RoleMenuDao roleMenuDao;


    public List<RoleMenu> findByMenuId(String menuId) {

        return roleMenuDao.findByMenuId(menuId);
    }

    public List<RoleMenu> findByRoleId(String roleId) {

        return roleMenuDao.findByRoleId(roleId);
    }

    public void deleteByRoleId(String roleId) {

        roleMenuDao.deleteByRoleId(roleId);
    }
}