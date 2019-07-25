package com.servlet.action;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.log4j.Logger;

import com.servlet.core.Action;
import com.xzy.bean.Article;
import com.xzy.bean.Channel;
import com.xzy.bean.Country;
import com.xzy.db.core.DBManager;
import com.xzy.db.core.PageDiv;

@WebServlet(urlPatterns = {"/article"})
public class ArticleAction extends Action {

	
	private static final long serialVersionUID = -1929054972122240247L;
    private static Logger log=Logger.getLogger(Article.class);
	/**
	 * 查看文章详情
	 */
	@Override
	public void index(Mapping map) throws ServletException, IOException {
		String id=map.getString("id");
		System.out.println("id"+id);
		String sql="select name from channel where id=?";
		String sql2="select * from article where id=?";
		try {
			Article art=DBManager.query(sql2, new BeanHandler<Article>(Article.class),id);
			Channel channel=null;
			if(null!=art) {
			 channel=DBManager.query(sql,new BeanHandler<Channel>(Channel.class),art.getChannelId());
			}
			map.setAttr("channel", channel);
		    map.setAttr("art", art); 
		    map.forward("WEB-INF/pages/article_show.jsp");
		} catch (SQLException e) {
			map.forward("article?action=gotoAritcleList");
			log.error("查询文章失败"+new Date()+e);
		}
	}
	
	
	/**
	 * 去添加资讯的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAddArticle(Mapping map)throws ServletException, IOException{
		String sql1="select id,name from channel";
		String sql2="select countryId,name from country";
		List<Channel> channels=null;
		List<Country> countrys=null;
		try {
			channels=DBManager.query(sql1, new BeanListHandler<Channel>(Channel.class));
		} catch (SQLException e) {
			log.error("查询栏目失败@"+this.getClass().getName()+new Date());
		}
		
		try {
			countrys=DBManager.query(sql2, new BeanListHandler<Country>(Country.class));
		} catch (SQLException e) {
			log.error("查询国家失败！"+this.getClass().getName()+new Date());
		}
		
		HttpServletRequest request=map.getRequest();
		request.setAttribute("channels", channels);
		request.setAttribute("countrys", countrys);
		
		map.forward("WEB-INF/pages/article_add.jsp");
	}
	
	/**
	 * 去资讯管理页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void gotoAritcleList(Mapping map)throws ServletException, IOException{
		String sql1="select * from article";
		String sql2="select id,name from channel";
		List<Article> art=null;
		List<Channel> channels=null;

		try {
			 channels=DBManager.query(sql2, new BeanListHandler<Channel>(Channel.class));
		} catch (SQLException e) {
			log.error("查询栏目失败！@"+this.getClass().getName()+new Date()+e.getMessage());
		}
		
		try {
			art=DBManager.query(sql1,new BeanListHandler<Article>(Article.class));
		} catch (SQLException e) {
			log.error("查询文章失败！@"+this.getClass().getName()+new Date()+e.getMessage());
			e.printStackTrace();
		}
		PageDiv<Article> pd=DBManager.getByPage(Article.class, 1L, 20L);
		HttpServletRequest request=map.getRequest();
		request.setAttribute("art", art);
		request.setAttribute("channels", channels);
		request.setAttribute("pd", pd);

		map.forward("WEB-INF/pages/article_list.jsp");
	}
	
 /*********************************下面的是对jsp回来的数据进行处理*********************************************/	
	/**
	 * 保存文章
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveArticle(Mapping map)throws ServletException, IOException{
		Article article =new Article();
		map.getBean(article);
		String ctime=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		//System.out.println("ctime:"+ctime);
		article.setCtime(ctime);
		article.setVisits("0");   //默认访问量是0
		try {
			DBManager.add(article);
			map.setAttr("success", "添加资讯成功！");
			map.forward("article?action=index");
		} catch (SQLException e) {
			map.setAttr("error","添加资讯失败");
			log.error("增加资讯失败！"+new Date()+e.getMessage());
			map.forward("article?action=gotoAddArticle");
		}
	}
	
	
	/**
	 * 资讯管理页面的搜索
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void searchAritcle(Mapping map)throws ServletException, IOException{
		String keywords=map.getString("keywords");   //得到查询的关键字
		String sql="select * from article where keywords like ? order by id desc limit ?,?";
		String sql1="select * from article";
		String sql2="select id,name from channel";
		List<Article> art=null;
		List<Channel> channels=null;

		try {
			 channels=DBManager.query(sql2, new BeanListHandler<Channel>(Channel.class));
		} catch (SQLException e) {
			log.error("查询栏目失败！@"+this.getClass().getName()+new Date()+e.getMessage());
		}
		
		try {
			art=DBManager.query(sql1,new BeanListHandler<Article>(Article.class));
		} catch (SQLException e) {
			log.error("查询文章失败！@"+this.getClass().getName()+new Date()+e.getMessage());
		}
		
		PageDiv<Article> pd=DBManager.getByPage(sql,Article.class, 1L, 20L,"%"+keywords+"%");
		
		HttpServletRequest request=map.getRequest();
		request.setAttribute("art", art);
		request.setAttribute("pd", pd);
		request.setAttribute("channels", channels);
		
		map.forward("WEB-INF/pages/article_list.jsp");
	}
	
	/**
	 * 去修改资讯的页面
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException 
	 * @throws NumberFormatException 
	 */
	public void gotoUpdateAritcle(Mapping map)throws ServletException, IOException, NumberFormatException, SQLException{
	    String id=map.getString("id");
	    Article art=DBManager.get(Long.parseLong(id), Article.class);
		List<Country> countrys=DBManager.getAll(Country.class);
		List<Channel> channels=DBManager.getAll(Channel.class);
		map.setAttr("art", art);
		map.setAttr("countrys", countrys);
		map.setAttr("channels", channels);
		map.forward("WEB-INF/pages/article_edit.jsp");	
	}
	
	/**
	 * 保存修改后的资讯
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveUpdate(Mapping map)throws ServletException, IOException{
		String sql="update article set title=?,channelId=?,keywords=?,countryId=?,content=?,pic=?,level=? where id=?";
		Article article=new Article();
		map.getBean(article);
		try {
			DBManager.update(sql,article.getTitle(),article.getChannelId(),article.getKeywords(),article.getCountryId(),article.getContent(),article.getPic(),article.getLevel(),article.getId());
			map.setAttr("success", "修改资讯成功！");
			map.forward("article?action=gotoAritcleList");   //修改操作成功进入到资讯管理主页面
		} catch (SQLException e) {
			//修改失败返回修改页面重新修改
			map.setAttr("error","修改资讯失败！");
			map.forward("article?action=gotoUpdateAritcle");
			log.error("修改失败！@"+this.getClass()+e);
		}
	}
	
	/**
	 * 删除一条资讯
	 * @param map
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delAritcle(Mapping map)throws ServletException, IOException{
		String id=map.getString("id");
		System.out.println(id);
		try {
			DBManager.delete(Long.parseLong(id), Article.class);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.forward("article?action=gotoAritcleList");
	}
	
	
	

}
