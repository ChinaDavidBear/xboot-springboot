package com.gengyu.config.security.filter;
import com.gengyu.common.utils.SpringUtil;
import com.gengyu.config.exception.ValidateCodeException;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author Administrator
 */

@Data
public class ValidateCodeFilter extends OncePerRequestFilter {

    private StringRedisTemplate redisTemplate=SpringUtil.getBean(StringRedisTemplate.class);
    /**
     * 请求地址
     */
    private String URL="/admin/login";

    private AuthenticationFailureHandler authenticationFailureHandler;
    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        if(StringUtils.equals(URL, httpServletRequest.getRequestURI())
                && StringUtils.equalsIgnoreCase(httpServletRequest.getMethod(), "post")) {

            try {
                // 1. 进行验证码的校验
                validate(new ServletWebRequest(httpServletRequest));
            } catch (ValidateCodeException e) {
                // 2. 如果校验不通过，调用SpringSecurity的校验失败处理器
                authenticationFailureHandler.onAuthenticationFailure(httpServletRequest, httpServletResponse, e);
                return ;
            }
        }
        // 3. 校验通过，就放行
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }
    private void validate(ServletWebRequest request) throws ServletRequestBindingException, ValidateCodeException {
      //从请求中取出之前存入session的验证码
       //获取form表单中用户输入的验证码
        String verify = ServletRequestUtils.getStringParameter(request.getRequest(), "verify");
        String captchaId = ServletRequestUtils.getStringParameter(request.getRequest(), "captchaId");
        String code=redisTemplate.opsForValue().get(captchaId);
        if (StringUtils.isBlank(verify)) {
            throw new ValidateCodeException("验证码不能为空");
        }
        if (code == null) {
            throw new ValidateCodeException("验证码不存在");
        }
        if (!StringUtils.equalsIgnoreCase(code, verify)) {
            throw new ValidateCodeException("验证码错误");
        }
    }
}
