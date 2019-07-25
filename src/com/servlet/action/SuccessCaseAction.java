package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Successful;
import com.xzy.db.core.DBManager;
/**
 * 成功的案例
 * @author Administrator
 *
 */
@WebServlet(urlPatterns = {"/success"})
public class SuccessCaseAction extends Action {

	
	private static final long serialVersionUID = -5357370418202361312L;
    private static final Logger log=Logger.getLogger(SuccessCaseAction.class); 
    
    /**
     * 去成功案例首页
     */
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		List<Successful> list=null;
		String sql="select * from successful";
		try {
			list=DBManager.query(sql, new BeanListHandler<Successful>(Successful.class));
			map.setAttr("list", list);
		} catch (SQLException e) {
			log.error("查询所有成功案例失败@"+new Date()+e);
			e.printStackTrace();
		}
        map.forward("WEB-INF/pages/success_list.jsp");
	}
	
	
	/**
	 * 去修改信息页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoEdit(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		String sql="select * from successful where id=?";
		Successful success=null;
		try {
			success=DBManager.query(sql,new BeanHandler<Successful>(Successful.class),id);
			map.setAttr("successful", success);
			map.forward("WEB-INF/pages/success_edit.jsp");
		} catch (SQLException e) {
			log.error("查询成功案例失败！"+new Date()+e);
			map.forward("success?action=index");
		}
	}
	
	/**
	 * 去添加信息页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAdd(Mapping map)throws ServletException, IOException{
		  map.forward("WEB-INF/pages/success_add.jsp");
	}
	
	/***************************************************************************/
	
	/**
	 * 保存添加的信息
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(Mapping map)throws ServletException, IOException{
		Successful successful=new Successful();
		map.getBean(successful);
		try {
			DBManager.add(successful);
			map.setAttr("success","增加新案例成功！");
			map.forward("success?action=index");
		} catch (SQLException e) {
			map.setAttr("error", "增加新案例失败！");
			map.forward("success?action=gotoAdd");
		}	
	}
	
	
	/**
	 * 删除记录
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(Mapping map)throws ServletException, IOException{
		long id=map.getLong("id");
		String sql="delete from successful where id=?";
		try {
			DBManager.update(sql,id);
			map.setAttr("success","删除成功！");
			log.info("id为"+id+"的案例在 "+new Date()+" 被删除");
		} catch (SQLException e) {
			map.setAttr("success","删除失败！");
			log.error("删除案例失败@"+new Date()+e);
		}
		map.forward("success?action=index");
	}
	
	
	public void saveEdit(Mapping map)throws ServletException,IOException{
		long id=map.getLong("id");
		Successful successful=new Successful();
		map.getBean(successful);
		
		String sql="update successful set name=?,house=?,level=?,why=?,dis=?,pic1=?,pic2=? where id=?";
		try {
			DBManager.update(sql,successful.getName(),successful.getHouse(),successful.getLevel(),successful.getWhy(),successful.getDis(),successful.getPic1(),successful.getPic2(),id);
			map.setAttr("success", "修改成功！");
			map.forward("success?action=index");
		} catch (SQLException e) {
			log.error("修改信息失败@"+new Date()+e);
			map.setAttr("error", "修改失败！");
			map.forward("success?action=gotoEdit");
		}
		
	}
	
	

}
