package com.youngtvjobs.ycc.course;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class CourseDto {
	// FROM tb_course
	private int course_id; // 媛뺤쥖踰덊샇
	private String course_nm; // 媛뺤쥖�씠由�
	private String course_image; // 媛뺤쥖�씠誘몄�
	private Date course_reg_start_date; // �젒�닔�떆�옉�씪
	private Date course_reg_end_date; // �젒�닔留덇컧�씪
	private Date course_start_date; // �닔媛뺤떆�옉�씪
	private Date course_end_date; // �닔媛뺤쥌猷뚯씪
	private String course_day; // �닔媛뺤슂�씪
	private String course_time; // �닔媛뺤떆媛� (援ш�留� �븘�슂)
	private String course_target; // �닔媛뺣��긽
	private int course_cost; // �닔媛뺣퉬
	private String course_info; // �닔媛뺤긽�꽭�궡�슜
	private String user_id; // 媛뺤궗�븘�씠�뵒
	private String croom_id; // 媛뺤쓽�떎 �븘�씠�뵒
	private int course_applicants; // �떊泥��씤�썝
	
	// JOIN tb_user
	private String user_name; // 媛뺤궗紐�
	
	//JOIN classroom
	private String croom_name; // 媛뺤쓽�떎�씠由�
	private int croom_mpop; // 媛뺤쓽�떎 �닔�슜�씤�썝 (珥앹썝)
	
	public CourseDto() {
		// TODO Auto-generated constructor stub
	}

	public CourseDto(int course_id, String course_nm, String course_image, Date course_reg_start_date
					, Date course_reg_end_date, Date course_start_date, Date course_end_date, String course_day
					, String course_time, String course_target, int course_cost, String course_info, String user_id
					, String croom_id, int course_applicants, String user_name, String croom_name, int croom_mpop) {
		// super();
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
		this.course_applicants = course_applicants;
		this.user_name = user_name;
		this.croom_name = croom_name;
		this.croom_mpop = croom_mpop;
	}

	@Override
	public int hashCode() {
		return Objects.hash(course_cost, course_day, course_end_date, course_id, course_image, course_info, course_nm
							, course_reg_end_date, course_reg_start_date, course_start_date, course_target, course_time
							, croom_id, user_id, course_applicants, user_name, croom_name, croom_mpop);
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
				&& Objects.equals(course_nm, other.course_nm)&& Objects.equals(course_reg_end_date, other.course_reg_end_date)
				&& Objects.equals(course_reg_start_date, other.course_reg_start_date)
				&& Objects.equals(course_start_date, other.course_start_date)
				&& Objects.equals(course_target, other.course_target) && Objects.equals(course_time, other.course_time)
				&& Objects.equals(croom_id, other.croom_id) && Objects.equals(user_id, other.user_id)
				&& Objects.equals(user_name, other.user_name) && Objects.equals(croom_name, other.croom_name)
				&& Objects.equals(course_applicants, other.course_applicants) && Objects.equals(croom_mpop, other.croom_mpop)
			
	}
	
	// �긽�깭(�삤�뵂�삁�젙, �젒�닔媛��뒫, �젒�닔留덇컧)
	public String course_stat() {
		Date nowdate = new Date();
		
		// 紐⑺몴 �궇吏�
        SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");

        // �쁽�옱 �궇吏�
        final Date todayDate = new Date();

        long rsd_now = course_reg_start_date.getTime() - todayDate.getTime(); // d-day 怨꾩궛
        long now_rsd = todayDate.getTime() - course_reg_start_date.getTime(); // �삤�뒛-�젒�닔�떆�옉�씪 
        long now_red = todayDate.getTime() - course_reg_end_date.getTime(); // �삤�뒛-�젒�닔留덇컧�씪

//		int result1 = nowdate.compareTo(course_reg_start_date); // �삤�뒛-�젒�닔�떆�옉�씪
//		int result2 = nowdate.compareTo(course_reg_end_date); // �삤�뒛-�젒�닔留덇컧�씪
		String stat = null;

		// nowdate�뒗 �젒�닔�떆�옉�씪 �씠�쟾 
		if (now_rsd < 0) {
			stat ="�삤�뵂�삁�젙<br/>"+"[D-"+(rsd_now / (24 * 60 * 60 * 1000) + 1)+"]";
		}
		
		// nowdate�뒗 �젒�닔�떆�옉�씪怨� �젒�닔留덇컧�씪 �궗�씠
		else if(now_rsd >= 0 && now_red < 86400000) { 
			stat = "�젒�닔媛��뒫";
		}
		 
		// nowdate�뒗 �젒�닔留덇컧�씪 �씠�썑
		else {
			stat = "�젒�닔留덇컧";
		}
		
		return stat;
	}

	// Date -> String�쑝濡� �삎蹂��솚(course_reg_start_date, course_reg_end_date, course_start_date, course_end_date)
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
	// END //Date -> String�쑝濡� �삎蹂��솚(course_reg_start_date, course_reg_end_date, course_start_date, course_end_date)//
	
	// getter setter
	public String getCroom_name() {
		return croom_name;
	}

	public int getCourse_applicants() {
		return course_applicants;
	}

	public void setCourse_applicants(int course_applicants) {
		this.course_applicants = course_applicants;
	}

	public int getCroom_mpop() {
		return croom_mpop;
	}

	public void setCroom_mpop(int croom_mpop) {
		this.croom_mpop = croom_mpop;
	}

	public void setCroom_name(String croom_name) {
		this.croom_name = croom_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getCroom_id() {
		return croom_id;
	}

	public void setCroom_id(String croom_id) {
		this.croom_id = croom_id;
	}

	
}
