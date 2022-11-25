package com.youngtvjobs.ycc.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CourseDaoImpl implements CourseDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.course.courseMapper.";
	
	@Override
	public int searchResultCnt(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCnt", sc);
	}
	@Override
	public List<CourseDto> searchSelectPage(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPage", sc);
	}
	@Override
	public int deleteAll() throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace + "deleteAll");
	}
	@Override
	public int insert(CourseDto courseDto) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "insert", courseDto);
	}
	@Override
	public List<CourseDto> selectPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "selectPage", map);
	}
	@Override
	public CourseDto courseDetail(Integer course_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectCourseDetail", course_id);
	}
	@Override
	public int updateReviewCnt(Integer course_id, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("cnt", cnt);
		map.put("course_id", course_id);
		
		return session.update(namespace + "updateReviewCnt", map);
	}


}
