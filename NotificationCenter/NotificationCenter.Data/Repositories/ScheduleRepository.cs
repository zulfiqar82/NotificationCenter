using NotificationCenter.BusinessLogic;
using NotificationCenter.BusinessLogic.Enum;
using NotificationCenter.Data.Conrtext;
using NotificationCenter.Data.Interfaces;
using NotificationCenter.Data.Model;
using NotificationCenter.DTO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
namespace NotificationCenter.Data.Repositories
{
    public class ScheduleRepository : IScheduleRepository
    {
        private NotificationCenterContext dbContext;

        public ScheduleRepository(NotificationCenterContext db)
        {
            dbContext = db;
        }

        public ScheduleNotificationDTO CreateSchedule(Guid Id, DateTime CreatedDate)
        {
            var result = new ScheduleNotificationDTO();
            var company = dbContext.Companies.FirstOrDefault(x => x.Id == Id);
            result.CompanyId = company.Id;
            result.Notification = new List<string>();

            var schedule = dbContext.Schedules.FirstOrDefault(obj => obj.CompanyId == company.Id);
            if (schedule == null || schedule.CreateDate.ToShortDateString() != CreatedDate.ToShortDateString())
            {
                var scheduleId = Guid.NewGuid();
                dbContext.Schedules.Add(new Schedule() { Id = scheduleId, CompanyId = company.Id, CreateDate = CreatedDate });

                var market = (Market)Enum.Parse(typeof(Market), company.Market.Trim().ToUpper());
                var companyType = (CompanyType)Enum.Parse(typeof(CompanyType), company.Type.Trim().ToUpper());

                var scheduleDate = NotifcationFactory.GetScheduleNotificationDate(market, companyType, CreatedDate);
                if (scheduleDate.Count > 0)
                {
                    foreach (var sendDate in scheduleDate)
                    {
                        dbContext.ScheduleNotifications.Add(new ScheduleNotification() { Id = Guid.NewGuid(), ScheduleId = scheduleId, SendDate = sendDate });
                        result.Notification.Add(sendDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));
                    }
                    dbContext.SaveChanges();
                }
            }
            else
            {
                var notifications = dbContext.ScheduleNotifications.Where(obj => obj.ScheduleId == schedule.Id);
                foreach (var item in notifications)
                {
                    result.Notification.Add(item.SendDate.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));
                }
            }


            return result;
        }
    }
}
