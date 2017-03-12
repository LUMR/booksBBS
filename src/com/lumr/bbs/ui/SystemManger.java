package com.lumr.bbs.ui;

import com.lumr.bbs.dao.MainBoardDao;
import com.lumr.bbs.dao.ReplyDao;
import com.lumr.bbs.dao.TopicDao;
import com.lumr.bbs.dao.UserDao;
import com.lumr.bbs.dao.impl.MainBoardDaoImpl;
import com.lumr.bbs.dao.impl.ReplyDaoImpl;
import com.lumr.bbs.dao.impl.TopicDaoImpl;
import com.lumr.bbs.dao.impl.UserDaoImpl;
import com.lumr.bbs.vo.*;

import java.util.List;
import java.util.Scanner;

/**
 * BBS系统
 * Created by fsweb on 17-3-8.
 */
public class SystemManger {
    private static Scanner input = new Scanner(System.in);
    private static User admin;
    public static void main(String[] args) {
        SystemManger test = new SystemManger();
        User my = test.Login();
        System.out.println(my);
        List<MainBoard> Mlist = test.getMainBoard();
        test.showMainBoard(Mlist);
        System.out.println("请选择你要的进入的主板块:");
        int i = input.nextInt();
        List<SonBoard> Slist = Mlist.get(i).getSonBoard();
        test.showSonBoard(Slist);
        System.out.println("请选择你要进入的子版块:");
        i = input.nextInt();
        List<Topic> Tlist = Slist.get(i).getTopic();
        test.showTopic(Tlist);
        if (Tlist.size()<1) {
            System.out.println("请选择你要进入的帖子:");
            i = input.nextInt();
            test.showReply(Tlist.get(i));
        }
    }

    /**
     * 显示主板块
     * @return
     */
    public void showMainBoard(List<MainBoard> list){
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i + ":\t" + list.get(i));
        }
    }

    public List<MainBoard> getMainBoard(){
        MainBoardDao mainBoardDao = new MainBoardDaoImpl();
        List<MainBoard> list = mainBoardDao.getAll();
        return list;
    }

    /**
     * 登录功能
     * @return 登录成功返回完整的user对象
     */
    public User Login(){
        System.out.print("请输入你的帐号:\t");
        String name = input.next();
        System.out.print("\n请输入你的密码:\t");
        String password = input.next();
        User user = new User(name,password);
        UserDao userDao = new UserDaoImpl();
        switch (userDao.login(user)) {
            case 1:
                System.out.println("登录成功");
                break;
            case 0:
                System.out.println("没有此用户");
                break;
            case -1:
                System.out.println("密码错误.");
                break;
            case -2:
                System.out.println("数据库连接错误");
                break;
        }
        return user;
    }

    public void showSonBoard(List<SonBoard> list){
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i+":\t"+list.get(i));
        }
    }

    public List<SonBoard> getSonBoard(MainBoard mainBoard){
        List<SonBoard> list = mainBoard.getSonBoard();
        return list;
    }

    public void showTopic(List<Topic> list){
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i+":\t"+list.get(i));
        }
    }

    public void showReply(Topic topic){
        List<Reply> list = topic.getReply();
        System.out.println("主题:"+topic.getTitle());
        System.out.println("作者:"+topic.getUser().getName());
        System.out.println(topic.getContent());
        System.out.println("创建日期:"+topic.getCreateDate());
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }

    public void SonBoardManager(List<Topic> list){


    }
}
