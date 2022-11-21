package com.crudproject4.dao;


import com.crudproject4.bean.MemberVO;
import com.crudproject4.common.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private final String M_INSERT = "insert into member(userid, password, username, email, blogurl, photo, detail)"
            + " values (?, sha1(?),?,?,?,?,?)";
    private final String M_UPDATE = "update member set username=?, email=?, photo=?, detail=? "
            + "where sid=?";
    private final String M_DELETE = "delete from member where sid=?";
    private final String M_SELECT = "select * from member where sid=?";
    private final String M_LIST = "select * from member order by regdate desc";

    public int insertMember(MemberVO data) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_INSERT);
            stmt.setString(1, data.getUserid());
            stmt.setString(2, data.getPassword());
            stmt.setString(3, data.getUsername());
            stmt.setString(4, data.getEmail());
            stmt.setString(5, data.getBlogurl());
            stmt.setString(6, data.getPhoto());
            stmt.setString(7, data.getDetail());
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int deleteMember(int sid) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_DELETE);
            stmt.setInt(1, sid);
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateMember(MemberVO data) {
        int result = 0;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_UPDATE);
            stmt.setString(1, data.getUsername());
            stmt.setString(2, data.getEmail());
            stmt.setString(3, data.getPhoto());
            stmt.setString(4, data.getDetail());
            stmt.setInt(5, data.getSid());
            result = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateMember error!");
            e.printStackTrace();
        }
        return result;
    }

    public MemberVO getOne(int sid) {
        MemberVO one = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_SELECT);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setPhoto(rs.getString("photo"));
                one.setEmail(rs.getString("email"));
                one.setBlogurl(rs.getString("blogurl"));
                one.setDetail(rs.getString("detail"));
                one.setRegdate(rs.getDate("regdate"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return one;
    }

    public ArrayList<MemberVO> getList() {
        ArrayList<MemberVO> list = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_LIST);
            rs = stmt.executeQuery();
            list = new ArrayList<MemberVO>();
            MemberVO one = new MemberVO();
            while (rs.next()) {
                one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setEmail(rs.getString("email"));
                one.setPhoto(rs.getString("photo"));
                one.setDetail(rs.getString("detail"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int parseInt) {
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_SELECT);
            stmt.setInt(1, parseInt);
            rs = stmt.executeQuery();
            if (rs.next()) filename = rs.getString("photo");
            rs.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
}
