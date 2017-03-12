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
 * Created by fsweb on 17-3-7.
 */
public class ReplyDaoImpl extends BaseDao implements ReplyDao {
    @Override
    public List<Reply> get(Topic topic) {
        getConn();
        String sql = "select * from reply where tid = ?";
        List<Reply> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,topic.getId());
            result = pstmt.executeQuery();
            while (result.next()){
                User user = new User(result.getInt(5));
                Topic topic1 = new Topic(result.getInt(6));
                Reply reply = new Reply(result.getInt(1),result.getString(2),result.getDate(3),
                        result.getDate(4),user,topic1);
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
    public int addReply(Reply reply) {
        String sql = "insert into reply(content,createDate,alterDate,user,topic " +
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
