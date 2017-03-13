package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.MainBoardDao;
import com.lumr.bbs.dao.impl.MainBoardDaoImpl;
import com.lumr.bbs.service.MainBoardService;
import com.lumr.bbs.vo.MainBoard;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public class MainBoardServiceImpl implements MainBoardService {
    @Override
    public List<MainBoard> getAllMainBoard() {
        MainBoardDaoImpl mainBoardDao = new MainBoardDaoImpl();
        return mainBoardDao.getAll();
    }

    @Override
    public MainBoard getMainBoardById(int id) {
        MainBoardDao mainBoardDao = new MainBoardDaoImpl();
        return mainBoardDao.getById(id);
    }
}
