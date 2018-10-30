package com.ft.controller;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class NoticeController {
	
	public void doGet() {
		String command = request.getPathInfo();
		
		ActionForward actionForward = noticeService.selectOne();
		
		if()
		
	}
	
	
	
}
