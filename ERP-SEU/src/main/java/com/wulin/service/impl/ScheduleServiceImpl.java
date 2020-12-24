package com.wulin.service.impl;

import com.wulin.bean.Schedule;
import com.wulin.dao.ScheduleMapper;
import com.wulin.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Override
    public List<Schedule> findAllSchedule() {
        return scheduleMapper.findAllSchedule();
    }

    @Override
    public void addSchedule(Schedule schedule) {
        scheduleMapper.addSchedule(schedule);
    }
}
