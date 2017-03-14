package com.lumr.bbs.dao;

import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public interface ReplyDao {
    List<Reply> get(Topic topic);
    int getReplyNum(Topic topic);

    int addReply(Reply reply);

    int alertReply(Reply reply);

    int deleteReply(Reply reply);
}
