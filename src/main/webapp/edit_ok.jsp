<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudproject4.dao.MemberDAO, com.crudproject4.common.FileUpload, com.crudproject4.bean.MemberVO, java.util.*" %>

<%
    request.setCharacterEncoding("utf-8");
    MemberDAO memberDAO = new MemberDAO();
    FileUpload upload = new FileUpload();
    MemberVO u = upload.uploadPhoto(request);

    int i = memberDAO.updateMember(u);
    String msg = "데이터 수정 성공 !";
    if(i == 0) msg = "[에러] 데이터 수정 실패 !";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>