<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=addr1]').val(data.address);
				$('[name=addr2]').val(data.buildingName);
			}
		}).open();
	}
	
	function check4to12(ck) {
		
		var pw = $("#pass").val();
	    var num = pw.search(/[0-9]/g);
	    var eng = pw.search(/[a-z]/ig);
	
	     if(pw.length < 4 || pw.length > 12){
	       alert("패스워드는 4자리 ~ 12자리 이내로 입력해주세요.");
	       ck.pass.focus();
	       return false;
	     }else if(pw.search(/\s/) != -1){
	         alert("비밀번호는 공백 없이 입력해주세요.");
	         ck.pass.focus();
	         return false;
	     }else if(num < 0 || eng < 0 ){
	         alert("영문,숫자를 혼합하여 입력해주세요.");
	         ck.pass.focus();
	         return false;
     }
     
     var id = $("#id").val();
     var num = id.search(/[0-9]/g);
     var eng = id.search(/[a-z]/ig);

      if(id.length < 4 || id.length > 12){
        alert("아이디는 4자리 ~ 12자리 이내로 입력해주세요.");
        ck.id.focus();
          return false;
      }else if(id.search(/\s/) != -1){
          alert("비밀번호는 공백 없이 입력해주세요.");
          ck.id.focus();
          return false;
      }else if(num < 0 || eng < 0 ){
          alert("영문,숫자를 혼합하여 입력해주세요.");
          ck.id.focus();
          return false;
      }
	}
	
	function checkEmail() {
		
		//이메일 select선택 시 도메인 부분 채워주기
		$('#last_email_check2').change(function(){
	        //alert("이메일 선택됨");
	
	        //option태그 사이의 텍스트를 읽어온다.
	        var text = $('#last_email_check2 option:selected').text();
	        //value속성에 지정된 값을 읽어온다.
	        var value = $('#last_email_check2 option:selected').val();
	        
	        //alert("선택한 항목의 text : " + text + ", value : " + value);
	        
	        //'선택하세요'를 선택
	        if(value == ''){ 
	            $('#email_2').attr('readonly', true).val('');
	        }
	        //'직접입력'을 선택
	        else if(value == 'direct'){
	            $('#email_2').attr('readonly', false).val('');
	        }
	        //그 외 도메인을 선택
	        else{
	            $('#email_2').attr('readonly', true);
	            //위에서 읽어온 값을 도메인 부분에 입력한다.
	            $('#email_2').val(value);
	        }
	
	    });
	}
	
	function idCheck(fn) {
    	//중복체크시 입력된 아이디가 없다면...
        if (fn.id.value == "") {
            alert("아이디를 입력후 중복확인을 누르세요.");
            fn.id.focus;
            return false;
        } else {
        	//아이디를 입력한 경우라면 입력필드를 readonly로 변경하고 팝업창을 띄운다.
            fn.id.readOnly = true;
        	//중복확인창을 띄울때 입력한 아이디를 파라미터로 전달한다.
            window.open("id_overapping.jsp?id=" + fn.id.value,
                "idover", "width=450, height=250");
        	return false;
        }
    }
	
</script>

<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/member/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">
					<%@ include file="../include/member_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">
						<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입
				
						<p>
					</div>

					<p class="join_title">
						<img src="../images/join_tit03.gif" alt="회원정보입력" />
					</p>
					<form action="JoinProcess.jsp" method="post" name="joinFrm"
						onsubmit="return check4to12(this)">
						<table cellpadding="0" cellspacing="0" border="0" class="join_box">
							<colgroup>
								<col width="80px;" />
								<col width="*" />
							</colgroup>
							<tr>
								<th><img src="../images/join_tit001.gif" /></th>
								<td><input type="text" name="name" value=""
									class="join_input" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit002.gif" /></th>
								<td><input type="text" name="id" id="id" value="" class="join_input" /> &nbsp;
								<button onclick="return idCheck(this.form)"><img src="../images/btn_idcheck.gif" alt=""/></button>
								&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit003.gif" /></th>
								<td><input type="password" name="pass" id="pass" value=""
									class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의
										영문/숫자 조합</span></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit04.gif" /></th>
								<td><input type="password" name="pass2" value=""
									class="join_input" /></td>
							</tr>


							<tr>
								<th><img src="../images/join_tit06.gif" /></th>
								<td><input type="text" name="tel1" value="" maxlength="3"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" name="tel2" value="" maxlength="4"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" name="tel3" value="" maxlength="4"
									class="join_input" style="width: 50px;" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit07.gif" /></th>
								<td><input type="text" name="mobile1" value=""
									maxlength="3" class="join_input" style="width: 50px;" />&nbsp;-&nbsp;
									<input type="text" name="mobile2" value="" maxlength="4"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" name="mobile3" value="" maxlength="4"
									class="join_input" style="width: 50px;" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit08.gif" /></th>
								<td><input type="text" name="email_1" style="width: 100px; height: 20px; border: solid 1px #dadada;" value="" /> @ 
								<input type="text" id="email_2" name="email_2" style="width: 150px; height: 20px; border: solid 1px #dadada;" value="" readonly/>
									<select name="last_email_check2" onChange="checkEmail()" class="pass" id="last_email_check2">
										<option selected="" value="">선택해주세요</option>
										<option value="direct">직접입력</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="empal.com">empal.com</option>
										<option value="empas.com">empas.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="intizen.com">intizen.com</option>
										<option value="korea.com">korea.com</option>
										<option value="kornet.net">kornet.net</option>
										<option value="msn.co.kr">msn.co.kr</option>
										<option value="nate.com">nate.com</option>
										<option value="naver.com">naver.com</option>
										<option value="netian.com">netian.com</option>
										<option value="orgio.co.kr">orgio.co.kr</option>
										<option value="paran.com">paran.com</option>
										<option value="sayclub.com">sayclub.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="yahoo.com">yahoo.com</option>
								</select> <input type="checkbox" name="open_email" value="1"> <span>이메일
										수신동의</span></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit09.gif" /></th>
								<td><input type="text" name="zip" value="" class="join_input" style="width: 80px;" />
								<%-- <a href="javascript:;" title="새 창으로 열림" name="zip" onclick="zipFind('zipFind', '<?=$_Common[bbs_path]?>member_zipcode_find.php', 590, 500, 0);" onkeypress="openZipSearch()">[우편번호검색]</a> --%>
									<button type="button"
										style="width: 100px; height: 32px; background-color: white; border: 0; outline: 0;"
										onclick="openZipSearch()">[우편번호검색]</button> <br /> <input
									type="text" name="addr1" value="" class="join_input"
									style="width: 550px; margin-top: 5px;" readonly /><br> <input
									type="text" name="addr2" value="" class="join_input"
									style="width: 550px; margin-top: 5px;" /></td>
							</tr>
						</table>

						<p style="text-align: center; margin-bottom: 20px">
							<input type="image" src="../images/btn01.gif" /> &nbsp;&nbsp; <a
								href="../main/main.jsp"><img src="../images/btn02.gif" /></a>
						</p>
					</form>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>
