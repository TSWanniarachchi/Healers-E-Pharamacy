using ECOMDAL;
using System.Data;

namespace ECOMBLL
{
    public class BLLFeedback
    {
        DALFeedback ObjDALFeedback = new DALFeedback();

        public DataSet GetFeedback()
        {
            return ObjDALFeedback.GetFeedback();
        }

        public DataSet GetCustomer(string userId)
        {
            return ObjDALFeedback.GetCustomer(userId);
        }

        public int InsertFeedback(string orderRequestID, string feedback, string userId)
        {
            return ObjDALFeedback.InsertFeedback(orderRequestID, feedback, userId);
        }
    }
}
