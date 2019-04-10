package com.yst.ovls.dao;

import com.yst.ovls.entity.PaperExamReport;
import org.apache.ibatis.jdbc.SQL;

public class PaperExamReportSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_exam_report
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String insertSelective(PaperExamReport record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("paper_exam_report");
        
        if (record.getReportId() != null) {
            sql.VALUES("report_id", "#{reportId,jdbcType=INTEGER}");
        }
        
        if (record.getUserId() != null) {
            sql.VALUES("user_id", "#{userId,jdbcType=INTEGER}");
        }
        
        if (record.getPaperId() != null) {
            sql.VALUES("paper_id", "#{paperId,jdbcType=INTEGER}");
        }
        
        if (record.getErrorNum() != null) {
            sql.VALUES("error_num", "#{errorNum,jdbcType=INTEGER}");
        }
        
        if (record.getRightNum() != null) {
            sql.VALUES("right_num", "#{rightNum,jdbcType=INTEGER}");
        }
        
        if (record.getScore() != null) {
            sql.VALUES("score", "#{score,jdbcType=DOUBLE}");
        }
        
        if (record.getSubmitTime() != null) {
            sql.VALUES("submit_time", "#{submitTime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getCreateTime() != null) {
            sql.VALUES("create_time", "#{createTime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getContent() != null) {
            sql.VALUES("content", "#{content,jdbcType=LONGVARCHAR}");
        }
        
        return sql.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_exam_report
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String updateByPrimaryKeySelective(PaperExamReport record) {
        SQL sql = new SQL();
        sql.UPDATE("paper_exam_report");
        
        if (record.getUserId() != null) {
            sql.SET("user_id = #{userId,jdbcType=INTEGER}");
        }
        
        if (record.getPaperId() != null) {
            sql.SET("paper_id = #{paperId,jdbcType=INTEGER}");
        }
        
        if (record.getErrorNum() != null) {
            sql.SET("error_num = #{errorNum,jdbcType=INTEGER}");
        }
        
        if (record.getRightNum() != null) {
            sql.SET("right_num = #{rightNum,jdbcType=INTEGER}");
        }
        
        if (record.getScore() != null) {
            sql.SET("score = #{score,jdbcType=DOUBLE}");
        }
        
        if (record.getSubmitTime() != null) {
            sql.SET("submit_time = #{submitTime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getCreateTime() != null) {
            sql.SET("create_time = #{createTime,jdbcType=TIMESTAMP}");
        }
        
        if (record.getContent() != null) {
            sql.SET("content = #{content,jdbcType=LONGVARCHAR}");
        }
        
        sql.WHERE("report_id = #{reportId,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}