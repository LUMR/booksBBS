package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.impl.ReplyDaoImpl;
import com.lumr.bbs.service.ReplyService;
import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public class ReplyServiceImpl implements ReplyService {
    @Override
    public List<Reply> getAllReply(Topic topic) {
        ReplyDaoImpl replyDao = new ReplyDaoImpl();
        return replyDao.get(topic);
    }

    @Override
    public void addReply(Reply reply) {
        ReplyDaoImpl replyDao = new ReplyDaoImpl();
        int result = replyDao.addReply(reply);
        if (result>0)
            System.out.println("添加成功");
        else
            System.out.println("添加失败");
    }

    @Override
    public void alterReply(Reply reply) {
        ReplyDaoImpl replyDao = new ReplyDaoImpl();
        int result = replyDao.addReply(reply);
        if (result>0)
            System.out.println("修改成功");
        else
            System.out.println("修改失败");
    }
}
