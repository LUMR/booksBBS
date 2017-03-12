package com.lumr.bbs.vo;

import com.lumr.bbs.dao.SonBoardDao;
import com.lumr.bbs.dao.impl.SonBoardDaoImpl;

import java.util.List;

/**
 * Created by lumr on 2017/3/7.
 */
public class MainBoard {
    private int id;
    private String name;

    public MainBoard() {
    }

    public MainBoard(int id) {
        this.id = id;
    }

    public MainBoard(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public List<SonBoard> getSonBoard(){
        SonBoardDao sonBoardDao = new SonBoardDaoImpl();
        return sonBoardDao.get(this);
    }

    @Override
    public String toString() {
        return "主板块{" +
                ", name='" + name + '\'' +
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
}
