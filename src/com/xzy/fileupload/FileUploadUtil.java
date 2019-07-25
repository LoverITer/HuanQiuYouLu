package com.xzy.fileupload;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

	// 最大上传文件大小
	private long maxSize = 1024 * 1024 * 5;
	// 充许的扩展名
	private String allowExt[];
	// 允许上传的路径绝对值
	private String basePath;
	// 上传的文件记在filePart中
	private List<FilePart> filePart = new ArrayList<FilePart>();
	// 记住表单的值
	private Map<String, String> formValues = new HashMap<String, String>();

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private Random rand = new Random();
	SimpleDateFormat sdfdir = new SimpleDateFormat("yyyyMMdd");
	// 文件上传相关类
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	HttpServletRequest req;

	// 构造方法
	public FileUploadUtil(HttpServletRequest req, long maxSize, String allowExt[], String basePath) {
		this.maxSize = maxSize;
		this.allowExt = allowExt;
		this.basePath = basePath;
		this.req = req;
		upload.setHeaderEncoding("UTF-8");
	}

	// 得到文件扩展名
	public String getFileExtName(String fname) {
		String str = null;
		int index = fname.lastIndexOf(".");
		if (index != -1) {
			str = fname.toLowerCase().substring(index);// 带点
		}
		return str;
	}

	public void uploadFile() throws Exception {
		File base = new File(basePath);
		if (!ServletFileUpload.isMultipartContent(req)) {
			throw new Exception("没有要上传的内容");
		}
		if (!base.exists()) {
			throw new Exception("上传目录不存在");
		}
		if (!(base.isDirectory() && base.canWrite())) {
			throw new Exception("上传目录没有写权限");
		}

		List<FileItem> items = upload.parseRequest(req);
		Iterator<FileItem> itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			//String fileName = item.getName();
			//long fileSize = item.getSize();
			if (!item.isFormField()) {
				// 文件上传
				FilePart fp = new FilePart();
				fp.setFiledName(item.getFieldName());
				fp.setFileName(item.getName().toLowerCase());
				fp.setMime(item.getContentType());
				fp.setFilesize(item.getSize());
				// 检查
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

				try {
					// 创建文件夹目录
					String ymd = sdfdir.format(new Date());

					// this.basePath=basePath+File.separator+ymd;
					File dirFile = new File(basePath + File.separator + ymd);
					if (!dirFile.exists()) {
						dirFile.mkdirs();
					}

					String newname = ymd + rand.nextInt(1000) + getFileExtName(item.getName());
					File uploadedFile = new File(dirFile, newname);

					item.write(uploadedFile);
					fp.setNewname(ymd + "/" + newname);// 设置新名字
				} catch (Exception e) {
					e.printStackTrace();
					throw new Exception("上传失败");
				}
				filePart.add(fp);   // 加到filepart中

			} else {
				formValues.put(item.getFieldName(), item.getString("utf-8"));
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

	public void setAllowExt(String[] allowExt) {
		this.allowExt = allowExt;
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

	public Map<String, String> getFormValues() {
		return formValues;
	}

	public void setFormvalues(Map<String, String> formValues) {
		this.formValues = formValues;
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

	public HttpServletRequest getReq() {
		return req;
	}

	public void setReq(HttpServletRequest req) {
		this.req = req;
	}

}
