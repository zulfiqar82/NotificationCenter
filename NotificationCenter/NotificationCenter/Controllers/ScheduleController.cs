using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NotificationCenter.Data.Interfaces;
using NotificationCenter.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NotificationCenter.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleController : ControllerBase
    {
        private ICompanyRepository companies;
        private IScheduleRepository schedules;

        public ScheduleController(ICompanyRepository companyRepository, IScheduleRepository schduleRepository)
        {
            companies = companyRepository;
            schedules = schduleRepository;
        }

        [HttpGet("{Id}")]
        public ActionResult<ScheduleNotificationDTO> GetSchedule(Guid Id, DateTime? schduleCreationDate)
        {
            var company = companies.GetCompany(Id);

            if (company == null) return NotFound();


            return schedules.CreateSchedule(Id, schduleCreationDate ?? DateTime.Now);
        }
    }
}
