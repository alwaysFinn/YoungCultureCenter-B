

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
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "��������", "admin", "23�� ������ ���� ����"+i, "���������Դϴ�"+i, 0);
			searchDao.insert(boardDto);
		}
	}
	
	@Test
	public void searchDummyTest1() throws Exception {
		
		DateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=56; i<=110; i++) {
			BoardDto boardDto = new BoardDto(i, sdformat.parse("2022-11-01"), "�̺�Ʈ", "admin", "�ｺ�� �̺�Ʈ �ȳ�"+i, "�̺�Ʈ�Դϴ�"+i, 0);
			searchDao.insert(boardDto);
		}
	}

}
