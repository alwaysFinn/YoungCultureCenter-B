package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDao searchDao;

	@Override
	public List<BoardDto> getNoticePage(SearchItem sc) throws Exception {
		return searchDao.selectNoticePage(sc);
	}

	@Override
	public List<BoardDto> getEventPage(SearchItem sc) throws Exception {
		return searchDao.selectEventPage(sc);
	}

	@Override
	public List<BoardDto> morePage(String article_board_type) throws Exception {
		return searchDao.select(article_board_type);
	}

	@Override
	public int getSearchResultCnt(Map map) throws Exception {
		return searchDao.searchResultCnt(map);
	}

	@Override
	public List<ClubDto> getClubPage(SearchItem sc) throws Exception {
		return searchDao.selectClubPage(sc);
	}

	@Override
	public List<CourseDto> getCoursePage(SearchItem sc) throws Exception {
		return searchDao.selectCoursePage(sc);
	}

}
