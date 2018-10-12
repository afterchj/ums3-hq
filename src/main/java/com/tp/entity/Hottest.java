package com.tp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created with IntelliJ IDEA. User: Administrator Date: 13-5-19 Time: 下午2:28 To
 * change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "f_hottest_search")
public class Hottest extends LongIDEntity {
    private String name;
    private Integer times;
    private Date updateTime;
    private String other;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    @Column(name="update_time")
    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }
}
