package com.lumr.bbs.servlet;

import com.lumr.bbs.service.MainBoardService;
import com.lumr.bbs.service.SonBoardService;
import com.lumr.bbs.service.TopicService;
import com.lumr.bbs.service.impl.MainBoardServiceImpl;
import com.lumr.bbs.service.impl.SonBoardServiceImpl;
import com.lumr.bbs.service.impl.TopicServiceImpl;
import com.lumr.bbs.vo.MainBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 主页
 * Created by fsweb on 17-3-21.
 */
public class Index extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MainBoardService mainBoardService = new MainBoardServiceImpl();
        List<MainBoard> M_list = mainBoardService.getAllMainBoard();
        req.setAttribute("M_list",M_list);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
