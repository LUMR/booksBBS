package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.impl.MainBoardDaoImpl;
import com.lumr.bbs.dao.impl.SonBoardDaoImpl;
import com.lumr.bbs.service.SonBoardService;
import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;

import java.util.List;

/**
 * Created by lumr on 2017/3/8.
 */
public class SonBoardServiceImpl implements SonBoardService {
    @Override
    public List<SonBoard> getAllSonBoard(MainBoard mainBoard) {
        SonBoardDaoImpl sonBoardDao = new SonBoardDaoImpl();
        return sonBoardDao.get(mainBoard);
    }


    @Override
    public void addSonBoard(SonBoard sonBoard) {
        SonBoardDaoImpl sonBoardDao = new SonBoardDaoImpl();
        int result = sonBoardDao.add(sonBoard);
        if (result>0)
            System.out.println("添加成功。");
        else
            System.out.println("添加失败");
    }
}
