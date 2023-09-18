using ECOMDAL;
using System.Data;

namespace ECOMBLL
{
    public class BLLCustomer
    {
        DALCustomer objDALCustomer = new DALCustomer();

        public DataSet RetrieveCustomerData()
        {
            return objDALCustomer.RetrieveCustomerData();
        }

        public DataSet RetrieveActiveDistrict()
        {
            return objDALCustomer.RetrieveActiveDistrict();
        }

        public void BeginTransaction()
        {
            objDALCustomer.BeginTransaction();
        }

        public void CommitTransaction()
        {
            objDALCustomer.CommitTransaction();
        }

        public void RollbackTransaction()
        {
            objDALCustomer.RollbackTransaction();
        }

        public int InsertCustomerData(string name, string address, int districtId, string nicNo, bool gender, string mobileNo, string email, string userId)
        {
            return objDALCustomer.InsertCustomerData(name, address, districtId, nicNo, gender, mobileNo, email, userId);
        }

        public int InsertSysUserSecurityData(string userId, string password)
        {
            Cryptography objCryptography = new Cryptography();
            password = objCryptography.EncryptString(password);

            return objDALCustomer.InsertSysUserSecurityData(userId, password);
        }
    }
}
