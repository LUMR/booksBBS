package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.impl.TopicDaoImpl;
import com.lumr.bbs.service.TopicService;
import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public class TopicServiceImpl implements TopicService {
    @Override
    public List<Topic> getAllTopic(SonBoard sonBoard) {
        TopicDaoImpl topicDao = new TopicDaoImpl();
        return topicDao.get(sonBoard);
    }

    @Override
    public Topic getTopicById(int id, SonBoard sonBoard) {
        TopicDaoImpl topicDao = new TopicDaoImpl();
        return topicDao.getTopicById(id,sonBoard);
    }

    @Override
    public int addTopic(Topic topic) {
        TopicDaoImpl topicDao = new TopicDaoImpl();
        int result = topicDao.addTopic(topic);

        return result;
    }
}
