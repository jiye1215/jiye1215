/**
 * 
 */

// Form에서 입력데이터 유무 체크
function isNull(obj, msg){
	if(obj.value == ''){
		alert(msg)
		obj.focus()
	}
	return false
}