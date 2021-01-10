package pers.shayz.crud.bean;

public class Answer {
    private Integer id;

    private Integer problemId;

    private String description;

    private Integer vote;

    private Integer devote;

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

    public Integer getVote() {
        return vote;
    }

    public void setVote(Integer vote) {
        this.vote = vote;
    }

    public Integer getDevote() {
        return devote;
    }

    public void setDevote(Integer devote) {
        this.devote = devote;
    }
}