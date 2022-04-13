function inputCheck(){
	if(document.regFrm.id.value ==""){
		alert("아이디를 입력해 주세요");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pwd.value == ""){
		alert("비밀번호를 입력해 주세요");
		document.regFrm.pwd.focus();
		return;
	}
	if(document.regFrm.repwd.value == ""){
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.name.value == ""){
		alert("이름을 입력해 주세요");
		document.regFrm.name.focus();
		return;
	}
	document.regFrm.submit();
}

function win_close(){
	self.close();
}