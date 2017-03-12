package com.lumr.bbs.vo;

import com.lumr.bbs.dao.TopicDao;
import com.lumr.bbs.dao.impl.TopicDaoImpl;

import java.util.List;

/**
 * 子版块
 * Created by fsweb on 17-3-7.
 */
public class SonBoard {
    private int id;
    private String name;
    private MainBoard mainBoard;

    public SonBoard() {
    }

    public SonBoard(int id) {
        this.id = id;
    }

    public SonBoard(String name, MainBoard mainBoard) {
        this.name = name;
        this.mainBoard = mainBoard;
    }

    public SonBoard(int id, String name, MainBoard mainBoard) {
        this.id = id;
        this.name = name;
        this.mainBoard = mainBoard;
    }

    public List<Topic> getTopic(){
        TopicDao topicDao = new TopicDaoImpl();
        return topicDao.get(this);
    }

    @Override
    public String toString() {
        return "子板块{" +
                ",\t name:'" + name + '\'' +
                ",\t 主板块:" + mainBoard.getName() +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MainBoard getMainBoard() {
        return mainBoard;
    }

    public void setMainBoard(MainBoard mainBoard) {
        this.mainBoard = mainBoard;
    }
}
