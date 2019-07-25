package com.servlet.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.servlet.core.Action;
import com.xzy.bean.Admin;
import com.xzy.db.core.DBManager;
import com.xzy.fileupload.FilePart;
import com.xzy.fileupload.FileUploadUtil;

/**
 * 实现文件上传功能
 * 
 * @author Administrator
 *
 */
@WebServlet(urlPatterns = { "/fileupload" })
public class Fileupload extends Action {

	private static final long serialVersionUID = 5992446655036657660L;
	private static final Logger log = Logger.getLogger(Fileupload.class);

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		map.getResponse().setContentType("text/html;charset=utf-8");
		PrintWriter out = map.getResponse().getWriter();
		String basePath = this.getServletContext().getRealPath("uploads");
		FileUploadUtil fuu = new FileUploadUtil(map.getRequest(), 1024 * 1024 * 10,
				new String[] { ".jpg", ".bmp", ".gif", ".png" }, basePath);
		try {
			fuu.uploadFile();
			for (FilePart fp : fuu.getFilePart()) {
				if (fp.getResult() == 1) {
					out.println("超过长度");
					return;
				}
				if (fp.getResult() == 2) {
					out.println("类型不支持");
					return;
				}
			}
			if (fuu.getFilePart().size() == 1 && fuu.getFilePart().get(0).getResult() == 0) {
				FilePart fp = fuu.getFilePart().get(0);
				String sql = "insert into attach(oldname,newpath,createtime,author) values(?,?,?,?)";
				Admin admin = (Admin) map.getSessionAttr("loged");
				String author = (null != admin && null != admin.getEmail()) ? admin.getEmail() : "admin";
				String fullpath = map.getRootPath() + "uploads/" + fp.getNewname();
				DBManager.update(sql, fp.getFiledName(), fullpath, new Date(), author);
				JSONObject josn = new JSONObject();
				josn.put("error", 0);
				josn.put("url", fullpath);
				out.println(josn.toJSONString());
			}
		} catch (Exception e) {
			log.error("上传文件失败！" + e);
			e.printStackTrace();
		}
	}
	
	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}

}
