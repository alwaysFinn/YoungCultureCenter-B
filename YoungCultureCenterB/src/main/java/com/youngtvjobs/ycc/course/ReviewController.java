package com.youngtvjobs.ycc.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@PatchMapping("/course/reviews/{review_id}")
	public ResponseEntity<String> modify(@PathVariable Integer review_id
											, @RequestBody ReviewDto reviewDto, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		
		reviewDto.setUser_id(user_id);
		reviewDto.setReview_id(review_id);
		
		try {
			if(reviewService.modify(reviewDto) != 1) 
				throw new Exception("Update failed.");
				
			return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}
		
	@DeleteMapping("/course/reviews/{review_id}")
	public ResponseEntity<String> remove(@PathVariable Integer review_id, Integer course_id, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		
		try {
			int rowCnt = reviewService.reviewDelete(review_id, course_id, user_id);
			
			if(rowCnt != 1)
				throw new Exception("Delete Failed");
			
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/course/reviews")
	public ResponseEntity<String> write(@RequestBody ReviewDto reviewDto, Integer course_id, HttpSession session){
		String user_id = (String) session.getAttribute("id");
		
		reviewDto.setUser_id(user_id);
		reviewDto.setCourse_id(course_id);
		
		System.out.println("reviewDto" + reviewDto);
		
		try {
			if(reviewService.reviewWrite(reviewDto) != 1)
				throw new Exception("write failed");
			
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/course/reviews")
	@ResponseBody
	public ResponseEntity<List<ReviewDto>> list(Integer course_id, CourseSearchItem sc, Model m){
		List<ReviewDto> list = null;
		
		try {
			list = reviewService.selectReviewList(course_id);
			System.out.println("list = " + list);
			
//			int totalCnt = reviewService.getCourseReviewCnt(sc);
//			m.addAttribute("totalCnt", totalCnt);
//			System.out.println("리뷰개수:"+ totalCnt);
//			
//			PageResolver pageResolver1 = new PageResolver(totalCnt, sc);
//			m.addAttribute("prRe", pageResolver1);

			return new ResponseEntity<List<ReviewDto>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<List<ReviewDto>>(HttpStatus.BAD_REQUEST);
		}
	}
}
