package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

public interface CourseDao {

	int searchResultCnt(SearchItem sc) throws Exception;
	
	List<CourseDto> selectPage(Map map) throws Exception;

	List<CourseDto> searchSelectPage(SearchItem sc) throws Exception;

	int deleteAll() throws Exception;
	int insert(CourseDto courseDto) throws Exception;

	
}
