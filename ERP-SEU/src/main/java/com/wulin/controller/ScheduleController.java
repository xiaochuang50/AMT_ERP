package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Schedule;
import com.wulin.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ScheduleController {

    @Autowired
    private ScheduleService scheduleService;

    @RequestMapping("schedule")
    public String scheduleManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addSchedule")
    public String addSchedule(Schedule schedule, Model model){
        scheduleService.addSchedule(schedule);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<Schedule> schedules = scheduleService.findAllSchedule();
        PageInfo pageInfo = new PageInfo(schedules,5);
        model.addAttribute("pageInfo",pageInfo);
        return "schedule_management";
    }
}
