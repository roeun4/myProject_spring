package kr.ezen.util;

public enum ProdSpec {
	HIT("인기"), NEW("최신"), RECOMMEND("추천");
	
	private final String value;
	
	private ProdSpec(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
