package com.yst.ovls.entity;

import java.util.Date;

/** 问题表*/
public class Issue {
	/**
     * ID
     */
    private Integer id;

    /**
     * 标题
     */
    private String headline;

    /**
     * 问题内容
     */
    private String issueContext;

    /**
     * 发表时间
     */
    private Date publishTime;

    /**
     * 回答问题数量
     */
    private Integer answerCount;

    /**
     * 浏览数量
     */
    private Integer browseCount;

    /**
     * 视频ID(外键)
     */
    private Integer videoId;

    /**
     * 用户ID(外键)
     */
    private Integer userId;

    /**
     * 正确答案ID
     */
    private Integer rightAnswerId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.id
     *
     * @return the value of issue.id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.id
     *
     * @param id the value for issue.id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.headline
     *
     * @return the value of issue.headline
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String getHeadline() {
        return headline;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.headline
     *
     * @param headline the value for issue.headline
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setHeadline(String headline) {
        this.headline = headline == null ? null : headline.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.issue_context
     *
     * @return the value of issue.issue_context
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public String getIssueContext() {
        return issueContext;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.issue_context
     *
     * @param issueContext the value for issue.issue_context
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setIssueContext(String issueContext) {
        this.issueContext = issueContext == null ? null : issueContext.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.publish_time
     *
     * @return the value of issue.publish_time
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.publish_time
     *
     * @param publishTime the value for issue.publish_time
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.answer_count
     *
     * @return the value of issue.answer_count
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getAnswerCount() {
        return answerCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.answer_count
     *
     * @param answerCount the value for issue.answer_count
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setAnswerCount(Integer answerCount) {
        this.answerCount = answerCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.browse_count
     *
     * @return the value of issue.browse_count
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getBrowseCount() {
        return browseCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.browse_count
     *
     * @param browseCount the value for issue.browse_count
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setBrowseCount(Integer browseCount) {
        this.browseCount = browseCount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.video_id
     *
     * @return the value of issue.video_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getVideoId() {
        return videoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.video_id
     *
     * @param videoId the value for issue.video_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.user_id
     *
     * @return the value of issue.user_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.user_id
     *
     * @param userId the value for issue.user_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column issue.right_answer_id
     *
     * @return the value of issue.right_answer_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public Integer getRightAnswerId() {
        return rightAnswerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column issue.right_answer_id
     *
     * @param rightAnswerId the value for issue.right_answer_id
     *
     * @mbg.generated Mon Jan 07 11:58:20 CST 2019
     */
    public void setRightAnswerId(Integer rightAnswerId) {
        this.rightAnswerId = rightAnswerId;
    }
}