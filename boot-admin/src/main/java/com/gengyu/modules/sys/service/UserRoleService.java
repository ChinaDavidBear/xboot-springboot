package com.gengyu.modules.sys.service;
import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.UserRoleDao;
import com.gengyu.modules.sys.entity.Role;
import com.gengyu.modules.sys.entity.UserRole;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户角色接口实现
 */
@Slf4j
@Service
@Transactional
public class UserRoleService extends CrudService<UserRoleDao, UserRole> {

    @Autowired
    private UserRoleDao userRoleDao;

    public List<UserRole> findByRoleId(String roleId) {
        return userRoleDao.findByRoleId(roleId);
    }

    public void deleteByUserId(String userId) {
        userRoleDao.deleteByUserId(userId);
    }

    public List<Role> findByUserId(String userId) {
        return userRoleDao.findByUserId(userId);
    }

    public List<String> findDepIdsByUserId(String userId){
        return userRoleDao.findDepIdsByUserId(userId);
    }

}
