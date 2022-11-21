<%@page  contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudproject4.dao.MemberDAO, com.crudproject4.bean.MemberVO, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Project4 CRUD</title>
    <style>
        #list{
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th{
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover{background-color: #ddd;}
        #list th{
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하시겠습니까?");
            if(a) location.href = 'delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>자유게시판</h1>
<%
    MemberDAO memberDAO = new MemberDAO();
    List<MemberVO> list = memberDAO.getList();
    request.setAttribute("list", list);
%>
<table id="list" width="90%">
    <tr>
        <th scope> sid </th>
        <th scope> Userid </th>
        <th scope> Username </th>
        <th scope> Photo </th>
        <th scope> Email </th>
        <th scope> Detail </th>
        <th scope> Registered Date </th>
        <th scope="col"> <button type="button" onclick="location.href='addform.jsp'" class="btn btn-success">Add</button> </th>

    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.getSid()}</td>
            <td>${u.getUserid()}</td>
            <td>${u.getUsername()}</td>
            <td><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" width="100"></td>
            <td>${u.getEmail()}</td>
            <td>${u.getDetail()}</td>
            <td>${u.getRegdate()}</td>
            <td>
                <a href="view.jsp?id=${u.getSid()}">View</a>
                <a href="editform.jsp?id=${u.getSid()}">Edit</a>
                <a href="javascript:delete_ok('${u.getSid()}')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table><br/>
<a href="addform.jsp">Add</a>
</body>
</html>