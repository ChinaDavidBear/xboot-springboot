package com.gengyu.base;

import java.util.List;

public interface CrudDao<T> {

    Integer delete(String id);

    Integer deleteAll();

    Integer insert(T entity);

    T get(String id);

    List<T> findList(T entity);

    Integer update(T entity);

}
