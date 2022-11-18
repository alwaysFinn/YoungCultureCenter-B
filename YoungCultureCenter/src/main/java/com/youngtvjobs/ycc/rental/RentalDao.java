package com.youngtvjobs.ycc.rental;

import java.util.List;

public interface RentalDao {
	
	List<RentalDto> selectRentalPlace() throws Exception;

}
