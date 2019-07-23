package com.xzy.fileupload;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUploadUtil {

	private long maxSize = 1024 * 1024 * 5L;   // 5M
	private String allowExt[];   // 允许得到扩展名
	private String basePath;     // 允许上传的绝对路径
	private List<FilePart> filePart = new ArrayList<FilePart>(); // 上传的文件保存在FilePart中
	private Map<String, String> formvalues = new HashMap<String, String>(); // 保存表单的值
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
	private Random rand = new Random();
	private SimpleDateFormat sdfDir = new SimpleDateFormat("yyyyMMdd");
	private static String filePath;   //图片在本地磁盘上保存的绝对路径
	/*
	 * 文件上传的关键类
	 */
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	HttpServletRequest request;

	public FileUploadUtil(HttpServletRequest request, long maxSize, String[] allowExt, String baesPath) {
		this.request = request;
		this.allowExt = allowExt;
		this.basePath = baesPath;
		this.maxSize = maxSize;
		upload.setHeaderEncoding("UTF-8");
	}

	public String getFileExtName(String fname) {
		String str = null;
		int index = fname.lastIndexOf(".");
		if (index > 0) {
			str = fname.toLowerCase().substring(index); // 截取文件名的后缀名(带点)
		}
		return str;
	}

	/**
	 * <p>
	 * 文件上传核心功能
	 * <p>
	 * 
	 * @throws Exception
	 */

	@SuppressWarnings("static-access")
	public void uploadFile(String savePath) throws Exception {

		if (!upload.isMultipartContent(request)) {
			throw new Exception("没有要上传的内容");
		}
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			// 文件上传
			if (!item.isFormField()) {

				FilePart fp = new FilePart();
				// 检查文件大小
				if (item.getSize() > maxSize) {
					fp.setResult(1);
					continue;
				}
				// 检查扩展名
				if (Arrays.toString(allowExt).indexOf(getFileExtName(item.getName().toLowerCase())) == -1) {
					fp.setResult(2);
					continue;
				}

				fp.setFiledName(item.getFieldName());
				fp.setFileName(item.getName().toLowerCase());
				fp.setMime(item.getContentType());
				fp.setFilesize(item.getSize());
				
				try {
					String path1 = request.getServletContext().getRealPath(savePath);
					System.out.println(path1);
					
					
					File path = new File(savePath);
					if (!path.exists()) {
						path.mkdirs();
					}
					
					//构建图片的真正的存放路径
					File realPath=new File(path.toString() + "//" + System.currentTimeMillis()
					+ getFileExtName(item.getName()));
					
					System.out.println(realPath);
					setFilePath(realPath.toString());    //把图片在本地的保存地址保存到数据库

					item.write(realPath); // 把文件写到服务器上
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				formvalues.put(item.getFieldName(), item.getString("utf-8"));
			}
		}
	}// end uploadFile

	public long getMaxSize() {
		return maxSize;
	}

	public void setMaxSize(long maxSize) {
		this.maxSize = maxSize;
	}

	public String[] getAllowExt() {
		return allowExt;
	}

	public void setAllowExt(String[] allowEx) {
		this.allowExt = allowEx;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public List<FilePart> getFilePart() {
		return filePart;
	}

	public void setFilePart(List<FilePart> filePart) {
		this.filePart = filePart;
	}

	public Map<String, String> getFormvalues() {
		return formvalues;
	}

	public void setFormvalues(Map<String, String> formvalues) {
		this.formvalues = formvalues;
	}

	public SimpleDateFormat getSdf() {
		return sdf;
	}

	public void setSdf(SimpleDateFormat sdf) {
		this.sdf = sdf;
	}

	public Random getRand() {
		return rand;
	}

	public void setRand(Random rand) {
		this.rand = rand;
	}

	public SimpleDateFormat getSdfDir() {
		return sdfDir;
	}

	public void setSdfDir(SimpleDateFormat sdfDir) {
		this.sdfDir = sdfDir;
	}

	public FileItemFactory getFactory() {
		return factory;
	}

	public void setFactory(FileItemFactory factory) {
		this.factory = factory;
	}

	public ServletFileUpload getUpload() {
		return upload;
	}

	public void setUpload(ServletFileUpload upload) {
		this.upload = upload;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public static String getFilePath() {
		return filePath;
	}

	public void setFilePath(String Path) {
		filePath = Path;
	}

}
