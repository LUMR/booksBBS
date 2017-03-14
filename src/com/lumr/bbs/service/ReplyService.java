package com.lumr.bbs.service;

import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public interface ReplyService {
    List<Reply> getAllReply(Topic topic);
    int addReply(Reply reply);
    void alterReply(Reply reply);
}
