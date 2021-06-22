using System;

namespace NotificationCenter.Data.Model
{
    public class ScheduleNotification
    {
        public Guid Id { get; set; }
        public Guid ScheduleId { get; set; }
        public DateTime SendDate { get; set; }

        public Schedule Schedule { get; }
    }
}
