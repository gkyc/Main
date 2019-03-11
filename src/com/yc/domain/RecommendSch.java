package com.yc.domain;

/**
 * 向用户推荐的高校所含信息
 */
public class RecommendSch {
    private String schName;
    private double proRank; // 省排名得分
    private double conRank;    // 全国排名得分
    private double beAdmit; // 被录取概率得分

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }

    public double getProRank() {
        return proRank;
    }

    public void setProRank(double proRank) {
        this.proRank = proRank;
    }

    public double getConRank() {
        return conRank;
    }

    public void setConRank(double conRank) {
        this.conRank = conRank;
    }

    public double getBeAdmit() {
        return beAdmit;
    }

    public void setBeAdmit(double beAdmit) {
        this.beAdmit = beAdmit;
    }

    @Override
    public String toString() {
        return "RecommendSch{" +
                "schName='" + schName + '\'' +
                ", proRank=" + proRank +
                ", conRank=" + conRank +
                ", beAdmit=" + beAdmit +
                '}';
    }
}
