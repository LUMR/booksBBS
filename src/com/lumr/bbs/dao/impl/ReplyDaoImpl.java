package com.lumr.bbs.dao.impl;

import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.dao.ReplyDao;
import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;
import com.lumr.bbs.vo.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 回复
 * Created by fsweb on 17-3-7.
 */
public class ReplyDaoImpl extends BaseDao implements ReplyDao {
    @Override
    public List<Reply> getAll(Topic topic) {
        getConn();
        String sql = "select * from reply where tid = ?";
        List<Reply> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,topic.getId());
            result = pstmt.executeQuery();
            while (result.next()){
                User user = new User(result.getInt(5));
                Reply reply = new Reply(result.getInt(1),result.getString(2),result.getTimestamp(3),
                        result.getTimestamp(4),user,topic);
                reply.setUser();
                list.add(reply);
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
    public List<Reply> getReply(Topic topic, int pages) {
        getConn();
        String sql = "select * from reply where tid = ? limit ?,10";
        List<Reply> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,topic.getId());
            pstmt.setInt(2,pages);
            result = pstmt.executeQuery();
            while (result.next()){
                User user = new User(result.getInt(5));
                Reply reply = new Reply(result.getInt(1),result.getString(2),result.getTimestamp(3),
                        result.getTimestamp(4),user,topic);
                reply.setUser();
                list.add(reply);
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
    public int getReplyNum(Topic topic) {
        getConn();
        String sql = "select count(*) from reply where tid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, topic.getId());
            result = pstmt.executeQuery();
            if (result.next())
                return result.getInt(1);
            else
                return 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            closeAll();
        }
        return 0;
    }

    @Override
    public int addReply(Reply reply) {
        String sql = "insert into reply(content,createDate,alterDate,uid,tid) " +
                "values(?,?,?,?,?)";
        Object[] obj = new Object[]{reply.getContent(),reply.getCreateDate(),reply.getCreateDate(),
                reply.getUser().getId(),reply.getTopic().getId()};
        return preUpdate(sql,obj);
    }

    @Override
    public int alertReply(Reply reply) {
        String sql = "update reply set content = ? where id = ?";
        Object[] obj = new Object[]{reply.getContent(),reply.getId()};
        return preUpdate(sql,obj);
    }

    @Override
    public int deleteReply(Reply reply) {
        String sql = "delete from reply where id = ?";
        Object[] obj = new Object[]{reply.getId()};
        return preUpdate(sql,obj);
    }
}
