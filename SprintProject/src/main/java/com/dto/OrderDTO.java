package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("OrderDTO")
public class OrderDTO {

	
	private int oid;
	private String mid;
	private String gid;
	private String ordate;
	private String oname;
	private String ophone1;
	private String ophone2;
	private String ophone3;
	private String oaddress1;
	private String oaddress2;
	private String opost;
	private int oprice;
	private int oamount;
	private String opayment;
	private int oinvoice;
	private int odelivery;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int oid, String mid, String gid, String ordate, String oname, String ophone1, String ophone2,
			String ophone3, String oaddress1, String oaddress2, String opost, int oprice, int oamount, String opayment,
			int oinvoice, int odelivery) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.gid = gid;
		this.ordate = ordate;
		this.oname = oname;
		this.ophone1 = ophone1;
		this.ophone2 = ophone2;
		this.ophone3 = ophone3;
		this.oaddress1 = oaddress1;
		this.oaddress2 = oaddress2;
		this.opost = opost;
		this.oprice = oprice;
		this.oamount = oamount;
		this.opayment = opayment;
		this.oinvoice = oinvoice;
		this.odelivery = odelivery;
	}
	@Override
	public String toString() {
		return "OrderDTO [oid=" + oid + ", mid=" + mid + ", gid=" + gid + ", ordate=" + ordate + ", oname=" + oname
				+ ", ophone1=" + ophone1 + ", ophone2=" + ophone2 + ", ophone3=" + ophone3 + ", oaddress1=" + oaddress1
				+ ", oaddress2=" + oaddress2 + ", opost=" + opost + ", oprice=" + oprice + ", oamount=" + oamount
				+ ", opayment=" + opayment + ", oinvoice=" + oinvoice + ", odelivery=" + odelivery + "]";
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getOrdate() {
		return ordate;
	}
	public void setOrdate(String ordate) {
		this.ordate = ordate;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOphone1() {
		return ophone1;
	}
	public void setOphone1(String ophone1) {
		this.ophone1 = ophone1;
	}
	public String getOphone2() {
		return ophone2;
	}
	public void setOphone2(String ophone2) {
		this.ophone2 = ophone2;
	}
	public String getOphone3() {
		return ophone3;
	}
	public void setOphone3(String ophone3) {
		this.ophone3 = ophone3;
	}
	public String getOaddress1() {
		return oaddress1;
	}
	public void setOaddress1(String oaddress1) {
		this.oaddress1 = oaddress1;
	}
	public String getOaddress2() {
		return oaddress2;
	}
	public void setOaddress2(String oaddress2) {
		this.oaddress2 = oaddress2;
	}
	public String getOpost() {
		return opost;
	}
	public void setOpost(String opost) {
		this.opost = opost;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public int getOamount() {
		return oamount;
	}
	public void setOamount(int oamount) {
		this.oamount = oamount;
	}
	public String getOpayment() {
		return opayment;
	}
	public void setOpayment(String opayment) {
		this.opayment = opayment;
	}
	public int getOinvoice() {
		return oinvoice;
	}
	public void setOinvoice(int oinvoice) {
		this.oinvoice = oinvoice;
	}
	public int getOdelivery() {
		return odelivery;
	}
	public void setOdelivery(int odelivery) {
		this.odelivery = odelivery;
	}
	
	
	
	
	
	
}
