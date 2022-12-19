package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface RentalDao {
	
	// 대관
	int insertInfo(RentalDto rentalDto) throws Exception;	
	List<RentalDto> selectRentalPlace() throws Exception;
	List<RentalDto> selectInfo(String croom_id, Date prental_de) throws Exception;
	
	List<RentalDto> selectview() throws Exception;
	List<RentalDto> selectAll(String croom_id, Date prental_de) throws Exception;
	
	List<RentalDto> sroomview() throws Exception;
	int insertStudyroomlentalinfo(RentalDto rentalDto) throws Exception;
	int updateStudyroomStatusInsert(RentalDto rentalDto) throws Exception;
	int updateStudyroomStatusDelete(RentalDto rentalDto) throws Exception;
	int deleteStudyroom() throws Exception;
	List<RentalDto> checky() throws Exception;
	List<RentalDto> checkrentalStatus() throws Exception;
	
	

}
