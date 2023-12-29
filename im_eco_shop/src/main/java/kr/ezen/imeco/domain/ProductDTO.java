package kr.ezen.imeco.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int pnum;
	private String pname;
	private String pcategory_fk;
	private String pcompany;
	private String pimage;
	private int pqty;
	private int price;
	private String pspec;
	private String pcontent;
	private int point;
	private Date pinputDate;
	
	private int totPrice;
	private int totPoint;

	// totPrice와 totPoint 계산	
	public void setPqty(int pqty) {
		this.pqty = pqty;
		
		totPrice = this.pqty*price;
		totPoint = this.pqty*point;
	}
}
