using NotificationCenter.BusinessLogic.Interfaces;
using System.Collections.Generic;

namespace NotificationCenter.BusinessLogic.MarketRules
{
    public class SwedenRule : BusinessRule, IBusinessRule
    {
        public override List<int> Interval => new List<int>() { 1, 7, 14, 28 };
    }
}
