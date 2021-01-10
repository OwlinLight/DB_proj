package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Patent;
import pers.shayz.crud.bean.PatentExample;

public interface PatentMapper {
    long countByExample(PatentExample example);

    int deleteByExample(PatentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Patent record);

    int insertSelective(Patent record);

    List<Patent> selectByExample(PatentExample example);

    Patent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Patent record, @Param("example") PatentExample example);

    int updateByExample(@Param("record") Patent record, @Param("example") PatentExample example);

    int updateByPrimaryKeySelective(Patent record);

    int updateByPrimaryKey(Patent record);
}