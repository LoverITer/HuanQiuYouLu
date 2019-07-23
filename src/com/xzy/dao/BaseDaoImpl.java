package com.xzy.dao;

import java.sql.SQLException;
import java.util.List;

import com.xzy.db.core.DBManager;
import com.xzy.db.core.PageDiv;

/**
 * 实现BaseDao里边的方法接口，方便上层servlet调用
 * @author Administrator
 *
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T>{

	@Override
	public Long add(T t) throws SQLException {
		Long id=DBManager.add(t);
		return id;
	}

	@Override
	public void delete(Long id, Class<T> clazz) throws SQLException {
		DBManager.delete(id, clazz);
	}

	@Override
	public void update(T t) throws SQLException {
		DBManager.update(t);
	}

	@Override
	public T get(Long id, Class<T> clazz) throws SQLException {
		return (T)get(id, clazz);
	}

	@Override
	public List<T> getAll(Class<T> clazz) {
		try {
			return DBManager.getAll(clazz);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageDiv<T> getByPage(Class<T> clazz, Long pageNo, Long pageSize) {
		return DBManager.getByPage(clazz, pageNo, pageSize);
	}



}
