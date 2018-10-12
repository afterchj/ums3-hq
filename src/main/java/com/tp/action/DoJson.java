package com.tp.action;

import com.alibaba.fastjson.JSON;
import com.tp.utils.DBHelper;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by hongjian.chen on 2018/3/28.
 */
public class DoJson extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        System.out.println("pid=" + pid);
        List<Object> subList;
        String result;
        if (StringUtils.isNotEmpty(pid)) {
            Long id = Long.parseLong(pid);
            subList = getList(id);
            result = JSON.toJSONString(subList);
        } else {
            subList = getList(null);
            result = JSON.toJSONString(subList);
        }
        response.getWriter().write(result);
    }

    public List<Object> getList(Long pid) {
        DBHelper db = new DBHelper();
        String sql = "select sc.id,sc.name from sp_category sp join sp_category sc on sp.id=sc.parent_id and sp.id=?";
        String sql1 = "select sc.id,sc.name from sp_category sp join sp_category sc on sp.id=sc.parent_id";
        List<Object> subList = new ArrayList<>();
        ResultSet ret;
        if (pid == null) {
            db.getAll(sql1);
        } else {
            db.getById(sql, pid);
        }
        try {
            ret = db.pst.executeQuery();//执行语句，得到结果集
            while (ret.next()) {
                Map<String, Object> map = new HashedMap();
                map.put("id", ret.getInt(1));
                map.put("name", ret.getString(2));
                subList.add(map);
            }
            ret.close();
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subList;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
