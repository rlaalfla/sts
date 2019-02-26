<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-3.2.1.min.js">
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function openDaumPostcode(){
	//alert("A")
	new daum.Postcode({
		oncomplete:function(data){
			document.getElementById('zipcode').value=data.postcode1+"-"+data.postcode2;
			document.getElementById('addr').value=data.address;
 		}
		
	}).open();
}//openDaumPostcode()---
</script>

<script type="text/javascript">
	function check(){//데이터 유효성 체크 하기 위한 함수 
		 if($('#id').val()==''){
			 alert("id를 입력하시요");
			 $('#id').val('').focus();
			 return false;
		 }
	   
		 if($('#passwd').val()==''){
			 alert("암호 를 입력하시요");
			 $('#passwd').focus();
			 return false;
		 }
        
		 if($('#passwd2').val()==''){
			 alert("암호확인를 입력하시요");
			 $('#passwd2').focus();
			 return false;
		 }
			  
		 if($('#passwd').val() != $('#passwd2').val()){
			 alert("암호와 암호확인이 일치하지 않습니다");
			 $('#passwd2').val('')
			 $('#passwd').val('').focus()
			 return false;
		 }

		 if($('#name').val()==''){
			 alert("name를 입력하시요");
			 $('#name').focus();
			 return false;
		 }
		 return true;

	}//check() end

	//ajax이용하여 id사용 여부 체크 
	function idCheck(){
		 
		if($('#id').val()==''){
			alert("id를 입력하시요");
			$('#id').focus();

		}else{
			$.ajax({
				type:"POST",
				url:"idCheck.do",
				data:"id="+$('#id').val(),
				dataType:'JSON',
				success:function(data){
					//alert(data.check);//1   -1 
					
					if(data.check==1){
						alert("사용 가능한 id");
						$('#passwd').val('').focus();

					}else{//check==-1
						alert("사용 중입니다 id");
						$('#id').focus();
					}
				}//success end
			});
		}//else end
		
	}//idCheck() end
</script>

<style type="text/css">
  	body{background-color: #fffafa;}
    
	table{
	margin:auto;
	line-height:40px; 
	border:1px; 
	width:80%; 
	background-color: #c8c8ff;
	}
	
	#header{
	background-color:#9370db;
	}
</style>

</head>
<body>
  <h2><center>회원가입</center></h2>
  <form method="post" name="writeForm" action="insertPro.do" onSubmit="return check()">
  	   <table>
  	     <tr>
		    <td>ID</td>
		    <td>
		    <input type="text" id="id" name="id" size="10"/>
		    <input type="button" id="btn" value="id중복체크" onClick="idCheck()">
		    </td>
  		</tr>
  	   
  	    <tr>
	     <td>암호</td>
	     <td><input type="password" id="passwd" name="passwd" size="20"/></td>
	  	</tr>
	  	   
  	   <tr>
     	<td>암호확인</td>
     	<td><input type="password" id="passwd2" name="passwd2" size="20"/></td>
  	   </tr>
  
  	   <tr>
    	<td>이름</td>
   		<td><input type="text" id="name" name="name" size="20"/></td>
  	   </tr>
  	   
  	   <tr>
	   <td>주민번호</td>
	   <td>
	   <input type="password" id="jumin1" name="jumin1" size="6" maxlength="6"/>-
	   <input type="password" id="jumin2" name="jumin2" size="7" maxlength="7"/> 
	   </td>
	   </tr>
  	   
  	   <tr>
	   <td>Email</td>
	   <td><input type="text" id="email" name="email" size="30"/></td>
	   </tr>
  	   
  	   <tr>
		<td>우편번호</td>
		<td>
			<input type="text" name="zipcode"  id="zipcode" size=7>
			<input type="button" value="우편번호찾기" onclick="openDaumPostcode()">
		</td>
	   </tr>

  	   <tr>
		<td>주소</td>
		<td>
			<input type="text" name="addr" id="addr" size=50><br>
		</td>
	   </tr>
  	   
  	    <tr>
		<td>상세주소</td>
		<td>
			<input type="text" name="details" id="details" size=30><br>
		</td>
	   </tr>
	   
	   
		<tr>
			<td>직업</td>
			<td>
				<select name="job" id="job">
					<option value="0">선택하시요</option>
					<option value="회사원">회사원</option>
					<option value="연구전문직">연구전문직</option>
					<option value="교수학생">교수학생</option>
					<option value="공무원">공무원</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="회원가입">
		<input type="reset" value="다시입력">
		<input type="button" value="가입안함" onClick="location='main.do'">
		</td>
	</tr>
	
	   
	   
  	   </table>
  </form>
</body>
</html>