using NotificationCenter.BusinessLogic;
using NotificationCenter.Data.Interfaces;
using NotificationCenter.Data.Model;
using NotificationCenter.Data.Conrtext;
using NotificationCenter.DTO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using NotificationCenter.BusinessLogic.Enum;

namespace NotificationCenter.Data.Repositories
{
    public class CompanyRepository : ICompanyRepository
    {
        private NotificationCenterContext dbContext;

        public CompanyRepository(NotificationCenterContext db)
        {
            dbContext = db;
        }


        public List<CompanyDTO> GetAllCompanies()
        {
            var result = new List<CompanyDTO>();

            var companies = this.dbContext.Companies.ToList();
            foreach (var item in companies) 
                result.Add(new CompanyDTO { Id = item.Id, Name = item.Name, Number = item.Number, Market = item.Market, Type = item.Type });

            return result;
        }

        public CompanyDTO GetCompany(Guid Id)
        {
            var company = this.dbContext.Companies.FirstOrDefault(x => x.Id == Id);
            if (company != null)
                return new CompanyDTO { Id = company.Id, Name = company.Name, Number = company.Number, Market = company.Market, Type = company.Type };

            return null;
        }
    }
}
