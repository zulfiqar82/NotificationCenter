using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NotificationCenter.Data.Interfaces;
using NotificationCenter.Data.Conrtext;
using NotificationCenter.Data.Repositories;
using NotificationCenter.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NotificationCenter.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : ControllerBase
    {
        private ICompanyRepository companies;

        public CompanyController(ICompanyRepository companyRepository)
        {
            companies = companyRepository;
        }

        [HttpGet]
        public ActionResult<IEnumerable<CompanyDTO>> GetAllCompanies()
        {
            return companies.GetAllCompanies();
        }

        [HttpGet("{Id}")]
        public ActionResult<CompanyDTO> GetCompany(Guid Id)
        {
            var company = companies.GetCompany(Id);

            if (company == null) return NotFound();
            
            return company;
        }
    }
}
