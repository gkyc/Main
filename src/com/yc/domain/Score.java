package com.yc.domain;

public class Score {
    private String schoolName;  // 学校名
    private String province;    // 省份
    private String subject;     // 录取文理科
    private int year;           // 年份
    private int lScore;         // 录取最低分
    private int aScore;         // 录取平均分
    private String pici;        // 录取批次

    public Score( int year, int lScore ) {
        this.year = year;
        this.lScore = lScore;
    }

    public String getPici() {
        return pici;
    }

    public void setPici(String pici) {
        this.pici = pici;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getlScore() {
        return lScore;
    }

    public void setlScore(int lScore) {
        this.lScore = lScore;
    }

    public int getaScore() {
        return aScore;
    }

    public void setaScore(int aScore) {
        this.aScore = aScore;
    }

    @Override
    public String toString() {
        return "Score{" +
                "schoolName='" + schoolName + '\'' +
                ", province='" + province + '\'' +
                ", subject='" + subject + '\'' +
                ", pici='" + pici + '\'' +
                ", year=" + year +
                ", lScore=" + lScore +
                ", aScore=" + aScore +
                '}';
    }
}
