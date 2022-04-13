package kr.co.mlec.board.vo;
 
public class PagingVO {
    private int page =1; //현재 페이지 (get)
    private int totalCount; //row 전체의 수 (get)
    private int beginPage;  //출력 시작
    private int endPage;    //출력 끝
    private int displayRow =10;  //한 페이지에 몇 개의 로우 (선택 set)
    private int displayPage =5;  //한 페이지에 몇 개의 페이지 (선택 set)
    private int startNum;
    private int endNum;
    boolean prev; //prev 버튼이 보일건지 안보일건지
    boolean next;
	public PagingVO() {
		super();
			
		
	}
	public PagingVO(int page, int totalCount, int beginPage, int endPage, int displayRow, int displayPage, int startNum,
			int endNum, boolean prev, boolean next) {
		super();
		this.page = page;
		this.totalCount = totalCount;
		this.beginPage = beginPage;
		this.endPage = endPage;
		this.displayRow = displayRow;
		this.displayPage = displayPage;
		this.startNum = startNum;
		this.endNum = endNum;
		this.prev = prev;
		this.next = next;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
		
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	@Override
	public String toString() {
		return "Paging [page=" + page + ", totalCount=" + totalCount + ", beginPage=" + beginPage + ", endPage="
				+ endPage + ", displayRow=" + displayRow + ", displayPage=" + displayPage + ", startNum=" + startNum
				+ ", endNum=" + endNum + ", prev=" + prev + ", next=" + next + "]";
	} 
	
	
			
	private void paging() {

		startNum = (page - 1) * displayRow + 1;
		endNum = page * displayRow;

		endPage = ((int) Math.ceil(page / (double) displayPage)) * displayPage;
		System.out.println("endPage : " + endPage);

		beginPage = endPage - (displayPage - 1);
		System.out.println("beginPage : " + beginPage);

		int totalPage = (int) Math.ceil(totalCount / (double) displayRow);

		if (totalPage < endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		prev = (beginPage == 1) ? false : true;// page가 11이상에만 나온다.
		System.out.println("endPageppp : " + endPage);
		System.out.println("totalPagepppp : " + totalPage);

	}
	
	

	}

	
