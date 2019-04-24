package com.gengyu.modules.sys.service;

import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.LogDao;
import com.gengyu.modules.sys.entity.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 日志接口实现
 */
@Slf4j
@Service
@Transactional
public class LogService extends CrudService<LogDao, Log> {

}
