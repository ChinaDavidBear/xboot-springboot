package com.gengyu.config.security.listen;

import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextListener;

import java.util.EventListener;

/**
 * @author Administrator
 */
@Configuration
public class RequestListener {
    @Bean
    public ServletListenerRegistrationBean<EventListener> getListener(){
        ServletListenerRegistrationBean<EventListener> registrationBean
                =new ServletListenerRegistrationBean<>();
        registrationBean.setListener(new RequestContextListener());
               registrationBean.setOrder(1);
        return registrationBean;
    }
}
