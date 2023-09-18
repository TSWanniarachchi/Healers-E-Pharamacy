using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALCustomer
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveCustomerData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_Customer");
        }

        public DataSet RetrieveActiveDistrict()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_District");
        }

        public void BeginTransaction()
        {
            objDALCommon.BeginTransaction();
        }

        public void CommitTransaction()
        {
            objDALCommon.CommitTransaction();
        }

        public void RollbackTransaction()
        {
            objDALCommon.RollbackTransaction();
        }

        public int InsertCustomerData(string name, string address, int districtId, string nicNo, bool gender, string mobileNo, string email, string userId)
        {
            SqlParameter[] Parameters = new SqlParameter[8];

            Parameters[0] = new SqlParameter("Name", name);
            Parameters[1] = new SqlParameter("Address", address);
            Parameters[2] = new SqlParameter("DistrictId", districtId);
            Parameters[3] = new SqlParameter("NICNo", nicNo);
            Parameters[4] = new SqlParameter("Gender", gender);
            Parameters[5] = new SqlParameter("MobileNo", mobileNo);
            Parameters[6] = new SqlParameter("Email", email);
            Parameters[7] = new SqlParameter("UserID", userId);

            return objDALCommon.ExecuteProcedure("spINS_Customer", CommandType.StoredProcedure, Parameters);
        }

        public int InsertSysUserSecurityData(string userId, string password)
        {
            SqlParameter[] Parameters = new SqlParameter[2];

            Parameters[0] = new SqlParameter("UserId", userId);
            Parameters[1] = new SqlParameter("Password", password);

            return objDALCommon.ExecuteProcedure("spINS_SysUserSecurity", CommandType.StoredProcedure, Parameters);

        }
    }
}
