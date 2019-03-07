package com.yc.domain;

// 查询录取概率返回的实体类
public class ShowPro {
    private String schoolName;
    private String schoolLoc;
    private Double schoolPro;

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getSchoolLoc() {
        return schoolLoc;
    }

    public void setSchoolLoc(String schoolLoc) {
        this.schoolLoc = schoolLoc;
    }

    public Double getSchoolPro() {
        return schoolPro;
    }

    public void setSchoolPro(Double schoolPro) {
        this.schoolPro = schoolPro;
    }

    @Override
    public String toString() {
        return "ShowPro{" +
                "schoolName='" + schoolName + '\'' +
                ", schoolLoc='" + schoolLoc + '\'' +
                ", schoolPro=" + schoolPro +
                '}';
    }
}
