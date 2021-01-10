package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Follow_user;
import pers.shayz.crud.bean.Follow_userExample;

public interface Follow_userMapper {
    long countByExample(Follow_userExample example);

    int deleteByExample(Follow_userExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Follow_user record);

    int insertSelective(Follow_user record);

    List<Follow_user> selectByExample(Follow_userExample example);

    Follow_user selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Follow_user record, @Param("example") Follow_userExample example);

    int updateByExample(@Param("record") Follow_user record, @Param("example") Follow_userExample example);

    int updateByPrimaryKeySelective(Follow_user record);

    int updateByPrimaryKey(Follow_user record);
}