package com.xzy.db.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;

import com.alibaba.druid.pool.DruidDataSource;
import com.hqyl.annotation.Colunm;
import com.hqyl.annotation.Exclude;
import com.hqyl.annotation.Table;

public class DBManager {

	private static Logger logger = Logger.getLogger(DBManager.class);
	private static QueryRunner run = new QueryRunner();
	private static DruidDataSource ds = null;
	private static ThreadLocal<Connection> connection = new ThreadLocal<Connection>();
	static {
		try {
			ResourceBundle res = ResourceBundle.getBundle("jdbc"); // 得到jdbc配置文件
			ds = new DruidDataSource();
			ds.setDriverClassName(res.getString("driverClassName"));
			ds.setUrl(res.getString("url"));
			ds.setPassword(res.getString("password"));
			ds.setUsername(res.getString("username"));
			ds.setFilters(res.getString("filters"));
			ds.setMaxActive(Integer.parseInt(res.getString("maxActive")));
			ds.setInitialSize(Integer.parseInt(res.getString("initialSize")));
			ds.setMaxWait(Long.parseLong(res.getString("maxWait")));
			ds.setMinIdle(Integer.parseInt(res.getString("minIdle")));
			ds.setValidationQuery("SELECT 'x'");
			ds.setTestWhileIdle(true);
			ds.setTestOnBorrow(false);
			ds.setTestOnReturn(false);
			ds.setTimeBetweenEvictionRunsMillis(600000);
		} catch (SQLException e) {
			logger.error("初始化数据库连接池失败@DBManager.static{...}" + new Date());
			System.out.println("初始化数据库连接池失败@DBManager.static{...}");
		}

	}

	/**
	 * 得到数据库连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = connection.get();
		if (null == con || con.isClosed()) {
			con = ds.getConnection();
			connection.set(con);
		}
		return con;
	}

	/**
	 * 开启事务
	 * 
	 * @throws SQLException
	 */
	public static void beginTransaction() throws SQLException {
		Connection con = connection.get();
		if (null != con) {
			throw new SQLException("事务已经开启了，不要重复开启");
		}
		con = getConnection();
		con.setAutoCommit(false);
		connection.set((Connection) connection);
	}

	/**
	 * 提交事务
	 * 
	 * @throws SQLException
	 */
	public static void commitTransaction() throws SQLException {
		Connection con = connection.get();
		if (null == con) {
			throw new SQLException("没有开启事务,不能提交事务");
		}
		// 提交事务
		con.commit();
		con.close();
		connection.remove(); // 将连接移出ThreadLocal
	}

	/**
	 * 回滚事务
	 * 
	 * @throws SQLException
	 */
	public static void rollbackTransansaction() throws SQLException {
		Connection con = connection.get();
		if (null == con) {
			throw new SQLException("没有开启事务,不能回滚事务");
		}
		con.rollback();
		con.close();
		connection.remove();
	}

	/**
	 * 关闭事务
	 * 
	 * @param connection
	 * @throws SQLException
	 */
	public static void releaseConnection(Connection connection) throws SQLException {
		Connection con = DBManager.connection.get();
		if (null != connection && con != connection) {
			connection.close();
		}
	}

	/**
	 * 关闭数据库连接池
	 */
	public static void closeDataSource() {
		if (null != ds) {
			ds.close();
		}
	}

	/*********************** 基本的增删改查操作 *****************************************/
	/**
	 * 增加一个对象
	 * 
	 * @param <T>
	 * @param t
	 * @return 返回增加的对象的id值
	 */
	public static <T> Long add(T t) throws SQLException{
		// 拼SQL语句 insert into table_name(f1,f2,f3...) values(?,?,?,?);
		TreeMap<String, Object> map = parseAllField(t);
		StringBuilder fields = new StringBuilder();
		StringBuilder querys = new StringBuilder();
		List<Object> values = new ArrayList<Object>();
		Long lastInsertID = -1L;
		if (null != map && null != map.keySet() && map.keySet().size() > 0) {
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				if (null == map.get(key))
					continue;
				fields.append(key + ",");
				querys.append("?,");
				values.add(map.get(key));
			}
		}
		if (fields.length() > 0) {
			fields.delete(fields.length() - 1, fields.length());
		}
		if (querys.length() > 0) {
			querys.delete(querys.length() - 1, querys.length());
		}
		String sql = "insert into " + getTableName(t.getClass()) + "(" + fields + ") " + "values(" + querys + ")";

