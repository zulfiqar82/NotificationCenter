using System;
using System.Collections.Generic;

namespace NotificationCenter.Data.Model
{
    public class Company
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public int Number { get; set; }
        public string Type { get; set; }
        public string Market { get; set; }

        public IEnumerable<Schedule> schedules { get; set; }
    }
}
