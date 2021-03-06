package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.ReplyDao;
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
        return replyDao.getReply(topic);
    }

    @Override
    public List<Reply> getAllReply(Topic topic, int pages) {
        ReplyDaoImpl replyDao = new ReplyDaoImpl();
        return replyDao.getReply(topic,pages);
    }

    @Override
    public int getReplyNum(Topic topic) {
        ReplyDao replyDao = new ReplyDaoImpl();
        return replyDao.getReplyNum(topic);
    }

    @Override
    public int getRaplyPages(Topic topic) {
        ReplyDao replyDao = new ReplyDaoImpl();
        int nums = replyDao.getReplyNum(topic);
        int pages = nums%10==0 ? nums/10:nums/10+1;
        return pages;
    }

    @Override
    public int addReply(Reply reply) {
        ReplyDaoImpl replyDao = new ReplyDaoImpl();
        int result = replyDao.addReply(reply);
        return result;
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