		try {
			run.update(getConnection(), sql, values.toArray());
			PreparedStatement ps = getConnection().prepareStatement("select LAST_INSERT_ID()"); // 查找最新增加的一条数据的ID值
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				lastInsertID = rs.getLong(1);
			}
		} catch (SQLException e) {
			logger.error("增加数据失败@DBManager.add()" + new Date());
			System.out.println("增加数据失败@DBManager.add()");
		}
		return lastInsertID;
	}

	/**
	 * 修改对象
	 * 
	 * @param <T>
	 * @param t
	 */
	public static <T> void update(T t) throws SQLException{
		// 拼SQL语句 update table_name set fields1=?,fileds2=?.... where condition=?
		StringBuilder fields = new StringBuilder();
		StringBuilder querys = new StringBuilder();
		List<Object> values = new ArrayList<Object>();
		TreeMap<String, Object> map = new TreeMap<String, Object>();
		parseFildAndQuery(fields, values, map);
		String sql = "update " + getTableName(t.getClass()) + " set " + fields + " where id=?";
		try {
			Field id = t.getClass().getDeclaredField("id");
			values.add(id.get(t)); // 把id的值拿到
			run.update(getConnection(), sql, querys, values.toString());
		} catch (SQLException e) {
			logger.error("更新数据失败@DBManager.update()" + new Date());
			System.out.println("更新数据失败@DBManager.update()");
		} catch (NoSuchFieldException e) {
			logger.error(e);
		} catch (SecurityException e) {
			logger.error(e);
		} catch (IllegalArgumentException e) {
			logger.error(e);
		} catch (IllegalAccessException e) {
			logger.error(e);
		}
	}

	/**
	 * 删除一个对象
	 * 
	 * @param <T>
	 * @param id
	 * @param clazz
	 */
	public static <T> void delete(Long id, Class<T> clazz) throws SQLException{
		String sql = "delete from " + getTableName(clazz) + " where id=?";
		try {
			run.update(getConnection(), sql, id);
		} catch (SQLException e) {
			System.out.println("删除数据失败@DBManager.delete()");
			logger.error("删除数据失败@DBManager.delete()");
		}
	}

	/**
	 * 查询一个对象
	 * 
	 * @param <T>
	 * @param id
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T get(Long id, Class<T> clazz) throws SQLException{
		// select * from table_name where id=?;
		Object object = null;
		StringBuilder fields = new StringBuilder();
		ArrayList<Object> values = new ArrayList<Object>();
		TreeMap<String, Object> map = new TreeMap<String, Object>();
		parseFildAndQuery(fields, values, map);
		String sql = "select * from " + getTableName(clazz) + " where id=?";
		try {
			object = run.query(getConnection(), sql, new BeanHandler<T>(clazz), id);
		} catch (SQLException e) {
			System.out.println("查询数据失败！@DBManger.get()");
			logger.error("查询数据失败！@DBManger.get()" + new Date());
		}
		return (T) object;
	}

	/**
	 * 查询表中的所有数据
	 * 
	 * @param <T>
	 * @param clazz
	 * @return
	 */
	public static <T> List<T> getAll(Class<T> clazz) throws SQLException{
		// select * from table_name;
		List<T> lists = new ArrayList<T>();
		String sql = "select * from " + getTableName(clazz);
		try {
			lists = run.query(getConnection(), sql, new BeanListHandler<T>(clazz));
		} catch (SQLException e) {
			System.out.println("查询数据失败！@DBManager.getAll()");
			logger.error("查询数据失败！@DBManager.getAll()");
		}
		return lists;
	}

	/**
	 * 对全表分页查询
	 * 
	 * @param <T>
	 * @param clazz
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public static <T> PageDiv<T> getByPage(Class<T> clazz, Long pageNo, Long pageSize) {
		PageDiv<T> pageDiv = null;
		List<T> list = new ArrayList<T>();
		// 对表进行分页
		String sql = "select * from " + getTableName(clazz) + " order by id desc limit ?,?";

		try {
			// 存放分页查询的结果
			list = run.query(getConnection(), sql, new BeanListHandler<T>(clazz), (pageNo - 1) * pageSize, pageSize);
			// 查询表的总记录个数
			String sqltotal = "select count(id) from " + getTableName(clazz);
			Object re = run.query(getConnection(),sqltotal, new ScalarHandler<Long>());
			long total = 0;
			if (null != re && re instanceof Long) {
				total = (Long) re;
			}
			pageDiv = new PageDiv<T>(pageNo, pageSize, total, list);
		} catch (SQLException e) {
			logger.error("数据库分页查询失败！@Line:314");
			e.printStackTrace();
		}

		return pageDiv;
	}
	
	/**
	 * 根据传过来的SQL语句进行分表查询
	 * @param <T>   java bean
	 * @param sql   SQL语句 
	 * @param clazz  bean 的字节码
	 * @param pageNo   开始的页数
	 * @param pageSize  每页的大小
	 * @param keyword   查询的关键字
	 * @return
	 */
	public static<T> PageDiv<T> getByPage(String sql,Class<T> clazz, Long pageNo, Long pageSize,String keyword) {
		PageDiv<T> pd=null;
		List<T> list = new ArrayList<T>();
		
		try {
			// 存放分页查询的结果
			list = run.query(getConnection(), sql, new BeanListHandler<T>(clazz),keyword, (pageNo - 1) * pageSize, pageSize);
			// 查询表的总记录个数
			String sqltotal = "select count(id) from " + getTableName(clazz)+" where keywords=?";
			Object re = run.query(getConnection(),sqltotal, new ScalarHandler<Long>(),keyword);
			long total = 0;
			if (null != re && re instanceof Long) {
				total = (Long) re;
			}
			pd= new PageDiv<T>(pageNo, pageSize, total, list);
		} catch (SQLException e) {
			logger.error("数据库分页查询失败！@Line:346");
			e.printStackTrace();
		}

		return pd;
	}

