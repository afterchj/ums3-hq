package com.tp.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-5-19
 * Time: 下午3:03
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="f_file_topic")
public class TopicFileLink extends LongIDEntity {
    private ThemeFile theme;
    private Topic topic;
    private Long sort;

    @ManyToOne
    @JoinColumn(name="theme_id")
    @OrderBy("sort asc")
    public ThemeFile getTheme() {
        return theme;
    }

    public void setTheme(ThemeFile theme) {
        this.theme = theme;
    }

    @ManyToOne
    @JoinColumn(name="topic_id")
    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
