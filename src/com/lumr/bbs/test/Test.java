package com.lumr.bbs.test;

import com.lumr.bbs.dao.MainBoardDao;
import com.lumr.bbs.dao.impl.MainBoardDaoImpl;
import com.lumr.bbs.dao.impl.SonBoardDaoImpl;
import com.lumr.bbs.dao.impl.UserDaoImpl;
import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.User;

import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public class Test {
    public static void main(String[] args) {
        Test test = new Test();
//        MainBoardDaoImpl mainBoardDao = new MainBoardDaoImpl();
//        test.showMainBoard();
//        List<MainBoard> list = mainBoardDao.getReply();
//        test.showSonBoard(list.getReply(0));
        test.showUser();
//        User my = new User("ll","kkk","男");
//        System.out.println(my);
//        UserDaoImpl userDao = new UserDaoImpl();
//        userDao.save(my);
    }

    public void showMainBoard(){
        MainBoardDaoImpl mainBoardDao = new MainBoardDaoImpl();
        List<MainBoard> list = mainBoardDao.getAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).getName());
        }
    }

    public void showSonBoard(MainBoard mainBoard){
        SonBoardDaoImpl sonBoardDao = new SonBoardDaoImpl();
        List<SonBoard> list = sonBoardDao.get(mainBoard);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }

    public void showUser(){
        UserDaoImpl UserDao = new UserDaoImpl();
        List<User> list = UserDao.getAll();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }
}
