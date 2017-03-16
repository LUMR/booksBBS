package com.lumr.bbs.dao;

import com.lumr.bbs.vo.Reply;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * 回复dao
 * Created by fsweb on 17-3-7.
 */
public interface ReplyDao {
    /**
     * 获取所有回复
     */
    List<Reply> getReply(Topic topic);

    /**
     * 获取部分回复
     * @param pages 获取回复页数,每页10个
     */
    List<Reply> getReply(Topic topic,int pages);
    int getReplyNum(Topic topic);

    int addReply(Reply reply);

    int alertReply(Reply reply);

    int deleteReply(Reply reply);
}
