package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface StudyroomService {
	
	List<StudyroomDto> sroomFix() throws Exception;
	int sroomInsert(StudyroomDto studyroomDto) throws Exception;

}
