package com.servlet.core;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;

public abstract class Action extends HttpServlet {

	private static final long serialVersionUID = -6364076184899338424L;
	private static Logger log=Logger.getLogger(Action.class);

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// 防止IE缓存
		resp.setHeader("Pragma", "No-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);
		resp.setContentType("text/html;charset=utf-8");

		String methodName = null != req.getParameter("action") ? req.getParameter("action") : "index";

		Class<? extends Action> clazz = this.getClass();

		// 访问一个带Mapping参数的方法
		Method method = null;
		try {
			method = clazz.getDeclaredMethod(methodName, Mapping.class);
			//System.out.print(method+"\t");
		} catch (NoSuchMethodException e) {
			log.error("没有这样的方法"+methodName+"()");
			req.getRequestDispatcher("WEB-INF/error/404.jsp").forward(req, resp);
		} catch (SecurityException e) {
			log.error("安全异常"+new Date());
		}
		
		try {
			if (null != method) {
				method.invoke(this, new Mapping(req, resp));
			}
		} catch (IllegalAccessException e) {
			log.error("安全权限异常"+new Date());
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			log.error("非法参数异常");
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			log.error("被调用的方法"+methodName+"()内部抛出了异常而没有被捕获");
			e.printStackTrace();
		}
	}

	public abstract void index(Mapping map) throws ServletException, IOException;

	/***************************************************************************/
	public class Mapping {
		private HttpServletRequest request;
		private HttpServletResponse response;

		public Mapping(HttpServletRequest request, HttpServletResponse response) {
			this.request = request;
			this.response = response;
		}

		/**
		 * 得到请求参数
		 * @param param
		 * @return
		 */
		public String getString(String param) {
			return null != request.getParameter(param) ? request.getParameter(param) : "";
		}

	    /**
	           * 得到请求参数数组
	     * @param param
	     * @return
	     */
		public String[] getStringArray(String param) {
			return request.getParameterValues(param);
		}

		public int getInt(String param) {
			int re = 0;
			String str = this.getString(param);
			if (str.matches("\\d+")) {
				re = Integer.parseInt(str);
			}
			return re;
		}

		public long getLong(String param) {
			long re = 0;
			String str = this.getString(param);
			if (str.matches("\\d+")) {
				re = Long.parseLong(str);
			}
			return re;
		}

		public int[] getIntArray(String param) {
			int[] re = null;
			String[] strs = this.getStringArray(param);
			if (null != strs && strs.length > 0) {
				re = new int[strs.length];
				for (int i = 0; i < strs.length; i++) {
					if (null != strs[i] && strs[i].matches("\\d+")) {
						re[i] = Integer.parseInt(strs[i]);
					} else {
						re[i] = 0;
					}
				}
			}
			return re;
		}

		/**
		 * 自动填充JavaBean的参数值
		 * 注意：1.要使个方法发挥作用，HTML代码中input的name的名字必须和JavaBean中的名字对应
		 *       2.当input的参数是一组值时，应该单独设置他们的值。
		 * @param bean
		 */
		public void getBean(Object bean) {
			Class<? extends Object> clazz = bean.getClass();
			Field[] all = clazz.getDeclaredFields();    //列出该JavaBean中的所有属性
			if (null != all && all.length > 0) {
				try {
					for (Field field : all) {
						field.setAccessible(true);
						String fname = field.getName();     //读取属性名
						Class<?> type = field.getType();   //读取属性的类型
						String param = this.getString(fname);  //读取request头部的参数值
						if (type == String.class) {
							field.set(bean, param);
						} else if (type == Integer.class || type == int.class || type == Integer.TYPE) {
							field.set(bean, this.getInt(fname));
						} else if (type == Long.class || type == long.class || type == Long.TYPE) {
							if (param.matches("\\d+"))
								field.set(bean, Long.parseLong(param));
						} else if (type == Date.class) {
							if (param.matches("\\d{4}[-]\\d{2}[-]\\d{2}[ ]\\d{2}[:]\\d{2}[:]\\d{2}")) {
								field.set(bean, new SimpleDateFormat("yyyyMMdd hhmmss").parse(param));
							}
						}
					}
				} catch (IllegalArgumentException | IllegalAccessException e) {
					Logger.getLogger(this.getClass()).error("得到Bean对象出错!");
					e.printStackTrace();
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}

		public Object getAttr(String key) {
			return null != request.getParameter(key) ? request.getParameter(key) : "";
		}

		public void setAttr(String key, Object value) {
			request.setAttribute(key, value);
		}
		
		/**
		 * 移除属性
		 * @param name
		 */
		public void removeAttr(String name) {
			request.removeAttribute(name);
		}

		public void forward(String path) throws ServletException, IOException {
			request.getRequestDispatcher(path).forward(request, response);
		}

		public void redirect(String path) throws ServletException, IOException {
			response.sendRedirect(path);
		}

		/**
		 * 输出JSON字符串
		 * 
		 * @param obj
		 * @throws ServletException
		 * @throws IOException
		 */
		public String getJson(Object obj) throws ServletException, IOException {
			response.setContentType("text/htmlcharset=utf-8");
			return JSON.toJSONString(obj);
		}

		public Object getSessionAttr(String param) {
			return request.getSession().getAttribute(param);
		}

		public void setSessionAttr(String key, Object value) {
			request.getSession().setAttribute(key, value);
		}

		public void removeSessionAttr(String key) {
			request.getSession().removeAttribute(key);
		}

		public void invalidateSession() {
			request.getSession().invalidate();
		}

		/**
		 * 获得站点根路径URL
		 * 
		 * @return
		 */
		public String getRootPath() {
			return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/";
		}

		/**
		 * 删除指定的文件
		 * 
		 * @param path
		 */
		public void deleteFile(String path) {
			int index = path.indexOf(request.getContextPath());
			String realPath = request.getServletContext().getRealPath(index + request.getContextPath() + 1);
			File file = new File(realPath);
			file.delete();
		}

		public HttpServletRequest getRequest() {
			return request;
		}

		public void setRequest(HttpServletRequest request) {
			this.request = request;
		}

		public HttpServletResponse getResponse() {
			return response;
		}

		public void setResponse(HttpServletResponse response) {
			this.response = response;
		}

	}// end Mapping

}
