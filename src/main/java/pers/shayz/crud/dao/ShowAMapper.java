package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.ShowA;
import pers.shayz.crud.bean.ShowAExample;

public interface ShowAMapper {
    long countByExample(ShowAExample example);

    int deleteByExample(ShowAExample example);

    int deleteByPrimaryKey(Integer answerId);

    int insert(ShowA record);

    int insertSelective(ShowA record);

    List<ShowA> selectByExample(ShowAExample example);

    ShowA selectByPrimaryKey(Integer answerId);

    int updateByExampleSelective(@Param("record") ShowA record, @Param("example") ShowAExample example);

    int updateByExample(@Param("record") ShowA record, @Param("example") ShowAExample example);

    int updateByPrimaryKeySelective(ShowA record);

    int updateByPrimaryKey(ShowA record);
}