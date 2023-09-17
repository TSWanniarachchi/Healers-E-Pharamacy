using ECOMDAL;
using System;
using System.Data;

namespace ECOMBLL
{
    public class BALAdminMaster
    {
        DALAdminMaster objDALAdminMaster = new DALAdminMaster();

        public DataSet NavigationPageDataCount(DateTime fromDate, DateTime toDate)
        {
            return objDALAdminMaster.NavigationPageDataCount(fromDate, toDate);
        }
    }
}
