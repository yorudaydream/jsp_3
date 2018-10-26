package com.ft.page;

public class MakePager {

	private int curPage;
	private int perPage;
	private RowNumber rowNumber;
	private Search search;

	
	public MakePager(int curPage, int perPage, String search, String kind) {
		this(curPage, 10, search, kind);
	}
	
	public MakePager(int curpage, String search, String kind) {
		this.curPage= curPage;
		this.search = new Search();
		this.search.setKind(kind);
		this.search.setSearch(search);
		this.perPage=perPage;
	}
	
	
	public RowNumber makeRow() {
		rowNumber =  new RowNumber();
		rowNumber.setStartRow((this.curPage-1)*this.perPage);
		rowNumber.setLastRow(this.curPage*this.perPage);
		rowNumber.setSearch(this.search);
		
		return rowNumber;
		
	}
	
	
	public Pager makePage(int totalCount) {
		//1.totalPage
		int totalPage = totalCount/this.perPage;
		if(totalCount%this.perPage !=0) {
			totalPage++;
		}
		
		
		//2. totalBlock
		int perBlock = 5;
		int totalBlock = totalPage/perBlock;
		if(totalPage%perBlock != 0) {
			totalBlock++;
		}
		
		//3. curBlock
		int curBlock = this.curPage/perBlock;
		if(this.curPage%perBlock != 0) {
			curBlock++;
		}			
		
		//4. startNum, lastNum
		int startNum = (curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		
		//5.curBlock이 마지막 Block 일때
		if(curBlock == totalBlock) {
			lastNum = totalPage;
		}
		
		Pager pager = new Pager();
		pager.setCurBlock(curBlock);
		pager.setTotalBlock(totalBlock);
		pager.setStartNum(startNum);
		pager.setLastNum(lastNum);
		pager.setSearch(search);
		
		return pager;
				
	}
	
}
