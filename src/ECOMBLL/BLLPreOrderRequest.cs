using ECOMDAL;
using System;
using System.Data;

namespace ECOMBLL
{
    public class BLLPreOrderRequest
    {
        DLLPreOrderRequest objDLLPreOrderRequest = new DLLPreOrderRequest();

        public DataSet RetrieveOrderRequestHeader(DateTime fromDate, DateTime toDate, string orderType, int status)
        {
            return objDLLPreOrderRequest.RetrieveOrderRequestHeader(fromDate, toDate, orderType, status);
        }

        public DataSet RetrieveOrderRequestDetail(string orderRequestId)
        {
            return objDLLPreOrderRequest.RetrieveOrderRequestDetail(orderRequestId);
        }

        public int OrderConfirmation(string orderRequestId, bool confirmation, double deliveryAmount, string encryptedOTP, int rejectReasonID, string userID)
        {
            return objDLLPreOrderRequest.OrderConfirmation(orderRequestId, confirmation, deliveryAmount, encryptedOTP, rejectReasonID, userID);
        }

        public DataSet GetInvoiceNo(int customerId)
        {
            return objDLLPreOrderRequest.GetInvoiceNo(customerId);
        }
    }
}