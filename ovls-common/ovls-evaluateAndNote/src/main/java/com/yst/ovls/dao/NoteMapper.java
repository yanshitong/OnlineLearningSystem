package com.yst.ovls.dao;

import com.yst.ovls.entity.Note;

import java.util.List;

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

public interface NoteMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from note",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Insert({
        "insert into note (id, publish_time, ",
        "like_count, user_id, ",
        "video_id, title, ",
        "context)",
        "values (#{id,jdbcType=INTEGER}, #{publishTime,jdbcType=TIMESTAMP}, ",
        "#{likeCount,jdbcType=INTEGER}, #{userId,jdbcType=INTEGER}, ",
        "#{videoId,jdbcType=INTEGER}, #{title,jdbcType=VARCHAR}, ",
        "#{context,jdbcType=LONGVARCHAR})"
    })
    int insert(Note record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=NoteSqlProvider.class, method="insertSelective")
    int insertSelective(Note record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "id, publish_time, like_count, user_id, video_id, title, context",
        "from note",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER),
        @Result(column="user_id", property="userId", jdbcType=JdbcType.INTEGER),
        @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
        @Result(column="title", property="title", jdbcType=JdbcType.VARCHAR),
        @Result(column="context", property="context", jdbcType=JdbcType.LONGVARCHAR)
    })
    Note selectByPrimaryKey(Integer id);
    
    /** 根据视频id查询所有笔记*/
    @Select({
        "select",
        "id, publish_time, like_count, user_id, video_id, title, context",
        "from note",
        "where video_id = #{videoId,jdbcType=INTEGER}",
        "order by  publish_time desc"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER),
        @Result(column="user_id", property="userId", jdbcType=JdbcType.INTEGER),
        @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
        @Result(column="title", property="title", jdbcType=JdbcType.VARCHAR),
        @Result(column="context", property="context", jdbcType=JdbcType.LONGVARCHAR)
    })
    List<Note> selectByVideoId(Integer videoId);
    
    
    /** 根据视频id和用户id查询所有笔记*/
    @Select({
        "select",
        "id, publish_time, like_count, user_id, video_id, title, context",
        "from note",
        "where video_id = #{videoId,jdbcType=INTEGER}  and user_id = #{userId,jdbcType=INTEGER}",
        "order by  publish_time desc"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="publish_time", property="publishTime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="like_count", property="likeCount", jdbcType=JdbcType.INTEGER),
        @Result(column="user_id", property="userId", jdbcType=JdbcType.INTEGER),
        @Result(column="video_id", property="videoId", jdbcType=JdbcType.INTEGER),
        @Result(column="title", property="title", jdbcType=JdbcType.VARCHAR),
        @Result(column="context", property="context", jdbcType=JdbcType.LONGVARCHAR)
    })
    List<Note> selectByVideoIdAndUserId(@Param("videoId")Integer videoId,@Param("userId")Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=NoteSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Note record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update note",
        "set publish_time = #{publishTime,jdbcType=TIMESTAMP},",
          "like_count = #{likeCount,jdbcType=INTEGER},",
          "user_id = #{userId,jdbcType=INTEGER},",
          "video_id = #{videoId,jdbcType=INTEGER},",
          "title = #{title,jdbcType=VARCHAR},",
          "context = #{context,jdbcType=LONGVARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKeyWithBLOBs(Note record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table note
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update note",
        "set publish_time = #{publishTime,jdbcType=TIMESTAMP},",
          "like_count = #{likeCount,jdbcType=INTEGER},",
          "user_id = #{userId,jdbcType=INTEGER},",
          "video_id = #{videoId,jdbcType=INTEGER},",
          "title = #{title,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Note record);
}