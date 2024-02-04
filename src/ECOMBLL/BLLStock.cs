using ECOMDAL;
using System.Data;

namespace ECOMBLL
{
    public class BLLStock
    {
        DALStock objDALStock = new DALStock();

        public DataSet RetrieveStockDetails()
        {
            return objDALStock.RetrieveStockDetails();
        }

        public DataSet RetrieveStockDetailsByProduct(string proid, string itmid)
        {
            return objDALStock.RetrieveStockDetailsByProduct(proid,itmid);
        }
        public DataSet RetrieveStockDetailsByItem(string proid, string itmid)
        {
            return objDALStock.RetrieveStockDetailsByItem(proid, itmid);
        }
    }
}
