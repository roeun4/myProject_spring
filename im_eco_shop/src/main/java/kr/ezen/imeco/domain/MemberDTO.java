package kr.ezen.imeco.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String dob;
	private String addr;
	private String email;
	private String tel;
	private Date rdate; 
	
}
