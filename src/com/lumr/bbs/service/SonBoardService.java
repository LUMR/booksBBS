package com.lumr.bbs.service;

import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;

import java.util.List;

/**
 * 子版块
 * Created by lumr on 2017/3/8.
 */
public interface SonBoardService {
    List<SonBoard> getAllSonBoard(MainBoard mainBoard);
    void addSonBoard(SonBoard sonBoard);
}
