package pers.shayz.crud.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pers.shayz.crud.bean.ShowPaper;
import pers.shayz.crud.bean.ShowPaperExample;

public interface ShowPaperMapper {
    long countByExample(ShowPaperExample example);

    int deleteByExample(ShowPaperExample example);

    int deleteByPrimaryKey(Integer paperId);

    int insert(ShowPaper record);

    int insertSelective(ShowPaper record);

    List<ShowPaper> selectByExample(ShowPaperExample example);

    ShowPaper selectByPrimaryKey(Integer paperId);

    int updateByExampleSelective(@Param("record") ShowPaper record, @Param("example") ShowPaperExample example);

    int updateByExample(@Param("record") ShowPaper record, @Param("example") ShowPaperExample example);

    int updateByPrimaryKeySelective(ShowPaper record);

    int updateByPrimaryKey(ShowPaper record);
}