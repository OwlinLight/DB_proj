package pers.shayz.crud.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pers.shayz.crud.bean.ShowPaper;
import pers.shayz.crud.bean.Msg;
import pers.shayz.crud.service.ShowPaperService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ZhouXiaoyu
 */
@Controller
public class PaperController {

    @Autowired
    ShowPaperService showPaperService;
//
//    @RequestMapping(value = "/paper/{ids}", method = RequestMethod.DELETE)
//    @ResponseBody
//    public Msg deletePaper(@PathVariable("ids")String ids){
//        if(ids.contains("-")){
//            List<Integer> del_ids = new ArrayList<>();
//            String[] str_ids = ids.split("-");
//            for(String string : str_ids){
//                del_ids.add(Integer.parseInt(string));
//            }
//            showPaperService.deleteBatch(del_ids);
//        }else {
//            Integer id = Integer.parseInt(ids);
//            showPaperService.deletePaper(id);
//        }
//        return Msg.success();
//    }
//
//    @RequestMapping(value = "/paper/{paperId}", method = RequestMethod.PUT)
//    @ResponseBody
//    public Msg savePaper(ShowPaper showPaper) {
//        showPaperService.updatePaper(showPaper);
//        return Msg.success();
//    }
//
//    @RequestMapping(value = "/paper/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Msg getPaper(@PathVariable("id") Integer id) {
//        ShowPaper showPaper = showPaperService.getPaper(id);
//        return Msg.success().add("paper", showPaper);
//    }
//
//    @ResponseBody
//    @RequestMapping("/checkuser")
//    public Msg checkuser(@RequestParam("paperName") String paperName) {
//
//        String regex = "(^[A-Za-z0-9]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
//        if (!paperName.matches(regex)) {
//            return Msg.fail().add("va_msg", "名字必须是2-5个中文或者6-16位英文数字组合");
//        }
//
//        boolean b = showPaperService.checkUser(paperName);
//        if (b) {
//            return Msg.success();
//        } else {
//            return Msg.fail().add("va_msg", "用户名被占用");
//        }
//    }
//
//    @RequestMapping(value = "/paper", method = RequestMethod.POST)
//    @ResponseBody
//    public Msg savePaper(@Valid ShowPaper showPaper, BindingResult result) {
//        if (result.hasErrors()) {
//            Map<String, Object> map = new HashMap<>();
//            List<FieldError> errors = result.getFieldErrors();
//            for (FieldError fieldError : errors) {
//                map.put(fieldError.getField(), fieldError.getDefaultMessage());
//            }
//            return Msg.fail().add("errorFields", map);
//        } else {
//            showPaperService.savePaper(showPaper);
//            return Msg.success();
//        }
//    }


    /**
     * 新的方法 with json
     *
     * @param pn
     * @return
     */
    @RequestMapping("/papers")
    @ResponseBody
    public Msg getPapersWithJson(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<ShowPaper> papers = showPaperService.getAll();
        PageInfo pageInfo = new PageInfo(papers, 5);

        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getPapersWithJsonById(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @PathVariable("id") Integer id) {
        PageHelper.startPage(pn, 5);
        List<ShowPaper> papers = showPaperService.getAuthorAll(id);
        PageInfo pageInfo = new PageInfo(papers, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
