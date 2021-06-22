using NotificationCenter.DTO;
using System;

namespace NotificationCenter.Data.Interfaces
{
    public interface IScheduleRepository
    {
        ScheduleNotificationDTO CreateSchedule(Guid Id, DateTime CreatedDate);
    }
}
