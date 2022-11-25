package com.youngtvjobs.ycc.rental;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	RentalDao rentalDao;

	@Override//날짜, 장소 선택하면 해당 장소 예약현황 보여주는 기능
	public List<RentalDto> viewRentalPlace() throws Exception {
		return rentalDao.selectview();
	}

	@Override//select에 DB에서 값 넣는 기능 , 작동확인
	public List<RentalDto> selectRentalPlace() throws Exception {
		return rentalDao.select();
	}

	@Override//select, calender에서 선택한 값을 기반으로 하단 테이블에 보여주는 기능, 오작동
	public List<RentalDto> getList(String croom_id) throws Exception {
		return rentalDao.selectAll(croom_id);
	}

	@Override
	public int rental(RentalDto rentalDto) throws Exception {
		return rentalDao.insertRentalinfo(rentalDto);
	}

	@Override
	public List<RentalDto> checkRental() throws Exception {
		return rentalDao.selectRental();
	}
	
	//public 
	
}
	