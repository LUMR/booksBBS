package com.lumr.bbs.service;

import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public interface TopicService {
    List<Topic> getAllTopic(SonBoard sonBoard);

    Topic getTopicById(int id, SonBoard sonBoard);
    void addTopic(Topic topic);
}
