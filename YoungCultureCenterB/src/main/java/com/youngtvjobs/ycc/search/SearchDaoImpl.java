package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;
import com.youngtvjobs.ycc.search.SearchItem;
@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.search.SearchMapper.";
	
	@Override
	public int insert(BoardDto boardDto) throws Exception {
		return session.insert(namespace+"insert", boardDto);
	}
	
	@Override
	public List<BoardDto> selectNoticePage(SearchItem sc) throws Exception {
		return session.selectList(namespace+"selectNoticePage", sc);
	}

	@Override
	public List<BoardDto> selectEventPage(SearchItem sc) throws Exception {
		return session.selectList(namespace+"selectEventPage", sc);
	}
	
	@Override
	public List<ClubDto> selectClubPage(SearchItem sc) throws Exception {
		return session.selectList(namespace+"selectClubPage", sc);
	}
	
	@Override
	public List<CourseDto> selectCoursePage(SearchItem sc) throws Exception {
		return session.selectList(namespace+"selectCoursePage", sc);
	}

	@Override
	public int searchResultCnt(Map map) throws Exception {
		return session.selectOne(namespace+"searchResultCnt", map);
	}

	@Override
	public int searchAllResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace+"searchAllResultCnt", sc);
	}

	@Override
	public BoardDto select(Integer article_id) throws Exception {
		return session.selectOne(namespace + "select", article_id);
	}

	@Override
	public int increaseViewCnt(Integer article_id) throws Exception {
		return session.update(namespace+"increaseViewCnt", article_id);
	}

}



















