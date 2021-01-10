package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Sub_problem;
import pers.shayz.crud.bean.Sub_problemExample;

public interface Sub_problemMapper {
    long countByExample(Sub_problemExample example);

    int deleteByExample(Sub_problemExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sub_problem record);

    int insertSelective(Sub_problem record);

    List<Sub_problem> selectByExample(Sub_problemExample example);

    Sub_problem selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sub_problem record, @Param("example") Sub_problemExample example);

    int updateByExample(@Param("record") Sub_problem record, @Param("example") Sub_problemExample example);

    int updateByPrimaryKeySelective(Sub_problem record);

    int updateByPrimaryKey(Sub_problem record);
}