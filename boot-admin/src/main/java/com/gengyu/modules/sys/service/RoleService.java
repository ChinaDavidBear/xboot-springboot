package com.gengyu.modules.sys.service;

import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.RoleDao;
import com.gengyu.modules.sys.entity.Role;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色接口实现
 */
@Slf4j
@Service
@Transactional
public class RoleService extends CrudService<RoleDao, Role> {

    @Autowired
    private RoleDao roleDao;

    public List<Role> findByDefaultRole(Boolean defaultRole) {
        return roleDao.findByDefaultRole(defaultRole);
    }
}
