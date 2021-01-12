package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.ShowQ;
import pers.shayz.crud.bean.ShowQExample;

public interface ShowQMapper {
    long countByExample(ShowQExample example);

    int deleteByExample(ShowQExample example);

    int deleteByPrimaryKey(Integer questionId);

    int insert(ShowQ record);

    int insertSelective(ShowQ record);

    List<ShowQ> selectByExample(ShowQExample example);

    ShowQ selectByPrimaryKey(Integer questionId);

    int updateByExampleSelective(@Param("record") ShowQ record, @Param("example") ShowQExample example);

    int updateByExample(@Param("record") ShowQ record, @Param("example") ShowQExample example);

    int updateByPrimaryKeySelective(ShowQ record);

    int updateByPrimaryKey(ShowQ record);
}