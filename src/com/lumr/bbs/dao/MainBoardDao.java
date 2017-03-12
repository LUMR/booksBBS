package com.lumr.bbs.dao;

import com.lumr.bbs.vo.MainBoard;

import java.util.List;

/**
 * 主板块
 * Created by lumr on 2017/3/7.
 */
public interface MainBoardDao {
    List<MainBoard> getAll();

    MainBoard getById(int id);

}
