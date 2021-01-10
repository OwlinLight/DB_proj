package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Educate;
import pers.shayz.crud.bean.EducateExample;

public interface EducateMapper {
    long countByExample(EducateExample example);

    int deleteByExample(EducateExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Educate record);

    int insertSelective(Educate record);

    List<Educate> selectByExample(EducateExample example);

    Educate selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Educate record, @Param("example") EducateExample example);

    int updateByExample(@Param("record") Educate record, @Param("example") EducateExample example);

    int updateByPrimaryKeySelective(Educate record);

    int updateByPrimaryKey(Educate record);
}