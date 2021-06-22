using NotificationCenter.BusinessLogic.Enum;
using NotificationCenter.BusinessLogic.Interfaces;
using NotificationCenter.BusinessLogic.MarketRules;
using System;
using System.Collections.Generic;

namespace NotificationCenter.BusinessLogic
{
    public class NotifcationFactory
    {
        public static List<DateTime> GetScheduleNotificationDate(Market market, CompanyType companyType, DateTime currentDateTime)
        {
            IBusinessRule rule = null;

            switch (market)
            {
                case Market.DENMARK:
                    rule = new DenmarkRule();
                    break;
                case Market.NORWAY:
                    rule = new NorwayRule();
                    break;
                case Market.SWEDEN:
                    rule = new SwedenRule();
                    break;
                case Market.FINLAND:
                    rule = new FinlandRule();
                    break;
            }

            return rule != null ? rule.GetScheduleNotification(currentDateTime) : new List<DateTime>();
        }
    }
}
