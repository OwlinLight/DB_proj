package pers.shayz.crud.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pers.shayz.crud.bean.Msg;
import pers.shayz.crud.bean.ShowQ;
import pers.shayz.crud.service.ShowQService;

import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class QuestionController {

    @Autowired
    ShowQService showQService;
//
//    @RequestMapping(value = "/A/{ids}", method = RequestMethod.DELETE)
//    @ResponseBody
//    public Msg deleteA(@PathVariable("ids")String ids){
//        if(ids.contains("-")){
//            List<Integer> del_ids = new ArrayList<>();
//            String[] str_ids = ids.split("-");
//            for(String string : str_ids){
//                del_ids.add(Integer.parseInt(string));
//            }
//            showQService.deleteBatch(del_ids);
//        }else {
//            Integer id = Integer.parseInt(ids);
//            showQService.deleteA(id);
//        }
//        return Msg.success();
//    }
//
//    @RequestMapping(value = "/A/{AId}", method = RequestMethod.PUT)
//    @ResponseBody
//    public Msg saveA(ShowQ showQ) {
//        showQService.updateA(showQ);
//        return Msg.success();
//    }
//

//
//    @ResponseBody
//    @RequestMapping("/checkuser")
//    public Msg checkuser(@RequestParam("AName") String AName) {
//
//        String regex = "(^[A-Za-z0-9]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
//        if (!AName.matches(regex)) {
//            return Msg.fail().add("va_msg", "名字必须是2-5个中文或者6-16位英文数字组合");
//        }
//
//        boolean b = showQService.checkUser(AName);
//        if (b) {
//            return Msg.success();
//        } else {
//            return Msg.fail().add("va_msg", "用户名被占用");
//        }
//    }
//
//    @RequestMapping(value = "/A", method = RequestMethod.POST)
//    @ResponseBody
//    public Msg saveA(@Valid ShowQ showQ, BindingResult result) {
//        if (result.hasErrors()) {
//            Map<String, Object> map = new HashMap<>();
//            List<FieldError> errors = result.getFieldErrors();
//            for (FieldError fieldError : errors) {
//                map.put(fieldError.getField(), fieldError.getDefaultMessage());
//            }
//            return Msg.fail().add("errorFields", map);
//        } else {
//            showQService.saveA(showQ);
//            return Msg.success();
//        }
//    }


//    /**
//     * 新的方法 with json
//     *
//     * @param pn
//     * @return
//     */
//    @RequestMapping("/As")
//    @ResponseBody
//    public Msg getAsWithJson(
//            @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
//        PageHelper.startPage(pn, 5);
//        List<ShowQ> As = showQService.getAll();
//        PageInfo pageInfo = new PageInfo(As, 5);
//
//        return Msg.success().add("pageInfo", pageInfo);
//    }

    @RequestMapping(value = "/questions/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getQuestionsWithJsonById(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @PathVariable("id") Integer id) {
        PageHelper.startPage(pn, 5);
        List<ShowQ> Qs = showQService.getAuthorAll(id);
        PageInfo pageInfo = new PageInfo(Qs, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getQuestions(@PathVariable("id") Integer id) {
        ShowQ showQ = showQService.getQ(id);
        return Msg.success().add("A", showQ);
    }

    @RequestMapping(value = "/question/{AId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveQuestion(ShowQ showQ) {
        showQService.updateQ(showQ);
        return Msg.success();
    }

}
