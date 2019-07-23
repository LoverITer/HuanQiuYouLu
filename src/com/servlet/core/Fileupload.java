package com.servlet.core;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;

import com.xzy.fileupload.FileUploadUtil;

/**
 * 实现文件上传功能
 * @author Administrator
 *
 */
@WebServlet(urlPatterns = {"/fileupload"})
public class Fileupload extends Action{

	private static final long serialVersionUID = 5992446655036657660L;
    private static Logger log=Logger.getLogger(Fileupload.class);
    
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		FileUploadUtil fuu=new FileUploadUtil(map.getRequest(), 1024*1024, new String[] {".gif",".jpg",".png"}, map.getRootPath());
		try {
			fuu.uploadFile("D://uploads//");
		} catch (Exception e) {
			log.error("文件上传失败！"+new Date()+e);
			e.printStackTrace();
		}
				
				
				
	}

}
