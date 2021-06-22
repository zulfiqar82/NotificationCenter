using System;
using System.Collections.Generic;

namespace NotificationCenter.BusinessLogic.Interfaces
{
    public interface IBusinessRule
    {
        List<int> Interval { get; }

        List<DateTime> GetScheduleNotification(DateTime currentDate);
    }
}
