package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Admin;
import com.xzy.db.core.DBManager;
import com.xzy.utils.SHA1;

@WebServlet(urlPatterns = { "/admin"})
public class AdminAction extends Action {

	private static final long serialVersionUID = 7476198607380882032L;
	private static Logger log = Logger.getLogger(AdminAction.class);

	/**
	 * 查找所有的管理员
	 */
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		try {
			List<Admin> list = DBManager.query("select * from admin", new BeanListHandler<Admin>(Admin.class));
			map.setAttr("list", list);
		} catch (SQLException e) {
			System.out.println("查询管理员失败！" + e);
			log.error("查询管理员失败！" + e);
		}
		map.forward("WEB-INF/pages/admin_manager.jsp");
	}

	/**
	 * 增加管理员
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(Mapping map) throws ServletException, IOException {
		Admin admin = new Admin();
		HttpServletRequest req = map.getRequest();
		String email = null != req.getParameter("uname") ? req.getParameter("uname") : "";
		String pwd = null != req.getParameter("upwd") ? req.getParameter("upwd") : "";
		String pwdAgain = null != req.getParameter("upwdAgain") ? req.getParameter("upwdAgain") : "";
		System.out.println(email + "\t" + pwd + "\t" + pwdAgain);
		if (pwd.length() > 0 && pwdAgain.length() > 0 && pwdAgain.equals(pwd)) {
			admin.setEmail(email);
			admin.setUpwd(pwd);
			admin.setUpur("001"); // 管理员的默认权限是一般管理员
			String sql = "insert into admin(email,upwd,upur) values(?,?,?)";
			try {
				DBManager.update(sql, admin.getEmail(), SHA1.toSHA1(admin.getUpwd()), admin.getUpur());
				log.info("新用户注册成功！"+new Date());
				map.forward("WEB-INF/pages/login.jsp");   //注册成功
			} catch (SQLException e) {
				log.error("增加管理员失败!" + e);
				map.redirect("admin/signup");
			}
		}else {
			log.error("两次输入的密码不一致"+new Date());
			map.redirect("admin/signup");
		}
	}

	/**
	 * 更新管理员信息
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void update(Mapping map) throws ServletException, IOException {

	}

	/**
	 * 删除管理员
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(Mapping map) throws ServletException, IOException {

	}
	
	
	/**
	 * 去主页欢迎页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoWelcomePage(Mapping map)throws ServletException, IOException{
		map.forward("WEB-INF/pages/welcome.jsp");
	}
	
	/**
	 * 管理员管理界面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAdminManagerPage(Mapping map)throws ServletException, IOException{
		map.forward("WEB-INF/pages/admin_manager.jsp");
	}
	
	
	

}
