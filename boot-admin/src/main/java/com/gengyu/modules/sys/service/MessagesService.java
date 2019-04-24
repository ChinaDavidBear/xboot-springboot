package com.gengyu.modules.sys.service;

import com.gengyu.base.CrudService;
import com.gengyu.modules.sys.dao.MessageDao;
import com.gengyu.modules.sys.entity.Messages;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 消息实现
 */
@Slf4j
@Service
@Transactional
public class MessagesService extends CrudService<MessageDao, Messages> {
}
