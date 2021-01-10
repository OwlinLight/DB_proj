package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Respond;
import pers.shayz.crud.bean.RespondExample;

public interface RespondMapper {
    long countByExample(RespondExample example);

    int deleteByExample(RespondExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Respond record);

    int insertSelective(Respond record);

    List<Respond> selectByExample(RespondExample example);

    Respond selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Respond record, @Param("example") RespondExample example);

    int updateByExample(@Param("record") Respond record, @Param("example") RespondExample example);

    int updateByPrimaryKeySelective(Respond record);

    int updateByPrimaryKey(Respond record);
}