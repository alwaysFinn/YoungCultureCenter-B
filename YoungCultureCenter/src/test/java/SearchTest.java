

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.course.CourseDto;
import com.youngtvjobs.ycc.search.SearchDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SearchTest {

	@Autowired
	SearchDao searchDao;
	
	@Test
	public void insertTest() throws Exception{
		
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=1; i<=25; i++) {
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "notice article", "notice", "admin"+i, "notice"+i);
			searchDao.insert(boardDto);
		}
		
	}
	
	
	@Test
	public void insertTest2() throws Exception{
		
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=26; i<=50; i++) {
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "event article", "event", "admin"+i, "event"+i);
			searchDao.insert(boardDto);
		}
		
	}
	
	
}
