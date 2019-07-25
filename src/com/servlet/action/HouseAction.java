package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Country;
import com.xzy.bean.House;
import com.xzy.db.core.DBManager;
import com.xzy.db.core.PageDiv;

@WebServlet(urlPatterns = {"/house"})
public class HouseAction extends Action {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5895243845683565888L;
    private static final Logger log=Logger.getLogger(HouseAction.class);
	
	
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		long pageNo=map.getLong("pageNo");
		PageDiv<House> pd=DBManager.getByPage(House.class, pageNo, 10L);
		map.setAttr("pd", pd);
		map.forward("WEB-INF/pages/house_list.jsp");
	}
	
	
	/**
	 * 去添加楼盘信息的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAdd(Mapping map) throws ServletException, IOException {
		List<Country> countrys=null;
		try {
			countrys=DBManager.query("select * from country where countryId=0",new BeanListHandler<Country>(Country.class));
		} catch (SQLException e) {
			log.error("查询国家信息失败！"+new Date()+e);
			e.printStackTrace();
		}
		map.setAttr("countrys", countrys);
		map.forward("WEB-INF/pages/house_add.jsp");
	}
	
	
	/**
	 * 保存提交的楼盘信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(Mapping map) throws ServletException, IOException {
		House house=new House();
		map.getBean(house);
		String[] types=map.getStringArray("types");
		StringBuilder sb=new StringBuilder();
		for(String item:types) {
			sb.append(item+" ");
		}
		house.setHousetype(sb.toString());
		
		StringBuilder sb2=new StringBuilder();
		String[] targets=map.getStringArray("target");
		for(String item:targets) {
			sb2.append(item+" ");
		} 
		house.setTarget(sb2.toString());
		house.setCtimes(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		try {
			DBManager.add(house);
			map.setAttr("success", "增加房产基本信息成功!");
			map.forward("house?action=index&pageNo=1");   //添加成功后自动跳转第一页
		} catch (SQLException e) {
			map.setAttr("error", "增加房产基本信息失败!");
			map.forward("house?action=gotoAdd");
		}
	}

}
