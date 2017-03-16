package com.lumr.bbs.service;

import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public interface TopicService {
    List<Topic> getAllTopic(SonBoard sonBoard);
    List<Topic> getAllTopic(SonBoard sonBoard,int pages);

    Topic getTopicById(int id, SonBoard sonBoard);
    int addTopic(Topic topic);
}
