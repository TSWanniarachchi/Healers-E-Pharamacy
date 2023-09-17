using System.Data;

namespace ECOMDAL
{
    public class DALCommonFunction
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet GetServerDateTime()
        {
            return objDALCommon.ReturnDataSet("SELECT GETDATE() AS ServerDateTime;");
        }

        public DataSet GetComboActiveItemCategory()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, Name FROM ItemCategory WHERE ID IN(1, 4, 6, 7, 12) AND IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetComboActiveItemType()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, Name FROM ItemType WHERE ID IN(1, 2, 3, 4) AND IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetComboActiveItem()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, NAME FROM ItemMaster WHERE IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetComboActiveItemByCategory(int itemCategoryId)
        {
            return objDALCommon.ReturnDataSet("SELECT ID, NAME FROM ItemMaster WHERE ItemCategoryID = '" + itemCategoryId + "' AND IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetComboActiveItemByType(int itemTypeId)
        {
            return objDALCommon.ReturnDataSet("SELECT ID, NAME FROM ItemMaster WHERE ItemTypeID = '" + itemTypeId + "' AND IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetComboActiveItem(int itemCategoryId, int itemTypeId)
        {
            return objDALCommon.ReturnDataSet("SELECT ID, NAME FROM ItemMaster WHERE ItemCategoryID = '" + itemCategoryId + "' AND ItemTypeID = '" + itemTypeId + "' AND IsActive = 1 ORDER BY Name;");
        }

        public DataSet GetItemAvailableQuantity(int itemMasterId)
        {
            return objDALCommon.ReturnDataSet("SELECT ISNULL(Quntity, 0) Quntity FROM ItemMaster WHERE ID = '" + itemMasterId + "'; ");
        }

        public DataSet GetItemPrice(int itemMasterId)
        {
            return objDALCommon.ReturnDataSet("SELECT Name, ISNULL(CONVERT(decimal(18,4), UnitPrice/StdVolume), 0) AS UnitPrice, ISNULL(CONVERT(decimal(18,4), MarkPrice/StdVolume), 0) AS UnitMarkPrice, ISNULL(CONVERT(decimal(18,4), DiscountPrice/StdVolume), 0) AS UnitDiscountPrice FROM ItemMaster WHERE ID = " + itemMasterId + ";");
        }

        public DataSet GetComboOrderRejectReason()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, Description FROM OrderRejectReason WHERE IsActive = 1 ORDER BY Description;");
        }

        public DataSet GetComboActiveProductCategory()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, Name FROM ItemCategory");
        }
        public DataSet GetComboActiveProItems(int ProductCategoryID)
        {
            return objDALCommon.ReturnDataSet("SELECT ID, NAME FROM ItemType WHERE ID = '" + ProductCategoryID + "' AND IsActive = 1;");
        }
        public DataSet GetComboActiveItemsSet()
        {
            return objDALCommon.ReturnDataSet("SELECT ID, Name FROM ItemType");
        }
    }
}
