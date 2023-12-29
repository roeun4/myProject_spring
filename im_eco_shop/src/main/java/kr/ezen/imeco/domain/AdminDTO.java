package kr.ezen.imeco.domain;

import lombok.Data;

@Data
public class AdminDTO {
	public static final int ADMIN_LOGIN_SUCCESS = 1;
	public static final int ADMIN_LOGIN_PWD_FAIL = 0;
	public static final int ADMIN_LOGIN_ID_NOT = -1;
	
	private String id;
	private String password;
	private String name;
	private String email;
	
}
