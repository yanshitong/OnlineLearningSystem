package com.yst.ovls.dao;

import com.yst.ovls.entity.PaperKnowledge;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface PaperKnowledgeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from paper_knowledge",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Insert({
        "insert into paper_knowledge (id, paper_id, ",
        "knowledge_id, question_num)",
        "values (#{id,jdbcType=INTEGER}, #{paperId,jdbcType=INTEGER}, ",
        "#{knowledgeId,jdbcType=INTEGER}, #{questionNum,jdbcType=INTEGER})"
    })
    int insert(PaperKnowledge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=PaperKnowledgeSqlProvider.class, method="insertSelective")
    int insertSelective(PaperKnowledge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "id, paper_id, knowledge_id, question_num",
        "from paper_knowledge",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="paper_id", property="paperId", jdbcType=JdbcType.INTEGER),
        @Result(column="knowledge_id", property="knowledgeId", jdbcType=JdbcType.INTEGER),
        @Result(column="question_num", property="questionNum", jdbcType=JdbcType.INTEGER)
    })
    PaperKnowledge selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=PaperKnowledgeSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(PaperKnowledge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table paper_knowledge
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update paper_knowledge",
        "set paper_id = #{paperId,jdbcType=INTEGER},",
          "knowledge_id = #{knowledgeId,jdbcType=INTEGER},",
          "question_num = #{questionNum,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(PaperKnowledge record);
}