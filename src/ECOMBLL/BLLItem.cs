using ECOMDAL;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECOMBLL
{
    public class BLLItem
    {
        DALItem objDALItem = new DALItem();

        public DataSet RetrieveItemData()
        {
            return objDALItem.RetrieveItemData();
        }

        public DataSet RetrieveItemData(int ItemId)
        {
            return objDALItem.RetrieveItemData(ItemId);
        }

        public DataSet RetrieveItemManufactureCoparationData()
        {
            return objDALItem.RetrieveItemManufactureCoparationData();
        }

        public DataSet RetrieveItemCategoryData()
        {
            return objDALItem.RetrieveItemCategoryData();
        }

        public DataSet RetrieveIteTypeData()
        {
            return objDALItem.RetrieveIteTypeData();
        }

        public int InsertItemMasterData(string name, string searchdescription, int itemtypeid, int itemmanufactorecoporationid,
            int itemcategory, string remark, int quntity, double unitprice, double markprice, double discountprice, double stdlengh,
            double stdweight, double stdvolume, DateTime manufatoreddate, DateTime expirationdate, int minorderqty, bool issellable,
            bool isordering, bool isreturnable, byte[] itmeimage, bool isactive, bool isdelete, string createby, DateTime createdatetime)
        {
            return objDALItem.InsertItemMasterData(name, searchdescription, itemtypeid, itemmanufactorecoporationid, itemcategory,
                remark, quntity, unitprice, markprice, discountprice, stdlengh, stdweight, stdvolume, manufatoreddate, expirationdate, minorderqty,
                issellable, isordering, isreturnable, itmeimage, isactive, isdelete, createby, createdatetime);
        }

        public int UpdateItemMasterData(int itemid, string name, string searchdescription, int itemtypeid, int itemmanufactorecoporationid,
            int itemcategory, string remark, int quntity, double unitprice, double markprice, double discountprice, double stdlengh,
            double stdweight, double stdvolume, DateTime manufatoreddate, DateTime expirationdate, int minorderqty, bool issellable,
            bool isordering, bool isreturnable, byte[] itmeimage, bool isactive, bool isdelete, string modifiedby, DateTime modifieddatetime)
        {
            return objDALItem.UpdateItemMasterData(itemid, name, searchdescription, itemtypeid, itemmanufactorecoporationid, itemcategory,
                remark, quntity, unitprice, markprice, discountprice, stdlengh, stdweight, stdvolume, manufatoreddate, expirationdate, minorderqty,
                issellable, isordering, isreturnable, itmeimage, isactive, isdelete, modifiedby, modifieddatetime);
        }

    }
}
