package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	RentalDao rentalDao;
	
	// 대관
	@Override // selectBox에서 장소 고를때 장소를 불러옴
	public List<RentalDto> selectRentalPlace() throws Exception {
		return rentalDao.selectRentalPlace();
	}
	
	@Override	// 기존 예약 데이터들을 불러옴
	public List<RentalDto> selectInfo(String croom_id, Date prental_de) throws Exception {
		List<RentalDto> infoList = null;
		infoList = rentalDao.selectInfo(croom_id, prental_de);
		return infoList;
	}
	
	@Override	// 선택한 예약 정보들을 insert
	public int insertInfo(RentalDto rentalDto) throws Exception {
		return rentalDao.insertInfo(rentalDto);
	}
	// 대관 끝
	
	@Override//날짜, 장소 선택하면 해당 장소 예약현황 보여주는 기능
	public List<RentalDto> viewRentalPlace() throws Exception {
		return rentalDao.selectview();
	}

	@Override//select, calender에서 선택한 값을 기반으로 하단 테이블에 보여주는 기능
	public List<RentalDto> getList(String croom_id, Date prental_de) throws Exception {
		List<RentalDto> list = null;
		list = rentalDao.selectAll(croom_id, prental_de);
		System.out.println("list = " + list);
		return list;
	}

	@Override
	public List<RentalDto> sroomRentalCheck() throws Exception {
		return rentalDao.sroomview();
	}

	@Override
	public int sroomRental(RentalDto rentalDto) throws Exception {
		System.out.println("service : " + rentalDto.getSroom_rental_etime());
		return rentalDao.insertStudyroomlentalinfo(rentalDto);
	}

	@Override
	public int sroomRentalInsUpdate(RentalDto rentalDto) throws Exception {
		return rentalDao.updateStudyroomStatusInsert(rentalDto);
	}

	@Override
	public int sroomRentalDelUpdate(RentalDto rentalDto) throws Exception {
		return rentalDao.updateStudyroomStatusDelete(rentalDto);
	}

	@Override
	public int sroomClear() throws Exception {
		return rentalDao.deleteStudyroom();
	}

	@Override
	public List<RentalDto> sroomYCheck() throws Exception {
		return rentalDao.checky();
	}

	@Override
	public List<RentalDto> sroomRentaledCheck() throws Exception {
		return rentalDao.checkrentalStatus();
	}
	
}
	