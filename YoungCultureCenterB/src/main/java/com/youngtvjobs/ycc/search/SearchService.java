package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;
public interface SearchService {
	
	List<BoardDto> getNoticePage(SearchItem sc) throws Exception;
	List<BoardDto> getEventPage(SearchItem sc) throws Exception;
	List<ClubDto> getClubPage(SearchItem sc) throws Exception;
	List<BoardDto> morePage(String article_board_type) throws Exception;
	int getSearchResultCnt(Map map) throws Exception;
	List<CourseDto> getCoursePage(SearchItem sc) throws Exception;

	
	
}
