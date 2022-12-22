package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface RentalService {
	
	// 대관
	List<RentalDto> selectInfo(String croom_id, Date prental_de) throws Exception;
	int insertInfo(RentalDto rentalDto) throws Exception;
	List<RentalDto> selectRentalPlace() throws Exception;
	
	List<RentalDto> viewRentalPlace() throws Exception;
	List<RentalDto> getList(String croom_id, Date prental_de) throws Exception;
	
	//studyroom start
	List<RentalDto> sroomRentalCheck() throws Exception;
	int sroomRental(RentalDto rentalDto) throws Exception; 
	int sroomRentalInsUpdate(RentalDto rentalDto) throws Exception;
	int sroomRentalDelUpdate(RentalDto rentalDto) throws Exception;
	int sroomClear() throws Exception;
	List<RentalDto> sroomYCheck() throws Exception;
	List<RentalDto> sroomRentaledCheck() throws Exception;
	

}
