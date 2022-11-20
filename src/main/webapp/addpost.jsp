<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.crudproject4.dao.BoardDAO" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="u" class="com.crudproject4.bean.BoardVO"/>
<jsp:setProperty name="u" property="*"/>

<%
    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);
    String msg = "데이터 추가 성공!";
    if(i == 0) msg = "[에러] 데이터 추가";

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
