package kr.co.mlec.member.vo;

public class MemberVO {
   
   private int no;
   private String id;
   private String password;
   private String name;
   private String addr;
   private String type; // "S" :관리자 "U" : 사용자
   private String regDate;
   private String mymbti;
   private String likembti;
   private String dislikembti;
   private String addrx;
   private String addry;
   
public MemberVO() {
	super();
	// TODO Auto-generated constructor stub
}



public MemberVO(int no, String id, String password, String name, String type, String regDate, String mymbti,
		String likembti, String dislikembti, String addrx, String addry) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.type = type;
	this.regDate = regDate;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
	this.addrx = addrx;
	this.addry = addry;
}



public MemberVO(int no, String id, String password, String name, String addr, String type, String regDate,
		String mymbti, String likembti, String dislikembti, String addrx, String addry) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.addr = addr;
	this.type = type;
	this.regDate = regDate;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
	this.addrx = addrx;
	this.addry = addry;
}


public MemberVO(int no, String id, String password, String name, String addr, String type, String regDate,
		String mymbti, String likembti, String dislikembti) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.addr = addr;
	this.type = type;
	this.regDate = regDate;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
}


public MemberVO(String id, String name, String mymbti, String likembti, String dislikembti, String addrx,
		String addry) {
	super();
	this.id = id;
	this.name = name;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
	this.addrx = addrx;
	this.addry = addry;
}



public MemberVO(int no, String id, String password, String name, String mymbti, String likembti, String dislikembti,
		String addrx, String addry) {
	super();
	this.no = no;
	this.id = id;
	this.password = password;
	this.name = name;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
	this.addrx = addrx;
	this.addry = addry;
}



public MemberVO(String id, String name, String addr, String mymbti, String likembti, String dislikembti, String addrx,
		String addry) {
	super();
	this.id = id;
	this.name = name;
	this.addr = addr;
	this.mymbti = mymbti;
	this.likembti = likembti;
	this.dislikembti = dislikembti;
	this.addrx = addrx;
	this.addry = addry;
}



public MemberVO(String id, String password, String name) {
	super();
	this.id = id;
	this.password = password;
	this.name = name;
}

public int getNo() {
	return no;
}

public void setNo(int no) {
	this.no = no;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAddr() {
	return addr;
}

public void setAddr(String addr) {
	this.addr = addr;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getRegDate() {
	return regDate;
}

public void setRegDate(String regDate) {
	this.regDate = regDate;
}

public String getMymbti() {
	return mymbti;
}

public void setMymbti(String mymbti) {
	this.mymbti = mymbti;
}

public String getLikembti() {
	return likembti;
}

public void setLikembti(String likembti) {
	this.likembti = likembti;
}

public String getDislikembti() {
	return dislikembti;
}

public void setDislikembti(String dislikembti) {
	this.dislikembti = dislikembti;
}

public String getAddrx() {
	return addrx;
}

public void setAddrx(String addrx) {
	this.addrx = addrx;
}

public String getAddry() {
	return addry;
}

public void setAddry(String addry) {
	this.addry = addry;
}

@Override
public String toString() {
	return "MemberVO [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", addr=" + addr
			+ ", type=" + type + ", regDate=" + regDate + ", mymbti=" + mymbti + ", likembti=" + likembti
			+ ", dislikembti=" + dislikembti + ", addrx=" + addrx + ", addry=" + addry + "]";
}



   
   
   
   }
