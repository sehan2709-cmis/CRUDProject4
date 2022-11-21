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
        <title>Member View</title>
    </head>
    <body>
        <h1 class="text-center">Member View</h1>
        <form class="w-50 m-auto">
            <div class="text-center">
                <c:if test="${vo.getPhoto() ne ''}">
                    <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="rounded" width="200" >
                </c:if>
            </div>
            <div>
                <label for="inputUserID" class="col-sm-2 col-form-label">UserID</label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" id="inputUserID" value="<%=member.getUserid()%>">
                </div>
            </div>
            <div>
                <label for="inputUsername" class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" id="inputUsername" value="<%=member.getUsername()%>">
                </div>
            </div>
            <div>
                <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" readonly class="form-control-plaintext" id="inputPassword" value="<%=member.getPassword()%>">
                </div>
            </div>
            <div>
                <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" readonly class="form-control-plaintext" id="inputEmail" value="<%=member.getEmail()%>">
                </div>
            </div>
            <div>
                <label for="email" class="col-sm-2 col-form-label">BlogURL</label>
                <div class="col-sm-10">
                    <input type="email" readonly class="form-control-plaintext" id="email" value="<%=member.getBlogurl()%>">
                </div>
            </div>
            <div>
                <label for="inputDetail" class="col-sm-2 col-form-label">Detail</label>
                <div class="col-sm-10">
                    <textarea readonly class="form-control-plaintext" id="inputDetail" rows="3"><%=member.getDetail()%></textarea>
                </div>
            </div>
            <div class="text-center">
                <button type="button" onclick="location.href='list.jsp'" class="btn btn-secondary">Back to List</button>
                <button type="button" onclick="location.href='editform.jsp?id=<%=member.getSid()%>'" class="btn btn-primary">Edit</button>
            </div>
    </form>
    </body>
</html>
