using ECOMDAL;
using System.Data;

namespace ECOMBLL
{
    public class BLLCompany
    {
        DALCompany objDALCompany = new DALCompany();

        public DataSet RetrieveCompanyData()
        {
            return objDALCompany.RetrieveCompanyData();
        }

        public DataSet RetrieveCompanyData(int companyId)
        {
            return objDALCompany.RetrieveCompanyData(companyId);
        }

        public int InsertCompanyData(string name, string address, string contactNo, string email, string description, byte[] logo, string footer, bool isActive, string userId)
        {
            return objDALCompany.InsertCompanyData(name, address, contactNo, email, description, logo, footer, isActive, userId);
        }

        public int UpdateCompanyData(int companyId, string name, string address, string contactNo, string email, string description, byte[] logo, bool isChangeLogo, string footer, bool isActive, string userId)
        {
            //Cryptography objCryptography = new Cryptography();
            //userId = objCryptography.EncryptString(userId);

            return objDALCompany.UpdateCompanyData(companyId, name, address, contactNo, email, description, logo, isChangeLogo, footer, isActive, userId);
        }

        public int DeleteCompanyData(int companyId)
        {
            return objDALCompany.DeleteCompanyData(companyId);
        }
    }
}
