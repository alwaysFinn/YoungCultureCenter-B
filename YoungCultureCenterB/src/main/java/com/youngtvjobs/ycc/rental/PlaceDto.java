package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.UriComponentsBuilder;

public class RentalDto {

	private Integer prental_id; // 대여예약번호(pk)
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prental_de; // 대여날짜
	//private String prtime_schedule;// 대여시간  ====> 삭제 - time 컬럼으로 대체
	private String user_id; // 회원아이디 (fk)
	private String croom_id; // 강의실 코드 (fk) classroom의 pk
	private boolean time1;	// 예약시간 08:10 ~ 10:00
	private boolean time2;	// 10:10 ~ 12:00
	private boolean time3;
	private boolean time4;
	private boolean time5;
	private boolean time6;
	// end of tb_prental_info(대관현황)
	private String croom_location; // 강의실 위치
	private int croom_mpop; // 강의실 정원
	private String croom_name; // 강의실 이름
	// end of tb_classroom(강의실)
	private String locker_id;
	private String locker_location;
	private Date locker_start_date;
	private int locker_cost;
	private Date locker_end_date;
	// end of tb_rental_locker(사물함 대여)
	private Integer sroom_seat_id;
	private String sroom_rental_yn;
	// end of tb_studyroom(독서실)
	private int srental_no;
	private Date sroom_rental_stime;
	private Date sroom_rental_etime;
	// end of sroom_rental_info(독서실 예약 정보)

