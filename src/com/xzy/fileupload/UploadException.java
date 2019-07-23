package com.xzy.fileupload;

/**
 * 文件上传异常，用于判断文件是否上传成功
 * @author Administrator
 *
 */
public class UploadException extends Exception {

	private static final long serialVersionUID = -7572770932474155540L;
    public UploadException(String msg) {
		super(msg);
	}
}
