package com.youngtvjobs.ycc.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.search.SearchItem;
@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.search.SearchMapper.";
	
	@Override
	public List<BoardDto> selectNoticePage() throws Exception {
		return session.selectList(namespace+"selectNoticePage");
	}
	
	@Override
	public List<BoardDto> selectNoticePageAll() throws Exception {
		return session.selectList(namespace+"selectNoticePageAll");
	}

	@Override
	public int insert(BoardDto boardDto) throws Exception {
		return session.insert(namespace+"insert", boardDto);
	}

	@Override
	public List<BoardDto> selectEventPage() throws Exception {
		return session.selectList(namespace+"selectEventPage");
	}

	@Override
	public List<BoardDto> selectAllPage() throws Exception {
		return session.selectList(namespace+"selectAllPage");
	}

	@Override
	public List<BoardDto> select(String article_board_type) throws Exception {
		return session.selectList(namespace+"select", article_board_type);
	}

	/*
	 * @Override public BoardDto select(String article_board_type) throws Exception
	 * { return session.selectOne(namespace + "select", article_board_type); }
	 */

//	@Override
//	public int count() throws Exception {
//		return session.selectOne(namespace + "count");
//	}
//
//	@Override
//	public int noticePageCnt() throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace + "noticePageCnt");
//	}

}



















