package com.lumr.bbs.service;

import com.lumr.bbs.vo.MainBoard;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public interface MainBoardService {
    List<MainBoard> getAllMainBoard();

    /**
     * 根据id查主版块
     * @return 如id不存在，返回null
     */
    MainBoard getMainBoardById(int id);
}
