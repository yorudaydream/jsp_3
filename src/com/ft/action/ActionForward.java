package com.ft.action;

public class ActionForward {

	private boolean check; //true : forward, false :  redirect
	private String path;   // 요청 경로
	
	public boolean isCheck() {
		return check;
	}
	public void setCheck(boolean check) {
		this.check = check;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	

}
