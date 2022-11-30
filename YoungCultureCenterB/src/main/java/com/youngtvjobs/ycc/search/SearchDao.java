package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;

public interface SearchDao {
	
	int insert(BoardDto boardDto) throws Exception;
	
	// 검색결과 가져옴
	List<BoardDto> selectNoticePage(SearchItem sc) throws Exception;
	List<BoardDto> selectEventPage(SearchItem sc) throws Exception;
	List<ClubDto> selectClubPage(SearchItem sc) throws Exception;
	List<CourseDto> selectCoursePage(SearchItem sc) throws Exception;
	
	// 검색결과수 가져옴
	int searchResultCnt(Map map) throws Exception;
	int searchAllResultCnt(SearchItem sc) throws Exception;
	
	// 게시글을 셀렉트하고 그 게시글의 조회수 증가
	BoardDto select(Integer article_id) throws Exception;
	int increaseViewCnt(Integer article_id) throws Exception;
	
	
}
