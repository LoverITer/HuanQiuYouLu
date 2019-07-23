package com.xzy.db.core;

import java.util.List;


/**
 * 对表进行分页
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class PageDiv<T> {

	private long totalPage; // 总共的页数
	private long currentPageNo; // 当前的页码
	private long pageSize; // 每页的大小
	private long totalCount; // 总共的记录条数
	private long start; // 开始的页码
	private long end; // 结束的页码
	private long indexCount; // 要显示的页数
	private List<T> list; // 当前页面中的数据

	public PageDiv() {
	}

	public PageDiv(Long currentPageNo, Long pageSize, Long totalCount, List<T> list) {
		this.currentPageNo = currentPageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = (totalCount % pageSize) == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
		this.list = list;
		if (currentPageNo - indexCount / 2 < 1) {
			start = 1;
		} else {
			start = currentPageNo - indexCount;
		}

		if (currentPageNo + indexCount / 2 > totalPage) {
			end = totalPage;
		} else {
			end = currentPageNo + indexCount / 2;
		}

	}
	
	/**
	 * 得到前一页
	 * @return
	 */
	public long getPerviousPage() {
		long re=0;
		if(this.currentPageNo-1>0) {
			re=this.currentPageNo-1;
		}else {
			re=1;
		}
		
		return re;
	}
	
	
	/**
	 * 得到下一页
	 * @return
	 */
	public long getNextPage() {
		long re=0;
		if(this.currentPageNo+1>this.totalPage) {
			re=this.totalPage;
		}else {
			re=this.currentPageNo+1;
		}
		
		return re;
	}
	

	public long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}

	public long getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(long currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public long getPageSize() {
		return pageSize;
	}

	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public long getStart() {
		return start;
	}

	public void setStart(long start) {
		this.start = start;
	}

	public long getEnd() {
		return end;
	}

	public void setEnd(long end) {
		this.end = end;
	}

	public long getIndexCount() {
		return indexCount;
	}

	public void setIndexCount(long indexCount) {
		this.indexCount = indexCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
