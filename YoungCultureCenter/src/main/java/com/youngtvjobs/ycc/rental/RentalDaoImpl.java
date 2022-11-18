package com.youngtvjobs.ycc.rental;

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
	public List<RentalDto> selectRentalPlace() throws Exception {
		
		return session.selectList(namespace + "selectRentalPlace");
	}

}
