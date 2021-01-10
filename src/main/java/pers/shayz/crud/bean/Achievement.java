package pers.shayz.crud.bean;

public class Achievement {
    private Integer id;

    private Integer authorListId;

    private Integer topicId;

    private String type;

    private Integer referId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorListId() {
        return authorListId;
    }

    public void setAuthorListId(Integer authorListId) {
        this.authorListId = authorListId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getReferId() {
        return referId;
    }

    public void setReferId(Integer referId) {
        this.referId = referId;
    }
}