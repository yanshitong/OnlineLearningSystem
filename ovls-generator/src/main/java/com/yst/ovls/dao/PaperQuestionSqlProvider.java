package com.yst.ovls.dao;

import com.yst.ovls.entity.PaperQuestion;
import org.apache.ibatis.jdbc.SQL;

public class PaperQuestionSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_question
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String insertSelective(PaperQuestion record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("paper_question");
        
        if (record.getPaperId() != null) {
            sql.VALUES("paper_id", "#{paperId,jdbcType=INTEGER}");
        }
        
        if (record.getQuestionId() != null) {
            sql.VALUES("question_id", "#{questionId,jdbcType=INTEGER}");
        }
        
        if (record.getQuestionScore() != null) {
            sql.VALUES("question_score", "#{questionScore,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_question
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String updateByPrimaryKeySelective(PaperQuestion record) {
        SQL sql = new SQL();
        sql.UPDATE("paper_question");
        
        if (record.getQuestionId() != null) {
            sql.SET("question_id = #{questionId,jdbcType=INTEGER}");
        }
        
        if (record.getQuestionScore() != null) {
            sql.SET("question_score = #{questionScore,jdbcType=INTEGER}");
        }
        
        sql.WHERE("paper_id = #{paperId,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}