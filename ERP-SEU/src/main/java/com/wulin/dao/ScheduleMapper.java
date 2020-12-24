package com.wulin.dao;

import com.wulin.bean.Schedule;

import java.util.List;

public interface ScheduleMapper {
    List<Schedule> findAllSchedule();

    void addSchedule(Schedule schedule);
}
