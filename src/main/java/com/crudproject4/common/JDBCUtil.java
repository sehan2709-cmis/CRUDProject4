package com.crudproject4.common;

import java.sql.*;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p2_22100052","p2_22100052","tei0Tei3ie");
        } catch(Exception e){
            System.out.println(e);
        }
        return con;
    }

//     public static void main(String ars[]) {
//         Connection conn = getConnection();
//         if(conn != null) System.out.println("DB 연결됨!");
//         else System.out.println("DB 연결중오류 !");
//     }
}