	public RentalDto() {
		// TODO Auto-generated constructor stub
	}
	public RentalDto(Integer prental_id, Date prental_de, String user_id, String croom_id, boolean time1, boolean time2,
			boolean time3, boolean time4, boolean time5, boolean time6, String croom_location, int croom_mpop, String croom_name, 
			String locker_id, String locker_location, Date locker_start_date, int locker_cost, Date locker_end_date, 
			Integer sroom_seat_id, String sroom_rental_yn, int srental_no, Date sroom_rental_stime, Date sroom_rental_etime) {
		super();
		this.prental_id = prental_id;
		this.prental_de = prental_de;
		this.user_id = user_id;
		this.croom_id = croom_id;
		this.time1 = time1;
		this.time2 = time2;
		this.time3 = time3;
		this.time4 = time4;
		this.time5 = time5;
		this.time6 = time6;
		this.croom_location = croom_location;
		this.croom_mpop = croom_mpop;
		this.croom_name = croom_name;
		this.locker_id = locker_id;
		this.locker_location = locker_location;
		this.locker_start_date = locker_start_date;
		this.locker_cost = locker_cost;
		this.locker_end_date = locker_end_date;
		this.sroom_seat_id = sroom_seat_id;
		this.sroom_rental_yn = sroom_rental_yn;
		this.srental_no = srental_no;
		this.sroom_rental_stime = sroom_rental_stime;
		this.sroom_rental_etime = sroom_rental_etime;
	}
	public Integer getPrental_id() {
		return prental_id;
	}
	public void setPrental_id(Integer prental_id) {
		this.prental_id = prental_id;
	}
	public Date getPrental_de() {
		return prental_de;
	}
	public void setPrental_de(Date prental_de) {
		this.prental_de = prental_de;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCroom_id() {
		return croom_id;
	}
	public void setCroom_id(String croom_id) {
		this.croom_id = croom_id;
	}
	
	public boolean isTime1() {
		return time1;
	}
	public void setTime1(boolean time1) {
		this.time1 = time1;
	}
	public boolean isTime2() {
		return time2;
	}
	public void setTime2(boolean time2) {
		this.time2 = time2;
	}
	public boolean isTime3() {
		return time3;
	}
	public void setTime3(boolean time3) {
		this.time3 = time3;
	}
	public boolean isTime4() {
		return time4;
	}
	public void setTime4(boolean time4) {
		this.time4 = time4;
	}
	public boolean isTime5() {
		return time5;
	}
	public void setTime5(boolean time5) {
		this.time5 = time5;
	}
	public boolean isTime6() {
		return time6;
	}
	public void setTime6(boolean time6) {
		this.time6 = time6;
	}
	public String getCroom_location() {
		return croom_location;
	}
	public void setCroom_location(String croom_location) {
		this.croom_location = croom_location;
	}
	public int getCroom_mpop() {
		return croom_mpop;
	}
	public void setCroom_mpop(int croom_mpop) {
		this.croom_mpop = croom_mpop;
	}
	public String getCroom_name() {
		return croom_name;
	}
	public void setCroom_name(String croom_name) {
		this.croom_name = croom_name;
	}
	public String getLocker_id() {
		return locker_id;
	}
	public void setLocker_id(String locker_id) {
		this.locker_id = locker_id;
	}
	public String getLocker_location() {
		return locker_location;
	}
	public void setLocker_location(String locker_location) {
		this.locker_location = locker_location;
	}
	public Date getLocker_start_date() {
		return locker_start_date;
	}
	public void setLocker_start_date(Date locker_start_date) {
		this.locker_start_date = locker_start_date;
	}
	public int getLocker_cost() {
		return locker_cost;
	}
	public void setLocker_cost(int locker_cost) {
		this.locker_cost = locker_cost;
	}
	public Date getLocker_end_date() {
		return locker_end_date;
	}
	public void setLocker_end_date(Date locker_end_date) {
		this.locker_end_date = locker_end_date;
	}
	public Integer getSroom_seat_id() {
		return sroom_seat_id;
	}
	public void setSroom_seat_id(int sroom_seat_id) {
		this.sroom_seat_id = sroom_seat_id;
	}
	public String getSroom_rental_yn() {
		return sroom_rental_yn;
	}
	public void setSroom_rental_yn(String sroom_rental_yn) {
		this.sroom_rental_yn = sroom_rental_yn;
	}
	public int getSrental_no() {
		return srental_no;
	}
	public void setSrental_no(int srental_no) {
		this.srental_no = srental_no;
	}
	public Date getSroom_rental_stime() {
		return sroom_rental_stime;
	}
	public void setSroom_rental_stime(Date sroom_rental_stime) {
		this.sroom_rental_stime = sroom_rental_stime;
	}
	public Date getSroom_rental_etime() {
		return sroom_rental_etime;
	}
	public void setSroom_rental_etime(Date sroom_rental_etime) {
		this.sroom_rental_etime = sroom_rental_etime;
	}
	@Override
	public int hashCode() {
		return Objects.hash(croom_id, croom_location, croom_mpop, croom_name, locker_cost, locker_end_date, locker_id,
				locker_location, locker_start_date, prental_de, prental_id, srental_no,
				sroom_rental_etime, sroom_rental_stime, sroom_rental_yn, sroom_seat_id, time1, time2, time3, time4, time5, time6, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RentalDto other = (RentalDto) obj;
		return Objects.equals(croom_id, other.croom_id) && Objects.equals(croom_location, other.croom_location)
				&& croom_mpop == other.croom_mpop && Objects.equals(croom_name, other.croom_name)
				&& locker_cost == other.locker_cost && Objects.equals(locker_end_date, other.locker_end_date)
				&& Objects.equals(locker_id, other.locker_id) && Objects.equals(locker_location, other.locker_location)
				&& Objects.equals(locker_start_date, other.locker_start_date)
				&& Objects.equals(prental_de, other.prental_de) && Objects.equals(prental_id, other.prental_id)
				&& srental_no == other.srental_no
				&& Objects.equals(sroom_rental_etime, other.sroom_rental_etime)
				&& Objects.equals(sroom_rental_stime, other.sroom_rental_stime)
				&& Objects.equals(sroom_rental_yn, other.sroom_rental_yn) && sroom_seat_id == other.sroom_seat_id
				&& time1 == other.time1 && time2 == other.time2
				&& time3 == other.time3 && time4 == other.time4 && time5 == other.time5 && time6 == other.time6
				&& Objects.equals(user_id, other.user_id);
	}
	@Override
	public String toString() {
		return "RentalDto [prental_id=" + prental_id + ", prental_de=" + prental_de + ", user_id=" + user_id + ", croom_id=" + croom_id + ", croom_location="
				+ croom_location + ", croom_mpop=" + croom_mpop + ", croom_name=" + croom_name + ", locker_id="
				+ locker_id + ", locker_location=" + locker_location + ", locker_start_date=" + locker_start_date
				+ ", locker_cost=" + locker_cost + ", locker_end_date=" + locker_end_date + ", sroom_seat_id="
				+ sroom_seat_id + ", sroom_rental_yn=" + sroom_rental_yn + ", srental_no=" + srental_no
				+ ", sroom_rental_stime=" + sroom_rental_stime + ", sroom_rental_etime=" + sroom_rental_etime + "]";
	}

	
}

