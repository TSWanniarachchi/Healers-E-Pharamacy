using ECOMDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECOMBLL
{
    public class BLLSystemUserLogin
    {
        DALSystemUserLogin objDALSystemUserLogin = new DALSystemUserLogin();

        public DataSet RetrieveSystemUserLoginDetails(string username)
        {
            return objDALSystemUserLogin.RetrieveSystemUserLoginDetails(username);
        }
    }
}
