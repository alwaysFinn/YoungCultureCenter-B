package com.youngtvjobs.ycc.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.search.SearchItem;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDao searchDao;

	@Override
	public List<BoardDto> getNoticePage() throws Exception {
		return searchDao.selectNoticePage();
	}
	
	@Override
	public List<BoardDto> getNoticePageAll() throws Exception {
		return searchDao.selectNoticePageAll();
	}

	@Override
	public List<BoardDto> getEventPage() throws Exception {
		return searchDao.selectEventPage();
	}

	@Override
	public List<BoardDto> getAllPage() throws Exception {
		return searchDao.selectAllPage();
	}

	@Override
	public List<BoardDto> morePage(String article_board_type) throws Exception {
		return searchDao.select(article_board_type);
	}


	/*
	 * @Override public BoardDto read(String article_board_type) throws Exception {
	 * return searchDao.select(article_board_type);
	 * 
	 * }
	 */



//	@Override
//	public int getNoticePageCnt() throws Exception {
//		return searchDao.noticePageCnt();
//	}

}
