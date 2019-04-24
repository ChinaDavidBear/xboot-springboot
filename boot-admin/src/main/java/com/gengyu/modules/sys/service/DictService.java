package com.gengyu.modules.sys.service;

import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.DictDao;
import com.gengyu.modules.sys.entity.Dict;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author: 六娃
 * @description: 字典Service
 * @create: 2018-12-21 17:18
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
    @Autowired
    private DictDao dictDao;

    /**
     * 根据类型查询字典
     * @param type
     * @return
     */
    public List<Dict> findByType(String type){
        return dictDao.findByType(type);
    }

    /**
     *
     * @param dict
     * @return
     */
    public List<Dict> findAllList(Dict dict){
        return dao.findAllList(dict);
    }
}
