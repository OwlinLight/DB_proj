package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.Author_list;
import pers.shayz.crud.bean.Author_listExample;

public interface Author_listMapper {
    long countByExample(Author_listExample example);

    int deleteByExample(Author_listExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Author_list record);

    int insertSelective(Author_list record);

    List<Author_list> selectByExample(Author_listExample example);

    Author_list selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Author_list record, @Param("example") Author_listExample example);

    int updateByExample(@Param("record") Author_list record, @Param("example") Author_listExample example);

    int updateByPrimaryKeySelective(Author_list record);

    int updateByPrimaryKey(Author_list record);
}