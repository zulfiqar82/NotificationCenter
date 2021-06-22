using Microsoft.EntityFrameworkCore;
using NotificationCenter.Data.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NotificationCenter.Data.Conrtext
{
    public class NotificationCenterContext : DbContext
    {
        public NotificationCenterContext(DbContextOptions<NotificationCenterContext> options) : base(options)
        {

        }

        public DbSet<Company> Companies { get; set; }
        public DbSet<Schedule> Schedules { get; set; }
        public DbSet<ScheduleNotification> ScheduleNotifications { get; set; }
    }
}
