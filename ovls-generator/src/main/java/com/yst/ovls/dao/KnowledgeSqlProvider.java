package com.yst.ovls.dao;

import com.yst.ovls.entity.Knowledge;
import org.apache.ibatis.jdbc.SQL;

public class KnowledgeSqlProvider {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String insertSelective(Knowledge record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("knowledge");
        
        if (record.getId() != null) {
            sql.VALUES("Id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getName() != null) {
            sql.VALUES("name", "#{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSubjectId() != null) {
            sql.VALUES("subject_id", "#{subjectId,jdbcType=INTEGER}");
        }
        
        if (record.getChapterId() != null) {
            sql.VALUES("chapter_id", "#{chapterId,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String updateByPrimaryKeySelective(Knowledge record) {
        SQL sql = new SQL();
        sql.UPDATE("knowledge");
        
        if (record.getName() != null) {
            sql.SET("name = #{name,jdbcType=VARCHAR}");
        }
        
        if (record.getSubjectId() != null) {
            sql.SET("subject_id = #{subjectId,jdbcType=INTEGER}");
        }
        
        if (record.getChapterId() != null) {
            sql.SET("chapter_id = #{chapterId,jdbcType=INTEGER}");
        }
        
        sql.WHERE("Id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }
}