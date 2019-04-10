package com.yst.ovls.dao;

import com.yst.ovls.entity.Evaluate;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface EvaluateMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from evaluate",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Insert({
        "insert into evaluate (id, use_id, ",
        "context, publish_time, ",
        "video_id, like_count)",
        "values (#{id,jdbcType=INTEGER}, #{useId,jdbcType=INTEGER}, ",
        "#{context,jdbcType=VARCHAR}, #{publishTime,jdbcType=TIMESTAMP}, ",
        "#{videoId,jdbcType=INTEGER}, #{likeCount,jdbcType=INTEGER})"
    })
    int insert(Evaluate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=EvaluateSqlProvider.class, method="insertSelective")
    int insertSelective(Evaluate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "id, use_id, context, publish_time, video_id, like_count",
        "from evaluate",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="use_id", property="useId", jdbcType=JdbcType.INTEGER),
        @Result(column="context", property="context", jdbcType=JdbcType.VARCHAR),
        @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
        @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER)
    })
    Evaluate selectByPrimaryKey(Integer id);


    /*获得所有评价的信息*/
    @Select({
            "select",
            "e.id id, use_id, context, e.publish_time publish_time, video_id, like_count ,v.name videoName,u.nick_name userName",
            "FROM evaluate e LEFT JOIN USER u ON e.use_id = u.id LEFT JOIN video v ON e.video_id =v.id"
    })
    @Results({
            @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
            @Result(column="use_id", property="useId", jdbcType=JdbcType.INTEGER),
            @Result(column="context", property="context", jdbcType=JdbcType.VARCHAR),
            @Result(column="videoName", property="videoName", jdbcType=JdbcType.VARCHAR),
            @Result(column="userName", property="userName", jdbcType=JdbcType.VARCHAR),
            @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
            @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
            @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER)
    })
    List<Evaluate> getEvaluates();

 
    //根据视频ID
    @Select({
        "select",
        "id, use_id, context, publish_time, video_id, like_count",
        "from evaluate",
        "where video_id = #{videoId,jdbcType=INTEGER}",
        "order by  publish_time desc"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="use_id", property="useId", jdbcType=JdbcType.INTEGER),
        @Result(column="context", property="context", jdbcType=JdbcType.VARCHAR),
        @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
        @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER)
    })
    List<Evaluate> selectByVideoId(Integer videoId);
    
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=EvaluateSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Evaluate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table evaluate
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update evaluate",
        "set use_id = #{useId,jdbcType=INTEGER},",
          "context = #{context,jdbcType=VARCHAR},",
          "publish_time = #{publishTime,jdbcType=TIMESTAMP},",
          "video_id = #{videoId,jdbcType=INTEGER},",
          "like_count = #{likeCount,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Evaluate record);
}