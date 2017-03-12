package com.lumr.bbs.dao.impl;

import com.lumr.bbs.dao.MainBoardDao;
import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.vo.MainBoard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 主板块实现
 * Created by lumr on 2017/3/7.
 */
public class MainBoardDaoImpl extends BaseDao implements MainBoardDao {
    @Override
    public List<MainBoard> getAll() {
        getConn();
        String sql = "select id,name from mainBoard";
        List<MainBoard> list = new ArrayList<>();
        try {
            stmt = conn.createStatement();
            result = stmt.executeQuery(sql);
            while (result.next()){
                MainBoard mainBoard = new MainBoard(result.getInt(1),result.getString(2));
                list.add(mainBoard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            closeAll();
        }
        return list;
    }

    @Override
    public MainBoard getById(int id) {
        getConn();
        String sql = "select name from mainBoard where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            result = pstmt.executeQuery();
            if (result.next())
                return new MainBoard(id,result.getString(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            closeAll();
        }
        return null;
    }
}
