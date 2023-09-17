using ECOMDAL;
using System;
using System.Data;

namespace ECOMBLL
{
    public class BLLPharmacyDashboard
    {
        DALPharmacyDashboard objDALPharmacyDashboard = new DALPharmacyDashboard();

        public DataSet RetrievePharamacyDashbordData(DateTime fromDate, DateTime toDate)
        {
            return objDALPharmacyDashboard.RetrievePharamacyDashbordData(fromDate, toDate);
        }
    }
}
