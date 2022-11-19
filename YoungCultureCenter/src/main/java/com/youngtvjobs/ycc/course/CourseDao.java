package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

public interface CourseDao {

	int searchResultCnt(CourseSearchItem sc) throws Exception;
	
	List<CourseDto> selectPage(Map map) throws Exception;

	List<CourseDto> searchSelectPage(CourseSearchItem sc) throws Exception;

	int deleteAll() throws Exception;
	int insert(CourseDto courseDto) throws Exception;

	CourseDto courseDetail(Integer course_id) throws Exception;

}
