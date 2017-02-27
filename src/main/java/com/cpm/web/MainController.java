package com.cpm.web;

import com.cpm.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

    @Autowired
    private HistoryService historyService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(ModelAndView model) {
        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public ModelAndView history(ModelAndView model) {
        model.addObject("historys", historyService.findAll());
        model.setViewName("history");
        return model;
    }

    @RequestMapping(value = "/compare", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> compare(MultipartHttpServletRequest multipartHttpServletRequest) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            String materialMaster = multipartHttpServletRequest.getParameter("materialMaster");
            String materialCompare = multipartHttpServletRequest.getParameter("materialCompare");
            String partNumber = multipartHttpServletRequest.getParameter("partNumber");
            String batch = multipartHttpServletRequest.getParameter("batch");
            if(materialCompare.equals(materialMaster)) {
                String mcp = historyService.create(materialMaster, materialCompare, partNumber, batch);
                return new ResponseEntity<String>("{\"process\":\"pass\", \"mcp\":\"" + mcp + "\"}", headers, HttpStatus.OK);
            } else {
                return new ResponseEntity<String>("{\"process\":\"fail\"}", headers, HttpStatus.OK);
            }
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"process\":\"error\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
