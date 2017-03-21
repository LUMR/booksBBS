package com.lumr.bbs.dao.impl;

import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.dao.UserDao;
import com.lumr.bbs.vo.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 实现UserDao接口
 * Created by fsweb on 17-3-6.
 */
public class UserDaoImpl extends BaseDao implements UserDao {

    public static void main(String[] args) {
        User my = new User("A2","nierauto","女","null");
        UserDaoImpl test = new UserDaoImpl();
        String password = test.sha1(my.getPassword());
        int result = test.login(my);
        if (result == 1)
            System.out.println("密码正确，登陆成功");
        else
            System.out.println("密码错误,you:"+password+"\treal:"+result);
    }

    @Override
    public int login(User user) {
        conn = getConn();
        try {
            String sql = "select sha1('"+ user.getPassword()+"')";
            stmt = conn.createStatement();
            result = stmt.executeQuery(sql);
            result.next();
            user.setPassword(result.getString(1));
            sql = "select id,password,gender,head,regDate from user where name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            result = pstmt.executeQuery();
            if (result.next()) {
                String pwd =  result.getString(2);
                if (pwd.equals(user.getPassword())) {
                    user.setId(result.getInt("id"));
                    user.setGender(result.getString("gender"));
                    user.setRegDate(result.getDate("regDate"));
                    user.setHead(result.getString("head"));
                    return 1;
                }
                else
                    return -2;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            closeAll();
        }
        return 0;
    }

    @Override
    public int save(User user) {
        conn = getConn();
        String sql = "insert into user(name,password,gender,regDate,head) values (?,sha1(?),?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getGender());
            pstmt.setObject(4,user.getRegDate());
            pstmt.setString(5,user.getHead());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            closeAll();
        }
    }

    @Override
    public int update(User user) {
        conn = getConn();
        String sql = "update user set name = ?,password = ?,gender = ? where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getGender());
            pstmt.setInt(4,user.getId());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            closeAll();
        }
    }

    @Override
    public int updateHead(User user) {
        conn = getConn();
        String sql = "update user set head = ? where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,user.getHead());
            pstmt.setInt(2,user.getId());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
        finally {
            closeAll();
        }
    }

    @Override
    public int isExist(User uset) {
        conn = getConn();
        String sql = "select * from user where name = ?";
        Object[] obj = new Object[]{uset.getName()};
        List<String> list = preQuery(sql,obj);
        if (list == null)
            return -1;
        if (list.size()>0)
            return 1;
        else
            return 0;
    }

    public List<User> getAll(){
        conn = getConn();
        String sql ="select id,name,gender,regDate from user";
        List<User> list = new ArrayList<>();
        try {
            stmt = conn.createStatement();
            result = stmt.executeQuery(sql);
            while (result.next()){
                User user = new User();
                user.setId(result.getInt(1));
                user.setName(result.getString(2));
                user.setGender(result.getString(3));
                user.setRegDate(result.getDate(4));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            closeAll();
        }
        return list;
    }
}
