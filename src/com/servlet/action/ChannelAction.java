package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Channel;
import com.xzy.db.core.DBManager;

@WebServlet(urlPatterns = { "/channel" })
public class ChannelAction extends Action {

	private static final long serialVersionUID = -2219015976752979899L;
	private static final Logger log = Logger.getLogger(Channel.class);

	/**
	 * 去栏目管理页面
	 */
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		try {
			List<Channel> lists = DBManager.getAll(Channel.class);
			map.setAttr("allc", lists);
			map.forward("WEB-INF/pages/channel_list.jsp");
		} catch (SQLException e) {
			map.forward("WEB-INF/pages/article_list.jsp");
			log.error("查询所有栏目失败@" + this.getClass() + new Date() + e);
			e.printStackTrace();
		}
	}

	/**
	 * 保存新增的栏目
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 */
	public void saveChannel(Mapping map) throws ServletException, IOException, SQLException {

		String name = map.getString("name");
		String path = map.getString("path");
		long level = map.getLong("level");
		Channel channel = new Channel();
		channel.setName(name);
		channel.setLevel(level);
		channel.setPath(path);
		String sql = "insert into channel(name,level,path) values(?,?,?)";
		try {
			DBManager.update(sql, name, level, path);
			map.setAttr("success", "添加新栏目成功");
		} catch (SQLException e) {
			map.setAttr("error", "抱歉！添加新栏目失败");
			log.error("新增栏目失败！@" + this.getClass() + new Date() + e);
		} catch (Exception e) {
			log.error("添加新栏目失败" + e);
		}
		map.forward("channel?action=index");
	}

	/**
	   * 修改栏目信息
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateChannel(Mapping map) throws ServletException, IOException {
		long id = map.getLong("id");
		String name = map.getString("name");
		String level = map.getString("level");
		String path = map.getString("path");
		String sql = "update channel set name=?,level=?,path=? where id=?";
		try {
			DBManager.update(sql, name, level, path, id);
			map.setAttr("success", "修改成功！");
		} catch (SQLException e) {
			map.setAttr("error", "修改失败！");
			e.printStackTrace();
		}
		map.forward("channel?action=index");
	}

	/**
	 * 删除栏目
	 * 
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteChannel(Mapping map) throws ServletException, IOException {
		long id = map.getLong("id");
		String sql = "delete from channel where id=?";
		try {
			DBManager.update(sql, id);
			map.setAttr("success", "删除成功！");
		} catch (SQLException e) {
			map.setAttr("error", "删除失败！");
			log.error("删除失败！@" + this.getClass() + new Date() + e);
		}
		map.forward("channel?action=index");
	}

}
