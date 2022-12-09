package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.Objects;

import org.springframework.web.util.UriComponentsBuilder;

public class RentalDto {

	private Integer prental_id; // 대여예약번호(pk)
	private Date prental_de; // 대여날짜
	private String prtime_schedule;// 대여시간
	private String user_id; // 회원아이디 (fk)
	private String croom_id; // 강의실 코드 (fk) classroom의 pk
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
	public RentalDto(Integer prental_id, Date prental_de, String prtime_schedule, String user_id, String croom_id,
			String croom_location, int croom_mpop, String croom_name, String locker_id, String locker_location,
			Date locker_start_date, int locker_cost, Date locker_end_date, Integer sroom_seat_id, String sroom_rental_yn,
			int srental_no, Date sroom_rental_stime, Date sroom_rental_etime) {
		super();
		this.prental_id = prental_id;
		this.prental_de = prental_de;
		this.prtime_schedule = prtime_schedule;
		this.user_id = user_id;
		this.croom_id = croom_id;
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
	public String getPrtime_schedule() {
		return prtime_schedule;
	}
	public void setPrtime_schedule(String prtime_schedule) {
		this.prtime_schedule = prtime_schedule;
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
				locker_location, locker_start_date, prental_de, prental_id, prtime_schedule, srental_no,
				sroom_rental_etime, sroom_rental_stime, sroom_rental_yn, sroom_seat_id, user_id);
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
				&& Objects.equals(prtime_schedule, other.prtime_schedule) && srental_no == other.srental_no
				&& Objects.equals(sroom_rental_etime, other.sroom_rental_etime)
				&& Objects.equals(sroom_rental_stime, other.sroom_rental_stime)
				&& Objects.equals(sroom_rental_yn, other.sroom_rental_yn) && sroom_seat_id == other.sroom_seat_id
				&& Objects.equals(user_id, other.user_id);
	}
	@Override
	public String toString() {
		return "RentalDto [prental_id=" + prental_id + ", prental_de=" + prental_de + ", prtime_schedule="
				+ prtime_schedule + ", user_id=" + user_id + ", croom_id=" + croom_id + ", croom_location="
				+ croom_location + ", croom_mpop=" + croom_mpop + ", croom_name=" + croom_name + ", locker_id="
				+ locker_id + ", locker_location=" + locker_location + ", locker_start_date=" + locker_start_date
				+ ", locker_cost=" + locker_cost + ", locker_end_date=" + locker_end_date + ", sroom_seat_id="
				+ sroom_seat_id + ", sroom_rental_yn=" + sroom_rental_yn + ", srental_no=" + srental_no
				+ ", sroom_rental_stime=" + sroom_rental_stime + ", sroom_rental_etime=" + sroom_rental_etime + "]";
	}

	
}
