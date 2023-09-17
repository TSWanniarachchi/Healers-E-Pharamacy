using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECOMDAL
{
    public class DALSystemUserLogin
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveSystemUserLoginDetails(string username)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("UserID", username);

            return objDALCommon.ExecuteProcedure_select("spSEL_SysUserSecurity", Parameters);
        }
    }
}
