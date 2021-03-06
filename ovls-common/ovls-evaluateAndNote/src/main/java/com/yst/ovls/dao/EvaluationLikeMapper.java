package com.yst.ovls.dao;

import com.yst.ovls.entity.EvaluationLike;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

public interface EvaluationLikeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluation_like
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from evaluation_like",
        "where Id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);
    
    /** 根据用户id和评价id删除点赞记录*/
    @Delete({
        "delete from evaluation_like",
        "where evaluation_id = #{evaluationId,jdbcType=INTEGER} and user_id = #{userId,jdbcType=INTEGER}"
    })
    int deleteByEIdAndUserId(@Param("evaluationId")Integer evaluationId,@Param("userId")Integer userId);

    /**
       添加点赞记录
     */
    @Insert({
        "insert into evaluation_like (Id, evaluation_id, ",
        "user_id, like_time)",
        "values (#{id,jdbcType=INTEGER}, #{evaluationId,jdbcType=INTEGER}, ",
        "#{userId,jdbcType=INTEGER}, #{likeTime,jdbcType=TIMESTAMP})"
    })
    int insert(EvaluationLike record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluation_like
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=EvaluationLikeSqlProvider.class, method="insertSelective")
    int insertSelective(EvaluationLike record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluation_like
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "Id, evaluation_id, user_id, like_time",
        "from evaluation_like",
        "where Id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="Id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="evaluation_id", property="evaluationId", jdbcType=JdbcType.INTEGER),
        @Result(column="user_id", property="userId", jdbcType=JdbcType.INTEGER),
        @Result(column="like_time", property="likeTime", jdbcType=JdbcType.TIMESTAMP)
    })
    EvaluationLike selectByPrimaryKey(Integer id);
    
    /** 根据UserIdAndEvaluateId获得用户点赞记录*/
    @Select({
        "select",
        "Id, evaluation_id, user_id, like_time",
        "from evaluation_like",
        "where user_id= #{userId,jdbcType=INTEGER} and evaluation_id = #{evaluationId,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="Id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="evaluation_id", property="evaluationId", jdbcType=JdbcType.INTEGER),
        @Result(column="user_id", property="userId", jdbcType=JdbcType.INTEGER),
        @Result(column="like_time", property="likeTime", jdbcType=JdbcType.TIMESTAMP)
    })
    List<EvaluationLike> selectByUserIdAndEvaluateId(@Param("userId")Integer userId, @Param("evaluationId")Integer evaluationId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluation_like
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=EvaluationLikeSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(EvaluationLike record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluation_like
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update evaluation_like",
        "set evaluation_id = #{evaluationId,jdbcType=INTEGER},",
          "user_id = #{userId,jdbcType=INTEGER},",
          "like_time = #{likeTime,jdbcType=TIMESTAMP}",
        "where Id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(EvaluationLike record);
}