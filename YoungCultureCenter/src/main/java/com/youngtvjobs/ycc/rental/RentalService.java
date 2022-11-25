package com.youngtvjobs.ycc.rental;

import java.util.List;
import java.util.Map;


public interface RentalService {
	
	
	List<RentalDto> viewRentalPlace() throws Exception;
	List<RentalDto> selectRentalPlace() throws Exception;
	List<RentalDto> getList(String croom_id) throws Exception;
	List<RentalDto> checkRental() throws Exception;
	
	int rental(RentalDto rentalDto) throws Exception;
	

}
