package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("StockDTO2")
public class StockDTO2 {
	String gid;
	String gcolor;
	int gstock;
	String gsize;
	String gname;
	int num;

	public StockDTO2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "StockDTO2 [gid=" + gid + ", gcolor=" + gcolor + ", gstock=" + gstock + ", gsize=" + gsize + ", gname="
				+ gname + ", num=" + num + "]";
	}

	public StockDTO2(String gid, String gcolor, int gstock, String gsize, String gname, int num) {
		super();
		this.gid = gid;
		this.gcolor = gcolor;
		this.gstock = gstock;
		this.gsize = gsize;
		this.gname = gname;
		this.num = num;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public int getGstock() {
		return gstock;
	}

	public void setGstock(int gstock) {
		this.gstock = gstock;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}
	
	
}
