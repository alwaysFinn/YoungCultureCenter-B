package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface RentalService {
	
	
	List<RentalDto> selectschedule() throws Exception;
	List<RentalDto> viewRentalPlace() throws Exception;
	List<RentalDto> selectRentalPlace() throws Exception;
	List<RentalDto> getList(String croom_id, Date prental_de) throws Exception;
	List<RentalDto> checkRental() throws Exception;
	
	int rental(RentalDto rentalDto) throws Exception;
	
	//studyroom start
	List<RentalDto> sroomRentalCheck() throws Exception;
	int sroomRental(RentalDto rentalDto) throws Exception; 
	int sroomRentalInsUpdate(RentalDto rentalDto) throws Exception;
	int sroomRentalDelUpdate(RentalDto rentalDto) throws Exception;
	int sroomClear() throws Exception; 
	

}
