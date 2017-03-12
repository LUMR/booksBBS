package com.lumr.bbs.dao.impl;

import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.dao.SonBoardDao;
import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public class SonBoardDaoImpl extends BaseDao implements SonBoardDao {
    /**
     * Test
     * @param args
     */
    public static void main(String[] args) {
        SonBoardDaoImpl test = new SonBoardDaoImpl();
        MainBoard mainBoard = new MainBoard(1);
        SonBoard sonBoard = new SonBoard("xinbiaoti",mainBoard);
        int result = test.add(sonBoard);
        if (result>0)
            System.out.println("添加成功");
        else
            System.out.println("添加失败");
    }

    @Override
    public List<SonBoard> get(MainBoard mainBoard) {
        getConn();
        List<SonBoard> list = new ArrayList<>();
        String sql = "select id,name,mid from sonBoard where mid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,mainBoard.getId());
            result = pstmt.executeQuery();
            while (result.next()){
                list.add(new SonBoard(result.getInt(1),result.getString(2),
                        mainBoard));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接错误.");
        }
        finally {
            closeAll();
        }
        return list;
    }

    @Override
    public List<SonBoard> getByMainId(int mid) {
        getConn();
        List<SonBoard> list = new ArrayList<>();
        String sql = "select id,name from sonBoard where mid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,mid);
            result = pstmt.executeQuery();
            while (result.next()){
                list.add(new SonBoard(result.getInt(1),result.getString(2),
                        new MainBoard(mid)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接错误.");
        }
        finally {
            closeAll();
        }
        return list;
    }

    @Override
    public List<SonBoard> getByMainName(String name) {
        getConn();
        List<SonBoard> list = new ArrayList<>();
        String sql = "select id,name,mid from sonBoard as t0 " +
                "inner join mainBoard as t1 t0.mid = t1.id" +
                "and t1.name = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,name);
            result = pstmt.executeQuery();
            while (result.next()){
                list.add(new SonBoard(result.getInt(1),result.getString(2),
                        new MainBoard(result.getInt(3))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接错误.");
        }
        finally {
            closeAll();
        }
        return list;
    }

    @Override
    public int add(SonBoard sonBoard) {
        String sql = "insert into sonBoard(name,mid) values(?,?)";
        Object[] obj = new Object[]{sonBoard.getName(),sonBoard.getMainBoard().getId()};
        return preUpdate(sql,obj);
    }

    @Override
    public int add(String name, int mid) {
        String sql = "insert into sonBoard(name,mid) values(?,?)";
        Object[] obj = new Object[]{name,mid};
        return preUpdate(sql,obj);
    }

    @Override
    public int add(int id, String name, int mid) {
        String sql = "insert into sonBoard values(?,?,?)";
        Object[] obj = new Object[]{id,name,mid};
        return preUpdate(sql,obj);
    }
}
