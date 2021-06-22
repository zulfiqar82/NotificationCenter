using NotificationCenter.BusinessLogic.Interfaces;
using System.Collections.Generic;

namespace NotificationCenter.BusinessLogic.MarketRules
{
    public class NorwayRule : BusinessRule, IBusinessRule
    {
        public override List<int> Interval => new List<int>() { 1, 5, 10, 20 };
    }
}
