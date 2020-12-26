package com.bgs.ssm.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/*
    公告类
 */
public class Notice {


    private int noticeId;
    private String noticeTitle;
    private String noticeKeyword;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date noticeReleasetime;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date noticeEndtime;
    private String noticeNumbervis;
    private String noticeState;
    private String noticeText;
    private String noticePic;
    private int userId;
    private int roleId;


    private String departmentName;


    private String userName;


    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getNoticePic() {
        return noticePic;
    }

    public void setNoticePic(String noticePic) {
        this.noticePic = noticePic;
    }

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeKeyword() {
        return noticeKeyword;
    }

    public void setNoticeKeyword(String noticeKeyword) {
        this.noticeKeyword = noticeKeyword;
    }

    public Date getNoticeReleasetime() {
        return noticeReleasetime;
    }

    public void setNoticeReleasetime(Date noticeReleasetime) {
        this.noticeReleasetime = noticeReleasetime;
    }

    public Date getNoticeEndtime() {
        return noticeEndtime;
    }

    public void setNoticeEndtime(Date noticeEndtime) {
        this.noticeEndtime = noticeEndtime;
    }

    public String getNoticeNumbervis() {
        return noticeNumbervis;
    }

    public void setNoticeNumbervis(String noticeNumbervis) {
        this.noticeNumbervis = noticeNumbervis;
    }

    public String getNoticeState() {
        return noticeState;
    }

    public void setNoticeState(String noticeState) {
        this.noticeState = noticeState;
    }

    public String getNoticeText() {
        return noticeText;
    }

    public void setNoticeText(String noticeText) {
        this.noticeText = noticeText;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    @Override
    public String toString() {
        return "Notice{" +
                "noticeId=" + noticeId +
                ", noticeTitle='" + noticeTitle + '\'' +
                ", noticeKeyword='" + noticeKeyword + '\'' +
                ", noticeReleasetime=" + noticeReleasetime +
                ", noticeEndtime=" + noticeEndtime +
                ", noticeNumbervis='" + noticeNumbervis + '\'' +
                ", noticeState='" + noticeState + '\'' +
                ", noticeText='" + noticeText + '\'' +
                ", noticePic='" + noticePic + '\'' +
                ", userId=" + userId +
                ", roleId=" + roleId +
                ", departmentName='" + departmentName + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }
}
