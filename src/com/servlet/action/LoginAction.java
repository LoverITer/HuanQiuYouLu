package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.log4j.Logger;
import com.servlet.core.Action;
import com.xzy.bean.Admin;
import com.xzy.db.core.DBManager;
import com.xzy.utils.SHA1;

@WebServlet(urlPatterns = { "/login","/checkloin","/logout"})
public class LoginAction extends Action {

	private static final long serialVersionUID = -8580115193683110809L;
	private static Logger log = Logger.getLogger(Logger.class);

	/**
	 * 去登录页面
	 */
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		map.forward("WEB-INF/pages/login.jsp");
	}

	/**
	 * 检查密码和用户名
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkLogin(Mapping map) throws ServletException, IOException {
		String username = map.getString("uname");
		String userpwd = map.getString("upwd");
		//String rand = map.getString("rand");
		//String srand = (String) map.getSessionAttr("randomCode");

		System.out.println(username+"\t"+userpwd+"\t");
		if (username.length() > 0 && userpwd.length() > 0 ) {
			String sql = "select * from admin where email=? and upwd=?";
			try {
				Admin user = DBManager.query(sql, new BeanHandler<Admin>(Admin.class),username,SHA1.toSHA1(userpwd));
				if (null != user) {
					// 说明该用户注册过
					map.setSessionAttr("logged", user);
					map.forward("WEB-INF/pages/index.jsp");
				} else {
					// 否者就是没有注册过，那就不然他进来
					map.setAttr("err", "用户名和密码不正确！");
					map.redirect("login");    //重定向到登录页面重新登录
				}
			} catch (SQLException e) {
				System.out.println("登录失败！");
				log.error("验证用户名和密码失败！" + e);
				map.redirect("login");
			}
		} else {
			map.setAttr("err", "验证码不正确！");
			map.redirect("login");
		}

	}

	/**
	 * 退出操作
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void signOut(Mapping map) throws ServletException, IOException {
		map.removeSessionAttr("logged");
		map.invalidateSession();
		map.redirect("login");
	}
}
