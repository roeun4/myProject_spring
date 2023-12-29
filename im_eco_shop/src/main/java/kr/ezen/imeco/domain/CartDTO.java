package kr.ezen.imeco.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {
	private int cart_num;
	private String id;
	private int pnum;
	private int pqty;
	private Date indate;
	
	private String pname;
	private String pimage;
	private int price;
	private int point;
	private String pspec;
	
	private int totPrice;
	private int totPoint;
	
	public void setTotal() {
		this.totPrice = this.pqty*price;
		this.totPoint = this.pqty*point;
	}
	
}
