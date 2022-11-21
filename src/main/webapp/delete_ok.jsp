<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudproject4.dao.MemberDAO, com.crudproject4.common.FileUpload, com.crudproject4.bean.MemberVO, java.util.*" %>

<%
    String id = request.getParameter("id");
    if(id != "") {
        int sid = Integer.parseInt(id);
        MemberDAO memberDAO = new MemberDAO();

        String filename = memberDAO.getPhotoFilename(sid);
        if (filename != null) {
            FileUpload.deleteFile(request, filename);
        }
        // 회원정보 삭제
        memberDAO.deleteMember(sid);
    }
    response.sendRedirect("list.jsp");
%>
