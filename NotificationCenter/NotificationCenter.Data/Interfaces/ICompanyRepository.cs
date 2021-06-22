using NotificationCenter.Data.Model;
using NotificationCenter.Data.Conrtext;
using NotificationCenter.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NotificationCenter.Data.Interfaces
{
    public interface ICompanyRepository
    {
        List<CompanyDTO> GetAllCompanies();
        CompanyDTO GetCompany(Guid Id);

    }
}
