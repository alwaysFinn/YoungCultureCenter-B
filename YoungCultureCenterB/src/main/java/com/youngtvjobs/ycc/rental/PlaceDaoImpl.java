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
	
	// 대관
	@Override
	public List<RentalDto> selectRentalPlace() throws Exception {
		return session.selectList(namespace + "selectRentalPlace");
	}
	
	@Override
	public List<RentalDto> selectInfo(String croom_id, Date prental_de) throws Exception {
		Map map = new HashMap();
		map.put("croom_id", croom_id);
		map.put("prental_de", prental_de);
		return session.selectList(namespace + "selectInfo", map);
	}

	@Override
	public int insertInfo(RentalDto rentalDto) throws Exception {
		return session.insert(namespace + "insertInfo", rentalDto);
	}
	// 대관 끝

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

	@Override
	public List<RentalDto> checky() throws Exception {
		return session.selectList(namespace + "rentaledSelect");
	}

	@Override
	public List<RentalDto> checkrentalStatus() throws Exception {
		return session.selectList(namespace + "seatstatusy");
	}

	

}