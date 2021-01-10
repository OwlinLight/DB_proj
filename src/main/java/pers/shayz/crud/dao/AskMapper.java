package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Ask;
import pers.shayz.crud.bean.AskExample;

public interface AskMapper {
    long countByExample(AskExample example);

    int deleteByExample(AskExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ask record);

    int insertSelective(Ask record);

    List<Ask> selectByExample(AskExample example);

    Ask selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ask record, @Param("example") AskExample example);

    int updateByExample(@Param("record") Ask record, @Param("example") AskExample example);

    int updateByPrimaryKeySelective(Ask record);

    int updateByPrimaryKey(Ask record);
}