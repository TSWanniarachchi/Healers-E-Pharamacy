using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DALFeedback
    {
        DALCommon ObjDALCommon = new DALCommon();

        public DataSet GetFeedback()
        {
            return ObjDALCommon.ExecuteProcedure_select("spSEL_Feedback");
        }

        public DataSet GetCustomer(string userId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("UserID", userId);

            return ObjDALCommon.ExecuteProcedure_select("spSEL_CustomerByUserId", Parameters);
        }

        public int InsertFeedback(string orderRequestID, string feedback, string userId)
        {
            SqlParameter[] Parameters = new SqlParameter[3];

            Parameters[0] = new SqlParameter("OrderRequestID", orderRequestID);
            Parameters[1] = new SqlParameter("Feedback", feedback);
            Parameters[2] = new SqlParameter("UserID", userId);

            return ObjDALCommon.ExecuteProcedure("spINS_Feedback", CommandType.StoredProcedure, Parameters);
        }
    }
}
