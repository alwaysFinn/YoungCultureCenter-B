

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.search.SearchDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SearchDummyTest {
	
	@Autowired
	SearchDao searchDao;
	
	@Test
	public void searchDummyTest() throws Exception {
		
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=1; i<=55; i++) {
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "공지사항", "admin", "23년 수영장 일정 공지"+i, "공지사항입니다"+i, 0);
			searchDao.insert(boardDto);
		}
	}
	
	@Test
	public void searchDummyTest1() throws Exception {
		
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=56; i<=110; i++) {
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "이벤트", "admin", "헬스장 이벤트 안내"+i, "이벤트입니다"+i, 0);
			searchDao.insert(boardDto);
		}
	}

}
