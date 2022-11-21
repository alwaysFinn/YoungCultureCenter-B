package com.youngtvjobs.ycc.search;

import org.springframework.web.util.UriComponentsBuilder;
import static java.util.Objects.requireNonNullElse;
import static java.lang.Math.*;

public class SearchItem {
	
	public static final int DEFAULT_PAGE_SIZE = 10;
	public static final int MIN_PAGE_SIZE = 5;
	public static final int MAX_PAGE_SIZE = 50;
	
	
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private String option = "";
	private String keyword = "";
	private Integer offset;
	
	
	public SearchItem() {
		// TODO Auto-generated constructor stub
	}
	
	public SearchItem(Integer page, Integer paseSize) {
		this(page, paseSize, "", "");
	}
	
	public SearchItem(Integer page, Integer pageSize, String option, String keyword) {
		//super();
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
	}
	
	
//	public String getQueryString() {
//		return getQueryString(article_board_type);
//	}
//	
//	// ?page=10&pageSize=10&option=A&keyword=title
//	public String getQueryString(String article_board_type) {
//		return UriComponentsBuilder.newInstance()	
//				.queryParam("article_board_type", article_board_type)
//				.build().toString();
//	}
	

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);	//pageSize媛� null�씠硫� DEFAULT_PAGE_SIZE 由ы꽩
		
		// MIN_PAGE_SIZE <= pageSize <= MAX_PAGE_SIZE
		this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));	//max: �몢 媛� 以� �뜑 �겙 媛믪쓣 諛섑솚
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getOffset() {
		 int result = (page-1) * pageSize; // offset => 蹂�寃�
	        if(result <0) {result= 0;}
	        return result;
	}



	@Override
	public String toString() {
		return "SearchItem [page=" + page + ", pageSize=" + pageSize + ", option=" + option + ", keyword=" + keyword
				+ ", offset=" + offset + "]";
	}
	
	

}