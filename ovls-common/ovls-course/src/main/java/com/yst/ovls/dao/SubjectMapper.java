package com.yst.ovls.dao;

import com.yst.ovls.entity.Subject;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

public interface SubjectMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from subject",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Insert({
        "insert into subject (id, name, ",
        "direction_id)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{directionId,jdbcType=INTEGER})"
    })
    int insert(Subject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=SubjectSqlProvider.class, method="insertSelective")
    int insertSelective(Subject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "id, name, direction_id",
        "from subject",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="direction_id", property="directionId", jdbcType=JdbcType.INTEGER)
    })
    Subject selectByPrimaryKey(Integer id);

    @Select({
            "select",
            "s.id, s.name,d.name directionName, direction_id",
            "from subject s,direction d where s.direction_id = d.id"

    })
    @Results({
            @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
            @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
            @Result(column="direction_id", property="directionId", jdbcType=JdbcType.INTEGER)
    })
    List<Subject> selectSubject();
    
    /** 根据方向ID查询学科信息*/
    @Select({
        "select",
        "id, name, direction_id",
        "from subject",
        "where direction_id = #{directionId,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="direction_id", property="directionId", jdbcType=JdbcType.INTEGER)
    })
    List<Subject> selectByDirectionId(Integer directionId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=SubjectSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Subject record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table subject
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update subject",
        "set name = #{name,jdbcType=VARCHAR},",
          "direction_id = #{directionId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Subject record);
}