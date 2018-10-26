package com.ft.board;

public interface BoardReply {

	//reply
	public int reply(BoardReplyDTO brdt) throws Exception;
	
	//replyUpdate
	public int replyUpdate(BoardReplyDTO brdt) throws Exception;
}
