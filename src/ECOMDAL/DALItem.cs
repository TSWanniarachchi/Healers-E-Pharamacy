using System;
using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALItem
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveItemData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_Item");
        }

        public DataSet RetrieveItemData(int ItemId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("ItemId", ItemId);

            return objDALCommon.ExecuteProcedure_select("spSEL_ItemById", Parameters);
        }

        public int InsertItemMasterData(string name, string searchdescription, int itemtypeid, int itemmanufactorecoporationid,
            int itemcategory, string remark, int quntity, double unitprice, double markprice, double discountprice, double stdlengh,
            double stdweight, double stdvolume, DateTime manufatoreddate, DateTime expirationdate, int minorderqty, bool issellable,
            bool isordering, bool isreturnable, byte[] itmeimage, bool isactive, bool isdelete, string createby, DateTime createdatetime)
        {
            SqlParameter[] Parameters = new SqlParameter[24];

            Parameters[0] = new SqlParameter("Name", name);
            Parameters[1] = new SqlParameter("SearchDescription", searchdescription);
            Parameters[2] = new SqlParameter("ItemTypeId", itemtypeid);
            Parameters[3] = new SqlParameter("ItemManufacturingCorporationId", itemmanufactorecoporationid);
            Parameters[4] = new SqlParameter("ItemCategoryId", itemcategory);
            Parameters[5] = new SqlParameter("Remark", remark);
            Parameters[6] = new SqlParameter("Quntity", quntity);
            Parameters[7] = new SqlParameter("UnitPrice", unitprice);
            Parameters[8] = new SqlParameter("MarkPrice", markprice);
            Parameters[9] = new SqlParameter("DiscountPrice", discountprice);
            Parameters[10] = new SqlParameter("StdLength", stdlengh);
            Parameters[11] = new SqlParameter("StdWeight", stdweight);
            Parameters[12] = new SqlParameter("StdVolume", stdvolume);
            Parameters[13] = new SqlParameter("ManufacturedDate", manufatoreddate);
            Parameters[14] = new SqlParameter("ExpirationDate", expirationdate);
            Parameters[15] = new SqlParameter("MinOrderQty", minorderqty);
            Parameters[16] = new SqlParameter("IsSellable", issellable);
            Parameters[17] = new SqlParameter("IsOderning", isordering);
            Parameters[18] = new SqlParameter("IsReturnable", isreturnable);
            Parameters[19] = new SqlParameter("ItemImage", itmeimage);
            Parameters[20] = new SqlParameter("IsActive", isactive);
            Parameters[21] = new SqlParameter("IsDelete", isdelete);
            Parameters[22] = new SqlParameter("CreatedBy", createby);
            Parameters[23] = new SqlParameter("CreatedDateTime", createdatetime);

            return objDALCommon.ExecuteProcedure("spINS_ItemMaster", CommandType.StoredProcedure, Parameters);
        }

        public int UpdateItemMasterData(int itemid, string name, string searchdescription, int itemtypeid, int itemmanufactorecoporationid,
            int itemcategory, string remark, int quntity, double unitprice, double markprice, double discountprice, double stdlengh,
            double stdweight, double stdvolume, DateTime manufatoreddate, DateTime expirationdate, int minorderqty, bool issellable,
            bool isordering, bool isreturnable, byte[] itmeimage, bool isactive, bool isdelete, string modifiedby, DateTime modifieddatetime)
        {
            SqlParameter[] Parameters = new SqlParameter[25];

            Parameters[0] = new SqlParameter("ItemID", itemid);
            Parameters[1] = new SqlParameter("Name", name);
            Parameters[2] = new SqlParameter("SearchDescription", searchdescription);
            Parameters[3] = new SqlParameter("ItemTypeId", itemtypeid);
            Parameters[4] = new SqlParameter("ItemManufacturingCorporationId", itemmanufactorecoporationid);
            Parameters[5] = new SqlParameter("ItemCategoryId", itemcategory);
            Parameters[6] = new SqlParameter("Remark", remark);
            Parameters[7] = new SqlParameter("Quntity", quntity);
            Parameters[8] = new SqlParameter("UnitPrice", unitprice);
            Parameters[9] = new SqlParameter("MarkPrice", markprice);
            Parameters[10] = new SqlParameter("DiscountPrice", discountprice);
            Parameters[11] = new SqlParameter("StdLength", stdlengh);
            Parameters[12] = new SqlParameter("StdWeight", stdweight);
            Parameters[13] = new SqlParameter("StdVolume", stdvolume);
            Parameters[14] = new SqlParameter("ManufacturedDate", manufatoreddate);
            Parameters[15] = new SqlParameter("ExpirationDate", expirationdate);
            Parameters[16] = new SqlParameter("MinOrderQty", minorderqty);
            Parameters[17] = new SqlParameter("IsSellable", issellable);
            Parameters[18] = new SqlParameter("IsOderning", isordering);
            Parameters[19] = new SqlParameter("IsReturnable", isreturnable);
            Parameters[20] = new SqlParameter("ItemImage", itmeimage);
            Parameters[21] = new SqlParameter("IsActive", isactive);
            Parameters[22] = new SqlParameter("IsDelete", isdelete);
            Parameters[23] = new SqlParameter("LastModifiedBy", modifiedby);
            Parameters[24] = new SqlParameter("LastModifiedDateTime", modifieddatetime);

            return objDALCommon.ExecuteProcedure("spUPD_ItemMaster", CommandType.StoredProcedure, Parameters);
        }

        public int DeleteItemDetail(int ItemId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("ItemID", ItemId);

            return objDALCommon.ExecuteProcedure("spDEL_Item", CommandType.StoredProcedure, Parameters);
        }

        public DataSet RetrieveItemManufactureCoparationData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_ItemManufactureCoparation");
        }


        public DataSet RetrieveItemCategoryData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_ItemCategory");
        }

        public DataSet RetrieveIteTypeData()
        {
            return objDALCommon.ExecuteProcedure_select("spSEL_ItemType");
        }





    }
}
