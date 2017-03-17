package com.lumr.bbs.service;

import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * reply
 * Created by lumr on 2017/3/8.
 */
public interface ReplyService {
    /**
     * 获取全部回复
     */
    List<Reply> getAllReply(Topic topic);

    /**
     * 获取部分回复
     */
    List<Reply> getAllReply(Topic topic,int pages);
    //获取回复数量
    int getReplyNum(Topic topic);

    //获取回复页数
    int getRaplyPages(Topic topic);
    int addReply(Reply reply);
    void alterReply(Reply reply);
}
