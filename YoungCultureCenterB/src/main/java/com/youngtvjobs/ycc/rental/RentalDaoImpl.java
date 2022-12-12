package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RentalDaoImpl implements RentalDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.rental.rentalMapper.";

	@Override
	public List<RentalDto> selecttime() throws Exception {
		return session.selectList(namespace + "selectSchedule");
	}
	
	@Override
	public List<RentalDto> select() throws Exception {
		return session.selectList(namespace + "selectRentalPlace");
	}

	@Override
	public List<RentalDto> selectview() throws Exception {
		return session.selectList(namespace + "viewRentalPlace");
	}

	@Override
	public List<RentalDto> selectAll(String croom_id, Date prental_de) throws Exception {
		Map map = new HashMap();
		map.put("croom_id", croom_id);
		map.put("prental_de", prental_de);
		return session.selectList(namespace + "tlscjfghks", map);
	}

	@Override
	public List<RentalDto> selectRental() throws Exception {
		return session.selectList(namespace + "viewRentalTable");
	}
	
	//예약하는 insert 로직
	@Override
	public int insertRentalinfo(RentalDto dto) throws Exception {
		return session.insert(namespace + "insertRentalinfo", dto);
	}

	@Override
	public List<RentalDto> sroomview() throws Exception {
		return session.selectList(namespace + "selectSchedule");
	}

	@Override
	public int insertStudyroomlentalinfo(RentalDto rentalDto) throws Exception {
		System.out.println("dao : " + rentalDto.getSroom_rental_etime());
		return session.insert(namespace + "studyroomRental", rentalDto);
	}

	@Override
	public int updateStudyroomStatusInsert(RentalDto rentalDto) throws Exception {
		return session.update(namespace + "studyroomRentalupdate", rentalDto);
	}

	@Override
	public int updateStudyroomStatusDelete(RentalDto rentalDto) throws Exception {
		return session.update(namespace + "studyroomDeleteupdate", rentalDto);
	}

	@Override
	public int deleteStudyroom() throws Exception {
		return session.delete(namespace + "studyroomReset");
	}

	

}
