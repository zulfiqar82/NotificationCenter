using System;
using System.Collections.Generic;

namespace NotificationCenter.DTO
{
    public class ScheduleNotificationDTO
    {
        public Guid CompanyId { get; set; }
        public List<string> Notification { get; set; }
    }
}
