package com.gengyu.modules.sys.controller;

import com.gengyu.common.utils.FileUtil;
import com.gengyu.common.utils.ResultUtil;
import com.gengyu.common.utils.SpringUtil;
import com.gengyu.common.vo.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @author: 六娃
 * @description: 上传文件
 * @create: 2018-12-27 11:32
 */
@RestController
@RequestMapping(value = "/admin/common/upload")
public class UploadController  {
     @Value("${file.path}")
     private String uploadFile;
    @PostMapping(value = "/uploadFile")
    public Result<Object> uploadImage(MultipartFile file,HttpServletRequest request){
        //保存时的文件名
        String filePath= FileUtil.upload(file,uploadFile,request);
        return new ResultUtil<Object>().setData(filePath);
    }

}
