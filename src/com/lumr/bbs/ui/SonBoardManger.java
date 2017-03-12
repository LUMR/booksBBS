package com.lumr.bbs.ui;

import com.lumr.bbs.dao.TopicDao;
import com.lumr.bbs.dao.impl.TopicDaoImpl;
import com.lumr.bbs.vo.SonBoard;
import com.lumr.bbs.vo.Topic;

import java.util.List;
import java.util.Scanner;

/**
 * Created by fsweb on 17-3-8.
 */
public class SonBoardManger {
    private static Scanner input = new Scanner(System.in);
    public void showMenu(List<Topic> list){
        System.out.println("请选择你要进行的操作:");
        System.out.println("1.访问帖子\t2.发帖\t3.返回");
        String i = input.next();
        switch (i){
            case "1":
                showTopic(list);
                System.out.println("请选择你要进行的操作:");
                System.out.println("1.回复\t2.返回");
                break;
            case "2":

        }
    }

    public void showTopic(List<Topic> list){
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i+":\t"+list.get(i));
        }
    }

    public void addTopic(){

    }
}
