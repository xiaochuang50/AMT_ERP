package com.wulin.service;

import com.wulin.bean.Schedule;

import java.util.List;

public interface ScheduleService {

    List<Schedule> findAllSchedule();

    void addSchedule(Schedule schedule);
}
