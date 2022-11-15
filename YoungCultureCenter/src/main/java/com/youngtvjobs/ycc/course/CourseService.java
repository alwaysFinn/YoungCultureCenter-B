package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

public interface CourseService {
	
	List<CourseDto> getPage(Map map) throws Exception;

	int getsearchResultCnt(SearchItem sc) throws Exception;
	List<CourseDto> getsearchResultPage(SearchItem sc) throws Exception;
}
