package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Country;
import com.xzy.db.core.DBManager;

@WebServlet(urlPatterns = { "/country" })
public class CountryActino extends Action {

	private static final long serialVersionUID = -14410647471169267L;
	private static final Logger log = Logger.getLogger(CountryActino.class);

	@Override
	public void index(Mapping map) throws ServletException, IOException {

		String sql = "select * from country";
		List<Country> countrys = null;
		try {
			countrys = DBManager.query(sql, new BeanListHandler<Country>(Country.class));
			map.setAttr("countrys", countrys);
		} catch (SQLException e) {
			log.error("查询所有国家失败！" + new Date() + e);
			e.printStackTrace();
		}
		map.forward("WEB-INF/pages/country_list.jsp");
	}

	public void gotoEdit(Mapping map) throws ServletException, IOException {
      
	}

	public void gotoAdd(Mapping map) throws ServletException, IOException {
		 map.forward("WEB-INF/pages/country_add.jsp");
	}

	public void saveEdit(Mapping map) throws ServletException, IOException {

	}

	public void saveAdd(Mapping map) throws ServletException, IOException {

	}

}
