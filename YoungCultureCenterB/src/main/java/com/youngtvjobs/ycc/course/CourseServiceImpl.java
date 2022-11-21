package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	CourseDao courseDao;
	
	@Override
	public int getsearchResultCnt(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchResultCnt(sc);
	}

	@Override
	public List<CourseDto> getsearchResultPage(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchSelectPage(sc);
	}

	@Override
	public List<CourseDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.selectPage(map);
	}

	@Override
	public CourseDto readCourseDetail(Integer course_id) throws Exception {
		CourseDto courseDto = courseDao.courseDetail(course_id);
		
		return courseDto;
	}

}
