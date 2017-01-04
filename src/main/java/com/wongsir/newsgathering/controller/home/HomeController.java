package com.wongsir.newsgathering.controller.home;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wongsir.newsgathering.controller.BaseController;

/** 
* @Description: TODO
* @author Wongsir
* @date 2017年1月4日
*  
*/
@Controller
@RequestMapping("/")
public class HomeController extends BaseController {
    private final static Logger LOG = LogManager.getLogger(HomeController.class);

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public ModelAndView home() {
        return new ModelAndView("panel/welcome/welcome");
    }

}

