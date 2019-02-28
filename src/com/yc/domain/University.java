package com.yc.domain;

public class University {
    private String schoolName;
    private String schoolLocation;
    private String schoolImg;
    private String schoolXingzhi;
    private String schoolTese;
    private String schoolLishu;
    private String schoolNet;
    private String schoolLeixing;

    public String getSchoolLeixing() {
        return schoolLeixing;
    }

    public void setSchoolLeixing(String schoolLeixing) {
        this.schoolLeixing = schoolLeixing;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSchoolLocation() {
        return schoolLocation;
    }

    public void setSchoolLocation(String schoolLocation) {
        this.schoolLocation = schoolLocation;
    }

    public String getSchoolImg() {
        return schoolImg;
    }

    public void setSchoolImg(String schoolImg) {
        this.schoolImg = schoolImg;
    }

    public String getSchoolXingzhi() {
        return schoolXingzhi;
    }

    public void setSchoolXingzhi(String schoolXingzhi) {
        this.schoolXingzhi = schoolXingzhi;
    }

    public String getSchoolTese() {
        return schoolTese;
    }

    public void setSchoolTese(String schoolTese) {
        this.schoolTese = schoolTese;
    }

    public String getSchoolLishu() {
        return schoolLishu;
    }

    public void setSchoolLishu(String schoolLishu) {
        this.schoolLishu = schoolLishu;
    }

    public String getSchoolNet() {
        return schoolNet;
    }

    public void setSchoolNet(String schoolNet) {
        this.schoolNet = schoolNet;
    }

    @Override
    public String toString() {
        return "University{" +
                "schoolName='" + schoolName + '\'' +
                ", schoolLocation='" + schoolLocation + '\'' +
                ", schoolImg='" + schoolImg + '\'' +
                ", schoolXingzhi='" + schoolXingzhi + '\'' +
                ", schoolTese='" + schoolTese + '\'' +
                ", schoolLishu='" + schoolLishu + '\'' +
                ", schoolNet='" + schoolNet + '\'' +
                '}';
    }
}
