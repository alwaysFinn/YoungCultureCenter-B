package com.youngtvjobs.ycc.search;

import java.util.List;
import java.util.Map;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;
public interface SearchService {
	
	
	// �˻���� ������
	List<BoardDto> getNoticePage(SearchItem sc) throws Exception;
	List<BoardDto> getEventPage(SearchItem sc) throws Exception;
	List<ClubDto> getClubPage(SearchItem sc) throws Exception;
	List<CourseDto> getCoursePage(SearchItem sc) throws Exception;
	
	// �˻������ ������
	int getSearchResultCnt(Map map) throws Exception;
	int getSearchAllResultCnt(SearchItem sc) throws Exception;
	
	// �Խñ� Ŭ���� ��ȸ�� ����
	BoardDto read(Integer article_id) throws Exception;

}
