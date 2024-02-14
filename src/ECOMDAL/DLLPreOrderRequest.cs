using System;
using System.Data;
using System.Data.SqlClient;

namespace ECOMDAL
{
    public class DLLPreOrderRequest
    {
        DALCommon objDALCommon = new DALCommon();

        public DataSet RetrieveOrderRequestHeader(DateTime fromDate, DateTime toDate, string orderType, int status)
        {
            SqlParameter[] Parameters = new SqlParameter[4];

            Parameters[0] = new SqlParameter("FromDate", fromDate);
            Parameters[1] = new SqlParameter("ToDate", toDate);
            Parameters[2] = new SqlParameter("OrderType", orderType);
            Parameters[3] = new SqlParameter("Status", status);

            return objDALCommon.ExecuteProcedure_select("spSEL_OrderRequestHeader", Parameters);
        }

        public DataSet RetrieveOrderRequestDetail(string orderRequestId)
        {
            SqlParameter[] Parameters = new SqlParameter[1];

            Parameters[0] = new SqlParameter("OrderRequestID", orderRequestId);

            return objDALCommon.ExecuteProcedure_select("spSEL_OrderRequestDetail", Parameters);
        }

        public int OrderConfirmation(string orderRequestId, bool confirmation, double deliveryAmount, string encryptedOTP, int rejectReasonID, string userID)
        {
            SqlParameter[] Parameters = new SqlParameter[6];

            Parameters[0] = new SqlParameter("OrderRequestID", orderRequestId);
            Parameters[1] = new SqlParameter("Confirmation", confirmation);
            Parameters[2] = new SqlParameter("DeliveryAmount", deliveryAmount);
            Parameters[3] = new SqlParameter("OTP", encryptedOTP);
            Parameters[4] = new SqlParameter("RejectReasonID", rejectReasonID);
            Parameters[5] = new SqlParameter("UserID", userID);

            return objDALCommon.ExecuteProcedure("spINUP_OrderConfirmation", CommandType.StoredProcedure, Parameters);
        }

        public DataSet GetInvoiceNo(int customerId)
        {
            return objDALCommon.ReturnDataSet("SELECT [dbo].[GetNextInvoiceNumber](" + customerId + ") AS InvoiceNo;");
        }
    }
}
