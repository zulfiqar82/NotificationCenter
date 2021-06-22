using System;
using System.Collections.Generic;

namespace NotificationCenter.Data.Model
{
    public class Schedule
    {
        public Guid Id { get; set; }
        public Guid CompanyId { get; set; }
        public DateTime CreateDate { get; set; }

        public Company Company { get; }
        public IEnumerable<ScheduleNotification> ScheduleNotifications { get; set; }
    }
}
