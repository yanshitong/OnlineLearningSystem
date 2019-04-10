package com.yst.ovls.entity;

/** 章节*/
public class Chapter {
	/**
	 * ID
	 */
	private Integer id;

	/**
	 * 名称(not Null)
	 */
	private String name;

	/**
	 * 课程ID(外键，表course)
	 */
	private Integer courseId;

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column chapter.id
	 *
	 * @return the value of chapter.id
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column chapter.id
	 *
	 * @param id
	 *            the value for chapter.id
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column chapter.name
	 *
	 * @return the value of chapter.name
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public String getName() {
		return name;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column chapter.name
	 *
	 * @param name
	 *            the value for chapter.name
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the
	 * value of the database column chapter.course_id
	 *
	 * @return the value of chapter.course_id
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public Integer getCourseId() {
		return courseId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the
	 * value of the database column chapter.course_id
	 *
	 * @param courseId
	 *            the value for chapter.course_id
	 *
	 * @mbg.generated Mon Jan 07 11:58:20 CST 2019
	 */
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
}