package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.User_achievement;
import pers.shayz.crud.bean.User_achievementExample;

public interface User_achievementMapper {
    long countByExample(User_achievementExample example);

    int deleteByExample(User_achievementExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User_achievement record);

    int insertSelective(User_achievement record);

    List<User_achievement> selectByExample(User_achievementExample example);

    User_achievement selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User_achievement record, @Param("example") User_achievementExample example);

    int updateByExample(@Param("record") User_achievement record, @Param("example") User_achievementExample example);

    int updateByPrimaryKeySelective(User_achievement record);

    int updateByPrimaryKey(User_achievement record);
}