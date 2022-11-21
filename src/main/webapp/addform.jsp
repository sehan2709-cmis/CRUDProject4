<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.crudproject4.dao.MemberDAO, com.crudproject4.bean.MemberVO, java.util.*" %>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Member</title>
    </head>
    <body>
    <h1 class="text-center">Add Member</h1>
        <form class="w-50 m-auto" action="add_ok.jsp" method="post" enctype="multipart/form-data">
            <div>
                <label for="photo" class="col-sm-2 col-form-label">Image</label>
                <div class="col-sm-10">
                    <input class="form-control" type="file" id="photo" name="photo">
                </div>
            </div>
            <div>
                <label for="userid" class="col-sm-2 col-form-label">UserID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="userid" name="userid">
                </div>
            </div>
            <div>
                <label for="username" class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username">
                </div>
            </div>
            <div>
                <label for="password" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password">
                </div>
            </div>
            <div>
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" name="email" placeholder="email@example.com">
                </div>
            </div>
            <div>
                <label for="blogurl" class="col-sm-2 col-form-label">BlogURL</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="blogurl" name="blogurl" placeholder="">
                </div>
            </div>
            <div">
                <label for="detail" class="col-sm-2 col-form-label">Detail</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="detail" name="detail" rows="3"></textarea>
                </div>
            </div>
            <div class="text-center">
                <button type="button" onclick="location.href='list.jsp'" class="btn btn-secondary">Back to List</button>
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </body>
</html>
