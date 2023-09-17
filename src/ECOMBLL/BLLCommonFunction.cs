using ECOMDAL;
using System.Data;

namespace ECOMBLL
{
    public class BLLCommonFunction
    {
        DALCommonFunction objDALCommonFunction = new DALCommonFunction();

        public DataSet GetServerDateTime()
        {
            return objDALCommonFunction.GetServerDateTime();
        }

        public DataSet GetComboActiveItemCategory()
        {
            return objDALCommonFunction.GetComboActiveItemCategory();
        }

        public DataSet GetComboActiveItemType()
        {
            return objDALCommonFunction.GetComboActiveItemType();
        }

        public DataSet GetComboActiveItem()
        {
            return objDALCommonFunction.GetComboActiveItem();
        }

        public DataSet GetComboActiveItemByCategory(int itemCategoryId)
        {
            return objDALCommonFunction.GetComboActiveItemByCategory(itemCategoryId);
        }

        public DataSet GetComboActiveItemByType(int itemTypeId)
        {
            return objDALCommonFunction.GetComboActiveItemByType(itemTypeId);
        }

        public DataSet GetComboActiveItem(int itemCategoryId, int itemTypeId)
        {
            if (itemCategoryId == 0 && itemTypeId == 0)
                return objDALCommonFunction.GetComboActiveItem();
            else if (itemCategoryId != 0 && itemTypeId == 0)
                return objDALCommonFunction.GetComboActiveItemByCategory(itemCategoryId);
            else if (itemCategoryId == 0 && itemTypeId != 0)
                return objDALCommonFunction.GetComboActiveItemByType(itemTypeId);
            else
                return objDALCommonFunction.GetComboActiveItem(itemCategoryId, itemTypeId);
        }

        public DataSet GetItemAvailableQuantity(int itemMasterId)
        {
            return objDALCommonFunction.GetItemAvailableQuantity(itemMasterId);
        }

        public DataSet GetItemPrice(int itemMasterId)
        {
            return objDALCommonFunction.GetItemPrice(itemMasterId);
        }

        public DataSet GetComboOrderRejectReason()
        {
            return objDALCommonFunction.GetComboOrderRejectReason();
        }

        public DataSet GetComboActiveProductCategory()
        {
            return objDALCommonFunction.GetComboActiveProductCategory();
        }
        public DataSet GetComboActiveProItems(int ProductCategoryID)
        {
            return objDALCommonFunction.GetComboActiveProItems(ProductCategoryID);
        }
        public DataSet GetComboActiveItemsSet()
        {
            return objDALCommonFunction.GetComboActiveItemsSet();
        }
    }
}