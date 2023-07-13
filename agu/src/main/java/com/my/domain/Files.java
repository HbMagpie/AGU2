package com.my.domain;


public class Files {
	
	private int productnum;
	private String filename;
	private String filerealname;
	private String fileurl;
	private String safefile;
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilerealname() {
		return filerealname;
	}
	public void setFilerealname(String filerealname) {
		this.filerealname = filerealname;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getSafefile() {
		return safefile;
	}
	public void setSafefile(String safefile) {
		this.safefile = safefile;
	}
	
	@Override
	public String toString() {
		return "Files [productnum=" + productnum + ", filename=" + filename + ", filerealname=" + filerealname
				+ ", fileurl=" + fileurl + ", safefile=" + safefile + "]";
	}
	
}
