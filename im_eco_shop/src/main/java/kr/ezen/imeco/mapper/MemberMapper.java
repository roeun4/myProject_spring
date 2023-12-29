package kr.ezen.imeco.mapper;

import java.util.List;

import kr.ezen.imeco.domain.MemberDTO;

public interface MemberMapper {
	List<MemberDTO> memberList();
	
	int memberInsert(MemberDTO dto);
	
	MemberDTO memberInfo(int no);
	
	int deleteMember(int no);
	
	int memberUpdate(MemberDTO dto);
	
	MemberDTO idCheck(String uid);

	MemberDTO memberLogin(MemberDTO dto);

	String findId(MemberDTO dto);

	int findPw(String uid, String uEmail, String tempPw);

	int updatePw(MemberDTO dto);
}
