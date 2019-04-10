package com.yst.ovls.dao;

import com.yst.ovls.entity.User;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Delete({
        "delete from user",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Insert({
        "insert into user (id, name, ",
        "password, nick_name, ",
        "position, sex, location, ",
        "signature, image, ",
        "regtime, salt)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{password,jdbcType=VARCHAR}, #{nickName,jdbcType=VARCHAR}, ",
        "#{position,jdbcType=VARCHAR}, #{sex,jdbcType=VARCHAR}, #{location,jdbcType=VARCHAR}, ",
        "#{signature,jdbcType=VARCHAR}, #{image,jdbcType=VARCHAR}, ",
        "#{regtime,jdbcType=TIMESTAMP}, #{salt,jdbcType=VARCHAR})"
    })
    @Options(useGeneratedKeys=true,keyColumn="id",keyProperty="id")
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @InsertProvider(type=UserSqlProvider.class, method="insertSelective")
    @Options(useGeneratedKeys=true,keyColumn="id",keyProperty="id")
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Select({
        "select",
        "id, name, password, nick_name, position, sex, location, signature, image, regtime, ",
        "salt",
        "from user",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="nick_name", property="nickName", jdbcType=JdbcType.VARCHAR),
        @Result(column="position", property="position", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
        @Result(column="location", property="location", jdbcType=JdbcType.VARCHAR),
        @Result(column="signature", property="signature", jdbcType=JdbcType.VARCHAR),
        @Result(column="image", property="image", jdbcType=JdbcType.VARCHAR),
        @Result(column="regtime", property="regtime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="salt", property="salt", jdbcType=JdbcType.VARCHAR)
    })
    User selectByPrimaryKey(Integer id);

    @Select({
            "select",
            "id, name, password, nick_name, position, sex, location, signature, image, regtime, ",
            "salt",
            "from user"
    })
    @Results({
            @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
            @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
            @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
            @Result(column="nick_name", property="nickName", jdbcType=JdbcType.VARCHAR),
            @Result(column="position", property="position", jdbcType=JdbcType.VARCHAR),
            @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
            @Result(column="location", property="location", jdbcType=JdbcType.VARCHAR),
            @Result(column="signature", property="signature", jdbcType=JdbcType.VARCHAR),
            @Result(column="image", property="image", jdbcType=JdbcType.VARCHAR),
            @Result(column="regtime", property="regtime", jdbcType=JdbcType.TIMESTAMP),
            @Result(column="salt", property="salt", jdbcType=JdbcType.VARCHAR)
    })
    List<User> selectAllUserInfo();
    
    @Select({
        "select",
        "id, name, password, nick_name, position, sex, location, signature, image, regtime, ",
        "salt",
        "from user",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="nick_name", property="nickName", jdbcType=JdbcType.VARCHAR),
        @Result(column="position", property="position", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
        @Result(column="location", property="location", jdbcType=JdbcType.VARCHAR),
        @Result(column="signature", property="signature", jdbcType=JdbcType.VARCHAR),
        @Result(column="image", property="image", jdbcType=JdbcType.VARCHAR),
        @Result(column="regtime", property="regtime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="salt", property="salt", jdbcType=JdbcType.VARCHAR)
    })
    User selectByUserId(Integer id);
    
    
    @Select({
        "select",
        "id, name, password, nick_name, position, sex, location, signature, image, regtime, ",
        "salt",
        "from user",
        "where name = #{name,jdbcType=VARCHAR}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="name", property="name", jdbcType=JdbcType.VARCHAR),
        @Result(column="password", property="password", jdbcType=JdbcType.VARCHAR),
        @Result(column="nick_name", property="nickName", jdbcType=JdbcType.VARCHAR),
        @Result(column="position", property="position", jdbcType=JdbcType.VARCHAR),
        @Result(column="sex", property="sex", jdbcType=JdbcType.VARCHAR),
        @Result(column="location", property="location", jdbcType=JdbcType.VARCHAR),
        @Result(column="signature", property="signature", jdbcType=JdbcType.VARCHAR),
        @Result(column="image", property="image", jdbcType=JdbcType.VARCHAR),
        @Result(column="regtime", property="regtime", jdbcType=JdbcType.TIMESTAMP),
        @Result(column="salt", property="salt", jdbcType=JdbcType.VARCHAR)
    })
    User selectByName(String name);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @UpdateProvider(type=UserSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    @Update({
        "update user",
        "set name = #{name,jdbcType=VARCHAR},",
          "password = #{password,jdbcType=VARCHAR},",
          "nick_name = #{nickName,jdbcType=VARCHAR},",
          "position = #{position,jdbcType=VARCHAR},",
          "sex = #{sex,jdbcType=VARCHAR},",
          "location = #{location,jdbcType=VARCHAR},",
          "signature = #{signature,jdbcType=VARCHAR},",
          "image = #{image,jdbcType=VARCHAR},",
          "regtime = #{regtime,jdbcType=TIMESTAMP},",
          "salt = #{salt,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(User record);
}