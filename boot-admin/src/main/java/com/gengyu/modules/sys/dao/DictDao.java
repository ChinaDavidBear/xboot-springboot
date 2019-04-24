package com.gengyu.modules.sys.dao;

import com.gengyu.base.CrudDao;
import com.gengyu.modules.sys.entity.Dict;

import java.util.List;

/**
 * @author: 六娃
 * @description: 字典接口
 * @create: 2018-12-21 17:17
 */
public interface DictDao extends CrudDao<Dict> {
    /**
     * 根据字典类型查询
     * @param type
     * @return
     */
    List<Dict> findByType(String type);

    /**
     * 查询全部字典
     * @param dict
     * @return
     */
    List<Dict> findAllList(Dict dict);
}
