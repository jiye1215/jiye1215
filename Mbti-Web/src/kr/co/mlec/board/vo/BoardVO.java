package kr.co.mlec.board.vo;

public class BoardVO {

	private int no;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;
	private String regDate;
	private int ref; // 계층형게시판, 글의 그룹(답글 내 같은 그룹)
	private int reStep; // 계층형 게시판, 글의 순서(order)(같은 그룹내에서 원글과의 거리 설정)
	private int reLevel; // 계층형 게시판, 글의 레벨(답글일 경우 들여쓰기 설정)
	
	public BoardVO() {
	}
	
	

	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate,
			int ref, int reStep, int reLevel) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.ref = ref;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}




	

	public BoardVO(int no, String title, String writer, int viewCnt, String regDate, int ref, int reStep, int reLevel) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.ref = ref;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}



	public BoardVO(int no, String title, String writer, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}

	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	public BoardVO(String title, String writer) {
		super();
		this.title = title;
		this.writer = writer;
	}
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}
	

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + ", ref=" + ref + ", reStep=" + reStep + ", reLevel=" + reLevel
				+ "]";
	}

	

	
	
}
