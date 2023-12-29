package kr.ezen.imeco.mapper;

import java.util.List;

import kr.ezen.imeco.domain.BoardDTO;
import kr.ezen.imeco.domain.PageDTO;

public interface BoardMapper {
	// 게시글 등록
	void insert(BoardDTO dto);
	
	// 게시판 리스트
//	List<BoardDTO> getList();
	List<BoardDTO> getList(PageDTO pDto);
	
	// 글상세보기
	BoardDTO view(int bid);

	void update(BoardDTO dto);

	void delete(int bid);
	
	// 조회수 추가
	void hitAdd(int bid);
	
	// 검색어 없을 경우 전체 게시글 수
//	int totalCnt();
	// 검색어 있을 경우 전체 게시글 수
	int totalCnt(PageDTO pDto);
	
}
