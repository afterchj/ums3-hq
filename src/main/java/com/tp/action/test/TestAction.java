package com.tp.action.test;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import java.util.List;

/**
 * Created by hongjian.chen on 2018/3/29.
 */

@Results({@Result(name = "reload", location = "test.action", params = {"pid", "${pid}", "id", "${id}"}, type = "redirect")})
public class TestAction extends ActionSupport {
    private Long[] hobby;

    private List<Long> address;

    public Long[] getHobby() {
        return hobby;
    }

    public void setHobby(Long[] hobby) {
        this.hobby = hobby;
    }

    public List<Long> getAddress() {
        return address;
    }

    public void setAddress(List<Long> address) {
        this.address = address;
    }

    public String list() {
        return SUCCESS;
    }

    public String input() {
        if (hobby != null) {
            System.out.println("hobby.length=" + hobby.length);
            for (Long id : hobby) {
                System.out.println("hobby=" + id);
            }
        }
        if (address != null) {
            System.out.println("address.length=" + address.size());
            for (Long id : address) {
                System.out.println("address=" + id);
            }
        }
        return INPUT;
    }

    public String save() {
        return "reload";
    }
}
