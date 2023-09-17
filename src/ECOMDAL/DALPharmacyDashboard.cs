using System;
using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALPharmacyDashboard
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrievePharamacyDashbordData(DateTime fromDate, DateTime toDate)
        {
            SqlParameter[] Parameters = new SqlParameter[2];

            Parameters[0] = new SqlParameter("FromDate", fromDate);
            Parameters[1] = new SqlParameter("ToDate", toDate);

            return objDALCommon.ExecuteProcedure_select("spSEL_PharmacyDashboard", Parameters);
        }
    }
}
