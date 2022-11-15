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
	public int getsearchResultCnt(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchResultCnt(sc);
	}

	@Override
	public List<CourseDto> getsearchResultPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchSelectPage(sc);
	}

	@Override
	public List<CourseDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.selectPage(map);
	}

}
