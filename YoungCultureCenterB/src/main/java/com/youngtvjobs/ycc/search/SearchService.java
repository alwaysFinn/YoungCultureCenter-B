package com.youngtvjobs.ycc.search;

import java.util.List;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.search.SearchItem;
public interface SearchService {
	
	List<BoardDto> getNoticePage() throws Exception;
	List<BoardDto> getNoticePageAll() throws Exception;
	List<BoardDto> getEventPage() throws Exception;
	List<BoardDto> getAllPage() throws Exception;
	List<BoardDto> morePage(String article_board_type) throws Exception;
	
	/* BoardDto read(String article_board_type) throws Exception; */
//	int getNoticePageCnt() throws Exception;
	
	
}
