<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudproject4.dao.MemberDAO, com.crudproject4.common.FileUpload, com.crudproject4.bean.MemberVO, java.util.*" %>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    MemberVO member = null;
    member = memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", member);
%>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Member Edit</title>
    </head>
    <body>
    <h1 class="text-center">Member Edit</h1>
        <form class="w-50 m-auto" action="edit_ok.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" id="sid" name="sid" value="${vo.getSid()}"/>
            <div class="text-center">
                <c:if test="${vo.getPhoto() ne ''}">
                    <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="rounded" width="200" >
                </c:if>
            </div>
            <div>
                <label for="photo" class="col-sm-2 col-form-label">Image</label>
                <div class="col-sm-10">
                    <input class="form-control" type="file" id="photo" name="photo">
                </div>
            </div>
            <div>
                <label for="userid" class="col-sm-2 col-form-label">UserID</label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" id="userid" name="userid" value="${vo.getUserid()}">
                </div>
            </div>
            <div>
                <label for="username" class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username" value="${vo.getUsername()}">
                </div>
            </div>
            <div>
                <label for="password" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" readonly class="form-control-plaintext" id="password" name="password" value="${vo.getPassword()}">
                </div>
            </div>
            <div>
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" name="email" value="${vo.getEmail()}">
                </div>
            </div>
            <div>
                <label for="blogurl" class="col-sm-2 col-form-label">BlogURL</label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" id="blogurl" name="blogurl" value="${vo.getBlogurl()}">
                </div>
            </div>
            <div>
                <label for="detail" class="col-sm-2 col-form-label">Detail</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="detail" name="detail" rows="3">${vo.getDetail()}</textarea>
                </div>
            </div>
            <div class="text-center">
                <button type="button" onclick="location.href='list.jsp'" class="btn btn-secondary">Back to List</button>
                <button type="submit" class="btn btn-primary">Edit</button>
            </div>
        </form>
    </body>
</html>