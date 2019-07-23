package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Travel;
import com.xzy.db.core.DBManager;
import com.xzy.fileupload.FileUploadUtil;

@WebServlet(urlPatterns = {"/travel"})
public class TravelAction extends Action {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8438553734919399937L;
    private static final Logger log=Logger.getLogger(TravelAction.class);
	
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		
		String sql="select * from travel";
		List<Travel> lists=null;
		try {
			lists=DBManager.query(sql, new BeanListHandler<Travel>(Travel.class));
			map.setAttr("list", lists);
		} catch (SQLException e) {
			log.error("查询旅游信息失败！@"+this.getClass()+new Date()+e);
			e.printStackTrace();
		}
		map.forward("WEB-INF/pages/travel_list.jsp");
	}

	
	/**
	 * 跳转到添加的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAddTravel(Mapping map)throws ServletException, IOException{
		map.forward("WEB-INF/pages/travel_add.jsp");	
	}
	
	
	/**
	 * 跳转到修改信息的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoUpdateTravle(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		String sql="select * from travel where id=?";
		Travel travel=null;
		try {
			travel=DBManager.query(sql, new BeanHandler<Travel>(Travel.class),id);
			map.setAttr("travel", travel);
			map.forward("WEB-INF/pages/travel_edit.jsp");   //查询信息成功后跳转到修改页面
		} catch (SQLException e) {
			log.error("查询旅游信息失败！@"+new Date()+e);
			e.printStackTrace();
			map.forward("travel?action=index");  //查询失败后返回与原页面
		}
	}
	
	/**
	 * 去旅游详细信息的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void travleShow(Mapping map)throws ServletException, IOException{
		long  id=map.getLong("id");  //得到id
		String sql="select * from travel where id=?";
		Travel travel=null;
		try {
			travel=DBManager.query(sql, new BeanHandler<Travel>(Travel.class),id);
			map.setAttr("travel", travel);
			map.forward("WEB-INF/pages/travel_show.jsp");
		} catch (SQLException e) {
			log.error("查询旅游信息失败@"+this.getClass()+new Date()+e);
            map.forward("travel?action=index");
		}
	}
	
	/***************************对travel的操作****************************************/
	
	/**
	 * 保存新增的旅游信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveTravelAdd(Mapping map)throws ServletException, IOException{
		String title=map.getString("title");
		String departureTime=map.getString("departureTime");
		String city=map.getString("city");
		String visitcity=map.getString("visitcity");
		String content=map.getString("content");
		String ctime=new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		String pic=FileUploadUtil.getFilePath();
		String sql="insert into travel(title,departureTime,city,visitcity,content,issue,ctimes,pic) values(?,?,?,?,?,?,?,?)";
		try {
			DBManager.update(sql, title,departureTime,city,visitcity,content,0,ctime,pic);
			map.setAttr("success", "增加旅游成功！");
			map.forward("travel?action=index");     //增加成功跳转到旅游信息的首页
		} catch (SQLException e) {
			log.error("增加新的旅游信息失败！@"+this.getClass()+new Date()+e);
			map.setAttr("error", "增加旅游失败！");
			map.forward("travel?action=gotoAddTravel");   //增加失败，还是在增加的页面
		}
	}
	
	/**
	 * 保存修改的旅游信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateTravle(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		String title=map.getString("title");
		String departureTime=map.getString("departureTime");
		String city=map.getString("city");
		String visitcity=map.getString("visitcity");
		String content=map.getString("content");
		String pic=FileUploadUtil.getFilePath();
		String sql="update travel set title=?,departureTime=?,city=?,visitcity=?,content=?,pic=? where id=?";
		try {
			DBManager.update(sql,title,departureTime,city,visitcity,content,pic,id);
			map.setAttr("success","修改旅游信息成功！");
			map.forward("travel?action=index");
		} catch (SQLException e) {
			map.setAttr("error","修改旅游信息失败！");
			log.error("修改旅游信息失败！@"+new Date()+e);
            map.forward("travel?action=gotoUpdateTravle");
		}
		
	}
	
	/**
	 * 删除旅游信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteTravle(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		String sql="delete from travel where id=?";
		try {
			DBManager.update(sql,id);
			map.setAttr("success", "删除旅游信息成功！");
			log.info("id="+id+"的记录被删除，时间："+new Date());
		} catch (SQLException e) {
			log.error("删除旅游信息失败！@"+this.getClass()+new Date()+e);
			map.setAttr("error", "删除旅游信息失败！");
			e.printStackTrace();
		}
		map.forward("travel?action=index");
	}
	
	
	/**
	 * 禁用/启用旅游信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void disableTravel(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		int display=map.getInt("display");
		String sql="update travel set issue=? where id=?";
		try {
			DBManager.update(sql,display,id);
			if(display==0) {
				map.setAttr("success", "启用成功！");
			}else {
				map.setAttr("success", "禁用成功！");
			}
		} catch (SQLException e) {
			map.setAttr("error", "禁用失败！");
			log.error("禁用失败！@"+this.getClass()+new Date()+e);
		}
		map.forward("travel?action=index");
	}
	
	/**
	 * 发布旅游信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void issueTravle(Mapping map)throws ServletException, IOException{
		
	}
	
	
}
