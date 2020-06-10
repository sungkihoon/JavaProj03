<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model1.BbsDTO"%>
<%@page import="model1.BbsDAO"%>
<%@ include file="../include/global_head.jsp"%>
<%@ include file="isFlag.jsp"%>

<%
	//폼값받기  - 파라미터로 전달된 게시물의 일련번호
	String num = request.getParameter("num");
	BbsDAO dao = new BbsDAO(application);

	//게시물을 가져와서 DTO객체로 변환
	BbsDTO dto = dao.selectView(num);

	dao.close();
%>

<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/space/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">
					<%@ include file="../include/space_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">
						<img src="../images/space/sub01_title.gif" alt="공지사항"
							class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항



						
						<p>
					</div>
					<div class="col-9 pt-3">
						<h3><%=boardTitle%>
							게시판 - <small>Edit(수정)</small>
						</h3>
						<script>
							//유기명함수
							function checkValidate(obj) {
								if (obj.title.value == "") {
									alert("제목을 입력해주세요!");//경고창 띄움
									obj.title.focus();//입력란으로 포커스 이동
									return false;//전송되지 않도록 이벤트리스너로 false반환
								} else if (obj.content.value == "") {
									alert("내용을 입력해주세요!");
									obj.content.focus();
									return false;
								}
							}
							//무기명함수
							/* var checkValidate2 = funtion(frm){
							   //실행부는 유기명함수왇 동일함
							} */
						</script>
						<div class="row mt-3 mr-1">
							<table class="table table-bordered table-striped">
								<form name="editFrm" method="post" action="EditProc.jsp"
									onsubmit="return checkValidate(this);">

									<!-- 해당 게시물의 일련번호를 전송해야 게시물 수정이 가능하다.
            	hidden 속성으로 처리하면 화면에서는 사라지지만 서버로는 값을 
            	전송 할 수 있다. -->
									<input type="hidden" name="num" value="<%=dto.getNum()%>" /> <input
										type="hidden" name="bname" value="<%=bname%>" />

									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<!--    <tr>
                  <th class="text-center align-middle">작성자</th>
                  <td>
                     <input type="text" class="form-control"   style="width:100px;"/>
                  </td>
               </tr> -->
										<!-- <tr>
                  <th class="text-center" 
                     style="vertical-align:middle;">패스워드</th>
                  <td>
                     <input type="password" class="form-control"
                        style="width:200px;"/>
                  </td>
               </tr> -->
										<tr>
											<th class="text-center" style="vertical-align: middle;">제목</th>
											<td><input type="text" class="form-control" name="title"
												value="<%=dto.getTitle()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">내용</th>
											<td><textarea rows="10" class="form-control"
													name="content"><%=dto.getContent()%></textarea></td>
										</tr>
										<!-- <tr>
                  <th class="text-center"
                     style="vertical-align:middle;">첨부파일</th>
                  <td>
                     <input type="file" class="form-control" />
                  </td>
               </tr> -->
									</tbody>
							</table>
						</div>
						<div class="row mb-3">
							<div class="col text-right">
								<!-- 각종 버튼 부분 -->
								<!-- <button type="button" class="btn">Basic</button> -->
								<!-- <button type="button" class="btn btn-primary" 
                  onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
								<!-- <button type="button" class="btn btn-secondary">수정하기</button>
               <button type="button" class="btn btn-success">삭제하기</button>
               <button type="button" class="btn btn-info">답글쓰기</button>
               <button type="button" class="btn btn-light">Light</button>
               <button type="button" class="btn btn-link">Link</button> -->
								<button type="submit" class="btn btn-danger">전송하기</button>
								<button type="reset" class="btn btn-dark">Reset</button>
								<button type="button" class="btn btn-warning"
									onclick="location.href='sub03.jsp';">리스트보기</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>