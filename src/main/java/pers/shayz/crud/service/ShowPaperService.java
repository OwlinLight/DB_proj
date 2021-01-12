package pers.shayz.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.crud.bean.EmployeeExample;
import pers.shayz.crud.bean.ShowPaper;
import pers.shayz.crud.bean.ShowPaperExample;
import pers.shayz.crud.dao.ShowPaperMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class ShowPaperService {

    @Autowired
    ShowPaperMapper showPaperMapper;

    public List<ShowPaper> getAll() {
        return showPaperMapper.selectByExample(null);
    }

    public List<ShowPaper> getAuthorAll(int id) {
        ShowPaperExample showPaperExample = new ShowPaperExample();
        ShowPaperExample.Criteria criteria = showPaperExample.createCriteria();
        criteria.andAuthorIdEqualTo(id);
        return showPaperMapper.selectByExample(showPaperExample);
    }

    public void savePaper(ShowPaper showPaper) {
        showPaperMapper.insertSelective(showPaper);
    }

    public boolean checkUser(String paperName) {
        ShowPaperExample example = new ShowPaperExample();
        ShowPaperExample.Criteria criteria = example.createCriteria();
        criteria.andPaperNameEqualTo(paperName);
        long count = showPaperMapper.countByExample(example);
        return count == 0;
    }

    public ShowPaper getPaper(Integer id){
        ShowPaper showPaper = showPaperMapper.selectByPrimaryKey(id);
        return showPaper;
    }

    public void updatePaper(ShowPaper showPaper) {
        showPaperMapper.updateByPrimaryKeySelective(showPaper);
    }

    public void deletePaper(Integer id) {
        showPaperMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        ShowPaperExample example = new ShowPaperExample();
        ShowPaperExample.Criteria criteria = example.createCriteria();
        criteria.andPaperIdIn(ids);
        showPaperMapper.deleteByExample(example);
    }
//
//    /**
//     * 根据姓名或id搜索员工
//     */
//    public List<ShowPaper> getPaperByVague(String paperName){
//        return showPaperMapper.selectByVague(paperName);
//    }


}
