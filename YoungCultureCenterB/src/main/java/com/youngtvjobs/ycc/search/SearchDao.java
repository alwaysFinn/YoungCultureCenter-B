package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;

public interface SearchDao {
	
	int insert(BoardDto boardDto) throws Exception;
	
	// �˻���� ������
	List<BoardDto> selectNoticePage(SearchItem sc) throws Exception;
	List<BoardDto> selectEventPage(SearchItem sc) throws Exception;
	List<ClubDto> selectClubPage(SearchItem sc) throws Exception;
	List<CourseDto> selectCoursePage(SearchItem sc) throws Exception;
	
	// �˻������ ������
	int searchResultCnt(Map map) throws Exception;
	int searchAllResultCnt(SearchItem sc) throws Exception;
	
	// �Խñ��� ����Ʈ�ϰ� �� �Խñ��� ��ȸ�� ����
	BoardDto select(Integer article_id) throws Exception;
	int increaseViewCnt(Integer article_id) throws Exception;
	
	
}
