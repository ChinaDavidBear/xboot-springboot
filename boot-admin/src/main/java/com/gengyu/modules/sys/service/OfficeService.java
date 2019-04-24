package com.gengyu.modules.sys.service;
import com.gengyu.base.CrudService;
import com.gengyu.common.utils.SecurityUtil;
import com.gengyu.modules.sys.dao.OfficeDao;
import com.gengyu.modules.sys.entity.Office;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 部门接口实现
 */
@Slf4j
@Service
@Transactional
public class OfficeService extends CrudService<OfficeDao,Office> {

    @Autowired
    private OfficeDao officeDao;

    @Autowired
    private SecurityUtil securityUtil;


    public List<Office> findByParentIdOrderBySortOrder(String parentId, Boolean openDataFilter) {

        // 数据权限
        List<String> depIds = securityUtil.getDeparmentIds();
        if(depIds!=null&&depIds.size()>0&&openDataFilter){
            return officeDao.findByParentIdAndIdInOrderBySortOrder(parentId, depIds);
        }
        return officeDao.findByParentIdOrderBySortOrder(parentId);
    }

    public List<Office> findByParentIdAndStatusOrderBySortOrder(String parentId, Integer status) {

        return officeDao.findByParentIdAndStatusOrderBySortOrder(parentId, status);
    }

    public List<Office> findByTitleLikeOrderBySortOrder(String title, Boolean openDataFilter) {

        // 数据权限
        List<String> depIds = securityUtil.getDeparmentIds();
        if(depIds!=null&&depIds.size()>0&&openDataFilter){
            return officeDao.findByTitleLikeAndIdInOrderBySortOrder(title, depIds);
        }
        return officeDao.findByTitleLikeOrderBySortOrder(title);
    }
}