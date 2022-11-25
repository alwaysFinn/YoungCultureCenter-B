package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RentalDaoImpl implements RentalDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.rental.rentalMapper.";

	@Override
	public List<RentalDto> select() throws Exception {
		return session.selectList(namespace + "selectRentalPlace");
	}

	@Override
	public List<RentalDto> selectview() throws Exception {
		return session.selectList(namespace + "viewRentalPlace");
	}

	@Override
	public List<RentalDto> selectAll(String croom_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "viewRentalPlace", croom_id);
	}

	@Override
	public int insertRentalinfo(RentalDto dto) throws Exception {
		return session.insert(namespace + "insertRentalinfo", dto);
	}

	@Override
	public List<RentalDto> selectRental() throws Exception {
		return session.selectList(namespace + "viewRentalTable");
	}
	
	

	

}
