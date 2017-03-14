package com.lumr.bbs.dao;

import com.sun.rowset.CachedRowSetImpl;

import javax.sql.rowset.CachedRowSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * 基础DAO
 * Created by fsweb on 17-3-6.
 */
public class BaseDao {
    private CachedRowSet crs;//行集
    protected Connection conn;//数据库连接
    protected PreparedStatement pstmt;
    protected Statement stmt;
    protected ResultSet result;

    /**
     * 测试
     */
    public static void main(String[] args) {
        BaseDao baseDao = new BaseDao();
        baseDao.getRowSet();
        String sql = "select * from reply";
        try {
            baseDao.crs.setCommand(sql);
            baseDao.crs.setPageSize(10);
            baseDao.crs.execute();
            while (baseDao.crs.next()) {
                System.out.println(baseDao.crs.getString("content"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    /**
     * 连接数据库
     * @return  连接
     */
    public Connection getConn(){
        String url = "jdbc:mysql://localhost:3306/bbs";
        String urlDefault = "?characterEncoding=utf8&useSSL=true";
        String name = "webuser";
        String password = "wwwlumr";
        try {
            //指定数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
            System.out.println("找不到数据库驱动");
        }
        try {
            conn = DriverManager.getConnection(url+urlDefault,name,password);
        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println("数据库连接失败，改用远程连接。");
            url = "jdbc:mysql://192.168.1.107:3306/bbs";
            try {
                conn = DriverManager.getConnection(url+urlDefault,name,password);
            } catch (SQLException e1) {
//                e1.printStackTrace();
                System.out.println("远程连接失败。系统停止");
                System.exit(0);
            }
        }
        return conn;
    }

    /**
     * 创建行集
     * @return 返回一个行集
     */
    public CachedRowSet getRowSet(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String url = "jdbc:mysql://192.168.1.107:3306/bbs";
        String urlDefault = "??characterEncoding=utf8&useSSL=true";
        String name = "webuser";
        String password = "wwwlumr";
        try {
            crs = new CachedRowSetImpl();
            crs.setUrl(url+urlDefault);
            crs.setUsername(name);
            crs.setPassword(password);
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("数据库连接错误。");
        }
        return crs;
    }

    /**
     * 常用的prepareStatement的query方法,只适用于返回值只有一列
     * @param sql 查询语句
     * @param obj 参数的对象集合
     * @return 返回字符串集合
     */
    public List<String> preQuery(String sql,Object[] obj){
        getConn();
        List<String> list= new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < obj.length; i++) {
                pstmt.setObject(i+1,obj[i]);
            }
            result = pstmt.executeQuery();
            while (result.next()){
                list.add(result.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            closeAll();
        }
        return list;
    }

    /**
     * 常用的prepareStatement的update方法
     * @return 返回值-1表示数据库连接错误
     */
    public int preUpdate(String sql,Object[] obj){
        getConn();
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < obj.length; i++) {
                pstmt.setObject(i+1,obj[i]);
            }
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            closeAll();
        }
    }
    /**
     * 关闭所有资源
     */
    public void closeAll(){
        try {
            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (result != null) {
                result.close();
            }
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }

    /**
     * 利用数据库进行sha加密
     * @param str 要加密的字符串
     * @return  加密后的字符串
     */
    public String sha1(String str){
        getConn();
        String sql = "select sha1(?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,str);
            result = pstmt.executeQuery();
            if (result.next())
                return result.getString(1);
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("数据库连接失败。");
        }
        finally {
            closeAll();
        }
        return null;
    }
}
