using System;
using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALCompany
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveCompanyData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_Company");
        }

        public DataSet RetrieveCompanyData(int companyId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("CompanyID", companyId);

            return objDALCommon.ExecuteProcedure_select("spSEL_CompanyByID", Parameters);
        }

        public int InsertCompanyData(string name, string address, string contactNo, string email, string description, byte[] logo, string footer, bool isActive, string userId)
        {
            SqlParameter[] Parameters = new SqlParameter[9];

            Parameters[0] = new SqlParameter("Name", name);
            Parameters[1] = new SqlParameter("Address", address);
            Parameters[2] = new SqlParameter("ContactNo", contactNo);
            Parameters[3] = new SqlParameter("Email", email);
            Parameters[4] = new SqlParameter("Description", description);
            Parameters[5] = new SqlParameter("Logo", logo);
            Parameters[6] = new SqlParameter("Footer", footer);
            Parameters[7] = new SqlParameter("IsActive", isActive);
            Parameters[8] = new SqlParameter("UserID", userId);

            return objDALCommon.ExecuteProcedure("spINS_Company", CommandType.StoredProcedure, Parameters);
        }

        public int UpdateCompanyData(int companyId, string name, string address, string contactNo, string email, string description, byte[] logo, bool isChangeLogo, string footer, bool isActive, string userId)
        {
            SqlParameter[] Parameters = new SqlParameter[11];

            Parameters[0] = new SqlParameter("CompanyID", companyId);
            Parameters[1] = new SqlParameter("Name", name);
            Parameters[2] = new SqlParameter("Address", address);
            Parameters[3] = new SqlParameter("ContactNo", contactNo);
            Parameters[4] = new SqlParameter("Email", email);
            Parameters[5] = new SqlParameter("Description", description);
            Parameters[6] = new SqlParameter("Logo", logo);
            Parameters[7] = new SqlParameter("IsChangeLogo", isChangeLogo);
            Parameters[8] = new SqlParameter("Footer", footer);
            Parameters[9] = new SqlParameter("IsActive", isActive);
            Parameters[10] = new SqlParameter("UserID", userId);

            return objDALCommon.ExecuteProcedure("spUPD_Company", CommandType.StoredProcedure, Parameters);
        }

        public int DeleteCompanyData(int companyId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("CompanyID", companyId);

            return objDALCommon.ExecuteProcedure("spDEL_Company", CommandType.StoredProcedure, Parameters);
        }
    }
}