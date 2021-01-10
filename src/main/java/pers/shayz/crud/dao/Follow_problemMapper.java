package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Follow_problem;
import pers.shayz.crud.bean.Follow_problemExample;

public interface Follow_problemMapper {
    long countByExample(Follow_problemExample example);

    int deleteByExample(Follow_problemExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Follow_problem record);

    int insertSelective(Follow_problem record);

    List<Follow_problem> selectByExample(Follow_problemExample example);

    Follow_problem selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Follow_problem record, @Param("example") Follow_problemExample example);

    int updateByExample(@Param("record") Follow_problem record, @Param("example") Follow_problemExample example);

    int updateByPrimaryKeySelective(Follow_problem record);

    int updateByPrimaryKey(Follow_problem record);
}