package pers.shayz.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.shayz.crud.bean.ShowQ;
import pers.shayz.crud.bean.ShowQExample;
import pers.shayz.crud.dao.ShowQMapper;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Service
public class ShowQService {

    @Autowired
    ShowQMapper showQMapper;

    public List<ShowQ> getAll() {
        return showQMapper.selectByExample(null);
    }

    public List<ShowQ> getAuthorAll(int id) {
        ShowQExample showQExample = new ShowQExample();
        ShowQExample.Criteria criteria = showQExample.createCriteria();
        criteria.andPaperIdEqualTo(id);
        return showQMapper.selectByExample(showQExample);
    }

    public void saveQ(ShowQ showQ) {
        showQMapper.insertSelective(showQ);
    }

    public boolean checkUser(String QName) {
        ShowQExample example = new ShowQExample();
        ShowQExample.Criteria criteria = example.createCriteria();
        criteria.andQuestionNameEqualTo(QName);
        long count = showQMapper.countByExample(example);
        return count == 0;
    }

    public ShowQ getQ(Integer id){
        ShowQ showQ = showQMapper.selectByPrimaryKey(id);
        return showQ;
    }

    public void updateQ(ShowQ showQ) {
        showQMapper.updateByPrimaryKeySelective(showQ);
    }

    public void deleteQ(Integer id) {
        showQMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        ShowQExample example = new ShowQExample();
        ShowQExample.Criteria criteria = example.createCriteria();
        criteria.andQuestionIdIn(ids);
        showQMapper.deleteByExample(example);
    }
//
//    /**
//     * 根据姓名或id搜索员工
//     */
//    public List<ShowQ> getQByVague(String QName){
//        return showQMapper.selectByVague(QName);
//    }


}