/********************重写QueryRunner中的方法****************************************/
	public static int[] batch(String sql, Object[][] params) throws SQLException {
		Connection conn = getConnection();
		int[] result = run.batch(conn, sql, params);
		releaseConnection(conn);
		return result;
	}

	public static <T> T query(String sql, ResultSetHandler<T> rsh, Object... params) throws SQLException {
		Connection conn = getConnection();
		T result = run.query(conn, sql, rsh, params);
		releaseConnection(conn);
		return result;
	}

	public static <T> T query(String sql, ResultSetHandler<T> rsh) throws SQLException {
		Connection conn = getConnection();
		T result = run.query(conn, sql, rsh);
		releaseConnection(conn);
		return result;
	}

	public static int update(String sql, Object... params) throws SQLException {
		Connection conn = getConnection();
		int result = run.update(conn, sql, params);
		releaseConnection(conn);
		return result;
	}

	public static int update(String sql, Object param) throws SQLException {
		Connection conn = getConnection();
		int result = run.update(conn, sql, param);
		releaseConnection(conn);
		return result;
	}

	public static int update(String sql) throws SQLException {
		Connection conn = getConnection();
		int result = run.update(conn, sql);
		releaseConnection(conn);
		return result;
	}

	/************************** 对增删改查操作的支持性方法*************************/
	/**
	 * 解析表名
	 * 
	 * @param <T>
	 * @param clazz
	 * @return
	 */
	public static <T> String getTableName(Class<T> clazz) {
		String tableName = null;
		Annotation annotation = clazz.getDeclaredAnnotation(Table.class);
		if (null != annotation && annotation instanceof Table) {
			Table table = (Table) annotation;
			tableName = table.value();
		} else {
			//System.out.println("2");
			String allName = clazz.getName();
			int lastdot = allName.lastIndexOf(".");
			tableName = allName.substring(lastdot + 1, lastdot + 2).toLowerCase() + allName.substring(lastdot + 2);
		}
		return tableName;
	}

	/**
	 * 解析表中的字段,把成员名和值封装在一个map中
	 * 
	 * @param <T>
	 * @param t
	 * @return
	 */
	public static <T> TreeMap<String, Object> parseAllField(T t) {
		TreeMap<String, Object> map = new TreeMap<String, Object>();
		try {
			Field[] allFields = t.getClass().getDeclaredFields(); // 得到所有的字段名
			if (null != allFields && allFields.length > 0) {
				for (Field field : allFields) {
					field.setAccessible(true);
					String fieldName = field.getName();
					// System.out.println(fieldName + "\t" + field.get(t));
					Annotation annotation = field.getAnnotation(Exclude.class);
					// 排除无效的数据库操作
					if (null == field.get(t) || "id".equals(fieldName) || "serialVersionUID".equals(fieldName)
							|| (null != annotation && annotation instanceof Exclude)) {
						continue;
					}

					// 解析列名
					Annotation col = field.getAnnotation(Colunm.class);
					if (null != col && col instanceof Colunm) {
						map.put(((Colunm) col).value(), field.get(t));
					} else {
						map.put(fieldName, field.get(t));
					}
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	/**
	 * 把map中解析到的字段解析到flist,qlist,values中
	 * 
	 * @param flist
	 * @param values
	 * @param map
	 */
	public static void parseFildAndQuery(StringBuilder flist, List<Object> values, TreeMap<String, Object> map) {
		if (null != map && null != map.keySet() && map.keySet().size() > 0) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				flist.append(entry.getKey() + "=?,");
				values.add(entry.getValue());
			}
		}
		// 删除拼成的sql语句的最后一个逗号
		if (flist.length() > 0) {
			flist.delete(flist.length() - 1, flist.length());
		}
	}

}
