using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALStock
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveStockDetails()
        {
            return objDALCommon.ReturnDataSet("select top(13) a.ID as StID,a.Name,c.Name as ProName,b.Name as CatName,a.Quntity,a.UnitPrice,a.MarkPrice,a.DiscountPrice,a.StdLength,a.StdWeight,a.StdVolume,a.ManufacturedDate,a.ExpirationDate from ItemMaster a,ItemType b,ItemCategory c where b.ID=a.ItemTypeId and c.ID=a.ItemCategoryID and a.IsActive='1' order by a.Name");
        }

        public DataSet RetrieveStockDetailsByProduct(string proid, string itmid)
        {
            return objDALCommon.ReturnDataSet("select a.ID as StID,a.Name,c.Name as ProName,b.Name as CatName,a.Quntity,a.UnitPrice,a.MarkPrice,a.DiscountPrice,a.StdLength,a.StdWeight,a.StdVolume,a.ManufacturedDate,a.ExpirationDate from ItemMaster a,ItemType b,ItemCategory c where b.ID=a.ItemTypeId and c.ID=a.ItemCategoryID and a.ItemCategoryID like '" + proid + "' and a.ItemTypeId like '" + itmid + "' and a.IsActive='1' order by a.Name");     
        }
        public DataSet RetrieveStockDetailsByItem(string proid, string itmid)
        {
            return objDALCommon.ReturnDataSet("select a.ID as StID,a.Name,c.Name as ProName,b.Name as CatName,a.Quntity,a.UnitPrice,a.MarkPrice,a.DiscountPrice,a.StdLength,a.StdWeight,a.StdVolume,a.ManufacturedDate,a.ExpirationDate from ItemMaster a,ItemType b,ItemCategory c where b.ID=a.ItemTypeId and c.ID=a.ItemCategoryID and a.ItemCategoryID like '" + proid + "' and a.ItemTypeId like '" + itmid + "' and a.IsActive='1' order by a.Name");          
        }

    }
}
