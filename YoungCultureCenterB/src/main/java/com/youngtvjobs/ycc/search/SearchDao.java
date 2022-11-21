package com.youngtvjobs.ycc.search;

import java.util.List;

import com.youngtvjobs.ycc.board.BoardDto;

public interface SearchDao {

	int insert(BoardDto boardDto) throws Exception;
	List<BoardDto> selectNoticePage() throws Exception;
	List<BoardDto> selectNoticePageAll() throws Exception;
	List<BoardDto> selectEventPage() throws Exception;
	List<BoardDto> selectEventPageAll() throws Exception;
	List<BoardDto> selectAllPage() throws Exception;
	List<BoardDto> selectAllPageMore() throws Exception;
	List<BoardDto> select(String article_board_type) throws Exception;
	
	
//	int count() throws Exception;
//	int noticePageCnt() throws Exception;
	
}
