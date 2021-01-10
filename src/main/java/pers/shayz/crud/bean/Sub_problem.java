package pers.shayz.crud.bean;

public class Sub_problem {
    private Integer id;

    private Integer problemId;

    private String description;

    private Integer userAskId;

    private Integer userAnswerId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getUserAskId() {
        return userAskId;
    }

    public void setUserAskId(Integer userAskId) {
        this.userAskId = userAskId;
    }

    public Integer getUserAnswerId() {
        return userAnswerId;
    }

    public void setUserAnswerId(Integer userAnswerId) {
        this.userAnswerId = userAnswerId;
    }
}