package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Label_field;
import pers.shayz.crud.bean.Label_fieldExample;

public interface Label_fieldMapper {
    long countByExample(Label_fieldExample example);

    int deleteByExample(Label_fieldExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Label_field record);

    int insertSelective(Label_field record);

    List<Label_field> selectByExample(Label_fieldExample example);

    Label_field selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Label_field record, @Param("example") Label_fieldExample example);

    int updateByExample(@Param("record") Label_field record, @Param("example") Label_fieldExample example);

    int updateByPrimaryKeySelective(Label_field record);

    int updateByPrimaryKey(Label_field record);
}