package com.lumr.bbs.servlet;

import com.lumr.bbs.service.SonBoardService;
import com.lumr.bbs.service.impl.SonBoardServiceImpl;
import com.lumr.bbs.vo.SonBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 显示子版块列表
 * Created by fsweb on 17-3-21.
 */
public class SonBoardList extends HttpServlet {
    private int pages;
    private int sid;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取页数

        if (req.getParameter("pages") == null)
            pages = 0;
        else {
            try {
                pages = Integer.parseInt(req.getParameter("pages"));
            } catch (NumberFormatException e) {
                pages = 0;
            }
        }
        //获取子板块信息

        try {
            sid = Integer.parseInt(req.getParameter("sid"));
        }catch (NumberFormatException e){
            sid = 0;
            System.out.println("<h1>sid错误！</h1>");
        }
        SonBoardService sonBoardService = new SonBoardServiceImpl();
        SonBoard sonBoard = sonBoardService.getSonBoard(sid);
        if (sonBoard == null) {
            System.out.print("<h2>没有此主版块</h2>");
            return;
        }
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
        req.getRequestDispatcher("list.jsp").forward(req,resp);
    }
}
