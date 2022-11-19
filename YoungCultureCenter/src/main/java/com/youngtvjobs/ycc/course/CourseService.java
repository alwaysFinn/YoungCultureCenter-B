package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

public interface CourseService {
	
	List<CourseDto> getPage(Map map) throws Exception;

	int getsearchResultCnt(CourseSearchItem sc) throws Exception;
	List<CourseDto> getsearchResultPage(CourseSearchItem sc) throws Exception;

	CourseDto readCourseDetail(Integer course_id) throws Exception;

}
