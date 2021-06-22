using NotificationCenter.BusinessLogic.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NotificationCenter.BusinessLogic.MarketRules
{
    public abstract class BusinessRule : IBusinessRule
    {
        public abstract List<int> Interval { get; }

        public List<DateTime> GetScheduleNotification(DateTime currentDate)
        {
            var result = new List<DateTime>();

            foreach (var item in Interval)
            {
                result.Add(currentDate.AddDays(item));
            }

            return result;
        }
    }
}
