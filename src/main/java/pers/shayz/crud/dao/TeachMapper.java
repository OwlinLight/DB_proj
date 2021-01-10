package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Teach;
import pers.shayz.crud.bean.TeachExample;

public interface TeachMapper {
    long countByExample(TeachExample example);

    int deleteByExample(TeachExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Teach record);

    int insertSelective(Teach record);

    List<Teach> selectByExample(TeachExample example);

    Teach selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Teach record, @Param("example") TeachExample example);

    int updateByExample(@Param("record") Teach record, @Param("example") TeachExample example);

    int updateByPrimaryKeySelective(Teach record);

    int updateByPrimaryKey(Teach record);
}