package com.lumr.bbs.dao.impl;

import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.dao.TopicDao;
import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;
import com.lumr.bbs.vo.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public class TopicDaoImpl extends BaseDao implements TopicDao{
    //查询的结果数量
    private int resultNum;

    public TopicDaoImpl() {
        resultNum = 20;
    }

    @Override
    public List<Topic> get(SonBoard sonBoard) {
        getConn();
        String sql = "select id,title,content,createDate,sid,uid " +
                "from topic where sid = ? order by createDate desc";
        List<Topic> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,sonBoard.getId());
            result = pstmt.executeQuery();
            while (result.next()){
                Topic topic = new Topic(result.getInt(1),result.getString(2),
                        result.getString(3),result.getTimestamp(4),sonBoard,
                        new User(result.getInt(6)));
                topic.setUser();
                list.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Topic> get(SonBoard sonBoard, int pages) {
        getConn();
        String sql = "select id,title,content,createDate,sid,uid " +
                "from topic where sid = ? order by createDate desc limit ?,?";
        List<Topic> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,sonBoard.getId());
            pstmt.setInt(2,pages*10);
            pstmt.setInt(3,resultNum);
            result = pstmt.executeQuery();
            while (result.next()){
                Topic topic = new Topic(result.getInt(1),result.getString(2),
                        result.getString(3),result.getTimestamp(4),sonBoard,
                        new User(result.getInt(6)));
                topic.setUser();
                list.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Topic> getBySid(int sid) {
        getConn();
        String sql = "select id,title,content,createDate,sid,uid" +
                "from topic where sid = ?";
        List<Topic> list = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,sid);
            result = pstmt.executeQuery();
            while (result.next()){
                Topic topic = new Topic(result.getInt(1),result.getString(2),
                        result.getString(3),result.getDate(4),new SonBoard(result.getInt(5)),
                        new User(result.getInt(6)));
                list.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Topic getTopicById(int tid, SonBoard sonBoard) {
        getConn();
        String sql = "select id,title,content,createDate,sid,uid from topic where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,tid);
            result = pstmt.executeQuery();
            if (result.next()){
                Topic topic = new Topic(result.getInt(1),result.getString(2),
                        result.getString(3),result.getTimestamp(4),sonBoard,
                        new User(result.getInt(6)));
                topic.setUser();
                return topic;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int addTopic(Topic topic) {
        String sql = "insert into topic(title,content,createDate,sid,uid)" +
                "values(?,?,?,?,?)";
        Object[] obj = new Object[]{topic.getTitle(),topic.getContent(),topic.getCreateDate(),
                topic.getSonBoard().getId(),topic.getUser().getId()};
        return preUpdate(sql,obj);
    }

    @Override
    public int deleteTopic(Topic topic) {
        String sql = "delete from topic where id = ?";
        Object[] obj = new Object[]{topic.getId()};
        return preUpdate(sql,obj);
    }

    public int getResultNums() {
        return resultNum;
    }

    public void setResultNums(int resultNums) {
        this.resultNum = resultNums;
    }
}
