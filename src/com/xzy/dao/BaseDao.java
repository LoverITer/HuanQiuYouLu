package com.xzy.dao;

import java.sql.SQLException;
import java.util.List;

import com.xzy.db.core.PageDiv;

public interface BaseDao<T> {

	public Long add(T t) throws SQLException;
	
	public void delete(Long id,Class<T> clazz) throws SQLException;
	
	public void update(T t) throws SQLException;
	
	public T get(Long id,Class<T> clazz) throws SQLException;
	
	public List<T> getAll(Class<T> clazz) ;
	
	public PageDiv<T> getByPage(Class<T> clazz,Long pageNo,Long pageSize);
	
}
