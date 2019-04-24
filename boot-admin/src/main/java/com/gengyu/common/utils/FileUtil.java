package com.gengyu.common.utils;

import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;

/**
 * @author: 六娃
 * @description: 文件相关
 * @create: 2018-12-27 16:16
 */
public class FileUtil  {
   public static String getFileName(){
       long now = Instant.now().atOffset(ZoneOffset.ofHours(8)).toInstant().toEpochMilli();
       return String.valueOf(now);
   }
   public static String getServerDoMain(HttpServletRequest request){
       String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
       return basePath;
   }

   public static String upload(MultipartFile file,String subName,HttpServletRequest request){
       DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
       Calendar calendar = Calendar.getInstance();
       String dateName = df.format(calendar.getTime())+file.getOriginalFilename();
       String subPath=subName+calendar.get(Calendar.YEAR)+"/"+Integer.valueOf(calendar.get(Calendar.MONTH)+1)+"/"+calendar.get(Calendar.DATE)+"/";
       File path= null;
       try {
           path = new File(ResourceUtils.getURL("classpath:").getPath());
           File upload=new File(path.getAbsolutePath(),subPath);
           if(!upload.getParentFile().exists()){
               upload.mkdirs();
           }
           file.transferTo(new File(upload.getAbsolutePath()+"/"+dateName));
       } catch (Exception e) {
           e.printStackTrace();
       }
       return getServerDoMain(request)+subPath+dateName;
   }
}
