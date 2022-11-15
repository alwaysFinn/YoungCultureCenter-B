package com.youngtvjobs.ycc.course;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/*
 * course_id    integer NOT NULL,
    course_nm    character varying(255) NOT NULL,
    course_image    character varying(255),
    course_reg_start_date    date NOT NULL,
    course_reg_end_date    date NOT NULL,
    course_start_date    date NOT NULL,
    course_end_date    date NOT NULL,
    course_day    character(30) NOT NULL,
    course_time    character(14) NOT NULL,
    course_target    character(10) NOT NULL,
    course_cost    integer NOT NULL,
    course_info    character varying(5000) NOT NULL,
    user_id    character(16) NOT NULL,
    croom_id    character(10) NOT NULL
 */
public class CourseDto {
	
	private int course_id;
	private String course_nm;
	private String course_image;
	private Date course_reg_start_date;
	private Date course_reg_end_date;
	private Date course_start_date;
	private Date course_end_date;
	private String course_day;
	private String course_time; //구글링
	private String course_target;
	private int course_cost;
	private String course_info;
	private String user_id;
	private String user_name;
	private String croom_id;
	private String course_reg_stat;
	
	public CourseDto() {
		// TODO Auto-generated constructor stub
	}

	public CourseDto(int course_id, String course_nm, String course_image, Date course_reg_start_date,
			Date course_reg_end_date, Date course_start_date, Date course_end_date, String course_day,
			String course_time, String course_target, int course_cost, String course_info, String user_id,
			String user_name, String croom_id, String course_reg_stat) {
		super();
		this.course_id = course_id;
		this.course_nm = course_nm;
		this.course_image = course_image;
		this.course_reg_start_date = course_reg_start_date;
		this.course_reg_end_date = course_reg_end_date;
		this.course_start_date = course_start_date;
		this.course_end_date = course_end_date;
		this.course_day = course_day;
		this.course_time = course_time;
		this.course_target = course_target;
		this.course_cost = course_cost;
		this.course_info = course_info;
		this.user_id = user_id;
		this.user_name = user_name;
		this.croom_id = croom_id;
		this.course_reg_stat = course_reg_stat;
	}

	public CourseDto(int course_id, String course_nm, String course_image, Date course_reg_start_date,
			Date course_reg_end_date, Date course_start_date, Date course_end_date, String course_day,
			String course_time, String course_target, int course_cost, String course_info, String user_id,
			String croom_id, String course_reg_stat) {
		//super();
		this.course_id = course_id;
		this.course_nm = course_nm;
		this.course_image = course_image;
		this.course_reg_start_date = course_reg_start_date;
		this.course_reg_end_date = course_reg_end_date;
		this.course_start_date = course_start_date;
		this.course_end_date = course_end_date;
		this.course_day = course_day;
		this.course_time = course_time;
		this.course_target = course_target;
		this.course_cost = course_cost;
		this.course_info = course_info;
		this.user_id = user_id;
		this.croom_id = croom_id;
		this.course_reg_stat = course_reg_stat;
	}

	@Override
	public int hashCode() {
		return Objects.hash(course_cost, course_day, course_end_date, course_id, course_image, course_info, course_nm,
				course_reg_end_date, course_reg_start_date, course_reg_stat, course_start_date, course_target,
				course_time, croom_id, user_id, user_name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CourseDto other = (CourseDto) obj;
		return course_cost == other.course_cost && Objects.equals(course_day, other.course_day)
				&& Objects.equals(course_end_date, other.course_end_date) && course_id == other.course_id
				&& Objects.equals(course_image, other.course_image) && Objects.equals(course_info, other.course_info)
				&& Objects.equals(course_nm, other.course_nm)
				&& Objects.equals(course_reg_end_date, other.course_reg_end_date)
				&& Objects.equals(course_reg_start_date, other.course_reg_start_date)
				&& Objects.equals(course_reg_stat, other.course_reg_stat)
				&& Objects.equals(course_start_date, other.course_start_date)
				&& Objects.equals(course_target, other.course_target) && Objects.equals(course_time, other.course_time)
				&& Objects.equals(croom_id, other.croom_id) && Objects.equals(user_id, other.user_id)
				&& Objects.equals(user_name, other.user_name);
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getCourse_nm() {
		return course_nm;
	}

	public void setCourse_nm(String course_nm) {
		this.course_nm = course_nm;
	}

	public String getCourse_image() {
		return course_image;
	}

	public void setCourse_image(String course_image) {
		this.course_image = course_image;
	}

	public Date getCourse_reg_start_date() {
		return course_reg_start_date;
	}

	public void setCourse_reg_start_date(Date course_reg_start_date) {
		this.course_reg_start_date = course_reg_start_date;
	}

	public Date getCourse_reg_end_date() {
		return course_reg_end_date;
	}

	public void setCourse_reg_end_date(Date course_reg_end_date) {
		this.course_reg_end_date = course_reg_end_date;
	}

	public Date getCourse_start_date() {
		return course_start_date;
	}

	public void setCourse_start_date(Date course_start_date) {
		this.course_start_date = course_start_date;
	}

	public Date getCourse_end_date() {
		return course_end_date;
	}

	public void setCourse_end_date(Date course_end_date) {
		this.course_end_date = course_end_date;
	}

	public String getCourse_day() {
		return course_day;
	}

	public void setCourse_day(String course_day) {
		this.course_day = course_day;
	}

	public String getCourse_time() {
		return course_time;
	}

	public void setCourse_time(String course_time) {
		this.course_time = course_time;
	}

	public String getCourse_target() {
		return course_target;
	}

	public void setCourse_target(String course_target) {
		this.course_target = course_target;
	}

	public int getCourse_cost() {
		return course_cost;
	}

	public void setCourse_cost(int course_cost) {
		this.course_cost = course_cost;
	}

	public String getCourse_info() {
		return course_info;
	}

	public void setCourse_info(String course_info) {
		this.course_info = course_info;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getCroom_id() {
		return croom_id;
	}

	public void setCroom_id(String croom_id) {
		this.croom_id = croom_id;
	}

	public String getCourse_reg_stat() {
		return course_reg_stat;
	}

	public void setCourse_reg_stat(String course_reg_stat) {
		this.course_reg_stat = course_reg_stat;
	}

	public String reg_sd() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String reg_start_date = sdFormat.format(course_reg_start_date);
		
		return reg_start_date;
	}
	
	public String reg_ed() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String reg_end_date = sdFormat.format(course_reg_end_date);
		
		return reg_end_date;
	}
	
	public String course_sd() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String start_date = sdFormat.format(course_start_date);
		
		return start_date;
	}
	
	public String course_ed() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String end_date = sdFormat.format(course_end_date);
		
		return end_date;
	}

}
