package com.lumr.bbs.dao;

import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public interface TopicDao {
    List<Topic> get(SonBoard sonBoard);

    List<Topic> getBySid(int sid);

    Topic getTopicById(int tid,SonBoard sonBoard);

    int addTopic(Topic topic);
    int deleteTopic(Topic topic);
}
