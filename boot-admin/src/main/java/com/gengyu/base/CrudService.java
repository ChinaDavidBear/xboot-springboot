package com.gengyu.base;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends BaseEntity<T>>  {
    /**
     * 日志对象
     */
    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    @Transactional(readOnly = false)
    public Integer insert(T entity) {
        entity.setId(String.valueOf(UUID.randomUUID()).replace("-",""));
        return dao.insert(entity);
    }

    @Transactional(readOnly = false)
    public Integer delete(String id) {
        return dao.delete(id);
    }

    @Transactional(readOnly = false)
    public Integer deleteAll() {
        return dao.deleteAll();
    }

    @Transactional(readOnly = false)
    public Integer update(T entity) {
        return dao.update(entity);
    }

    public T get(String id) {
        return dao.get(id);
    }

    /**
     * 全量列表
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return dao.findList(entity);
    }

    /**
     * 分页列表
     * @param entity
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<T> findPage(T entity, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<T> pageInfo = new PageInfo<T>(dao.findList(entity));
        return pageInfo;
    }
}
