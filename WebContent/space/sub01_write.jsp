<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model1.BbsDTO"%>
<%@page import="model1.BbsDAO"%>
<%@ include file="../include/global_head.jsp"%>
<%@ include file="isFlag.jsp"%>

<%
	//공지사항, 프로그램일정은 글쓰기 불가능하게 처리
	if (bname.equals("notice") || bname.equals("schboard")) {
		JavascriptUtil.jsAlertBack("해당 게시판은 글쓰기를 할 수 없습니다.", out);
		return;
	}
%>
<body>
	<<center>
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
						<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle%>
					<p>
				</div>
				<div class="col-9 pt-3">
					<h3>
						<%=boardTitle%>
						- <small>Write(작성)</small>
					</h3>
					<script>
							//유기명함수
							function checkValidate(frm) {

								if (frm.title.value == "") {
									alert("제목을 입력해주세요");//경고창 띄움
									frm.title.focus();//입력란으로 포커스 이동
									return false;//전송되지 않도록 이벤트리스너로 false반환
								}
								if (frm.content.value == "") {
									alert("내용을 입력해주세요");
									frm.content.focus();
									return false;
								}
							}
							
							var isValidate = function(frm) {

								if (frm.name.value == "") {
									alert("이름을 입력하세요");
									frm.name.focus();
									return false;
								}
								if (frm.title.value == "") {
									alert("제목을 입력하세요");
									frm.title.focus();
									return false;
								}
								if (frm.chumFile1.value == "") {
									alert("첨부파일1은 필수 입력입니다");
									frm.chumFile1.focus();
									return false;
								}
							}
						</script>
					<%if(bname.equals("freeboard")){ %>
					<div class="row mt-3 mr-1">
						<form name="writefrm" method="post" action="WriteProc.jsp"
							onsubmit="return checkValidate(this);">
							<table class="table table-bordered table-striped">

								<input type="hidden" name="bname" value="<%=bname%>" />

								<colgroup>
									<col width="20%" />
									<col width="*" />
								</colgroup>
								<tbody>

									<tr>
										<th class="text-center" style="vertical-align: middle;">제목</th>
										<td><input type="text" class="form-control" name="title" />
										</td>
									</tr>

									<tr>
										<th class="text-center" style="vertical-align: middle;">내용</th>
										<td><textarea rows="10" class="form-control"
												name="content"></textarea></td>
									</tr>

								</tbody>
							</table>
					</div>
					<div class="row mb-3">
						<div class="col text-right">
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="reset" class="btn btn-dark">Reset</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='sub03.jsp';">리스트보기</button>
						</div>
					</div>
					</form>
					<% } else if(bname.equals("infoboard")){ %>
					<div class="row mt-3 mr-1">
					<form name="writefrm" method="post" action="UploadProc.jsp"
						onsubmit="return isValidate(this);" enctype="multipart/form-data">
						<table class="table table-bordered table-striped">

							<input type="hidden" name="bname" value="<%=bname%>" />

							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tbody>

								<tr>
									<th class="text-center" style="vertical-align: middle;">제목</th>
									<td><input type="text" class="form-control" name="title" />
									</td>
								</tr>

								<tr>
									<th class="text-center" style="vertical-align: middle;">내용</th>
									<td><textarea rows="10" class="form-control"
											name="content"></textarea></td>
								</tr>

								<tr>
									<th class="text-center" style="vertical-align: middle;">첨부파일</th>
									<td><input type="file" name="chumFile1"
										class="form-control" /></td>
								</tr>

							</tbody>
						</table>
				</div>
				<div class="row mb-3">
					<div class="col text-right">
						<button type="submit" class="btn btn-danger">전송하기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='sub03.jsp';">리스트보기</button>
					</div>
				</div>
				</form>
				<% } %>
			</div>
		</div>
	</div>
	<%@ include file="../include/quick.jsp"%>
	</div>


	<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>