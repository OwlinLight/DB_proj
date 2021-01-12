package pers.shayz.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.crud.bean.ShowA;
import pers.shayz.crud.bean.ShowAExample;
import pers.shayz.crud.dao.ShowAMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class ShowAService {

    @Autowired
    ShowAMapper showAMapper;

    public List<ShowA> getAll() {
        return showAMapper.selectByExample(null);
    }

    public List<ShowA> getQuestionAll(int id) {
        ShowAExample showAExample = new ShowAExample();
        ShowAExample.Criteria criteria = showAExample.createCriteria();
        criteria.andQuestionIdEqualTo(id);
        return showAMapper.selectByExample(showAExample);
    }

    public void saveQ(ShowA showA) {
        showAMapper.insertSelective(showA);
    }

    public boolean checkUser(String QName) {
        ShowAExample example = new ShowAExample();
        ShowAExample.Criteria criteria = example.createCriteria();
        criteria.andAnswerNameEqualTo(QName);
        long count = showAMapper.countByExample(example);
        return count == 0;
    }

    public ShowA getQ(Integer id){
        ShowA showA = showAMapper.selectByPrimaryKey(id);
        return showA;
    }

    public void updateA(ShowA showA) {
        showAMapper.updateByPrimaryKeySelective(showA);
    }

    public void deleteQ(Integer id) {
        showAMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        ShowAExample example = new ShowAExample();
        ShowAExample.Criteria criteria = example.createCriteria();
        criteria.andQuestionIdIn(ids);
        showAMapper.deleteByExample(example);
    }
//
//    /**
//     * 根据姓名或id搜索员工
//     */
//    public List<ShowA> getQByVague(String QName){
//        return showAMapper.selectByVague(QName);
//    }


}
