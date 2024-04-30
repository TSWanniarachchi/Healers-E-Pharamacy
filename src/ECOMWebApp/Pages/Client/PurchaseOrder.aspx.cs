using ECOMBLL;
using System;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace ECOMWebApp.Pages.Client
{
    public partial class PurchaseOrder : System.Web.UI.Page
    {
        BLLPreOrderRequest objBLLPreOrderRequest = new BLLPreOrderRequest();
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();

        //Order Details
        private static string OrderRequestId = string.Empty;
        private static int CustomerId = 0;
        private static string CustomerName = string.Empty;
        private static string CustomerEmail = string.Empty;
        private static string OrderStatus = string.Empty;
        private static double TotalOrderNetAmount = 0.00;
        private static double TotalDeliveryCharge = 100.00;
        private static string InvoiceNo = string.Empty;

        //Company Details
        private static string CompanyName = string.Empty;
        private static string CompanyRegisterNo = string.Empty;
        private static string CompanyAddress = string.Empty;
        private static string CompanyContactNo = string.Empty;
        private static string CompanyEmail = string.Empty;
        private static string CompanyFooter = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null && objBLLPageLevelSecurity.IsAccessAdmin(Session["UserGroup"].ToString()))
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        DateTime now = DateTime.Now;
                        dtpFromDate.Text = new DateTime(now.Year, now.Month, 1).ToString("yyyy-MM-dd");
                        dtpToDate.Text = now.ToString("yyyy-MM-dd");

                        BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
                    }
                    //Page post back event(Button press Event or etc..)
                    else
                    { }
                }
                else
                {
                    Response.Redirect("~/Pages/Login.aspx");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void dtpFromDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(dtpFromDate.Text) > Convert.ToDateTime(dtpToDate.Text))
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('info', 'info...', 'From Date cannot be greater than To Date.');", true);

                BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void dtpToDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(dtpFromDate.Text) > Convert.ToDateTime(dtpToDate.Text))
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('info', 'info...', 'From Date cannot be greater than To Date.');", true);

                BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void ddlOrderType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindOrderRequestHeaderDataToGridView(DateTime fromDate, DateTime toDate, string orderType, int status)
        {
            try
            {
                DataSet dsOrderRequestHeader = new DataSet();

                dsOrderRequestHeader = objBLLPreOrderRequest.RetrieveOrderRequestHeader(fromDate, toDate, orderType, status);
                gvOrderRequestHeader.DataSource = dsOrderRequestHeader;
                gvOrderRequestHeader.DataBind();

                //Calculate Sum and display in footer row
                decimal totalAmount = dsOrderRequestHeader.Tables[0].AsEnumerable().Sum(row => row.Field<decimal>("TotalAmount"));

                if (totalAmount > 0)
                {
                    gvOrderRequestHeader.FooterRow.Cells[0].Text = "Total";
                    gvOrderRequestHeader.FooterRow.Cells[8].Text = totalAmount.ToString("N2");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gvOrderRequestHeader_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                OrderRequestId = gvOrderRequestHeader.DataKeys[gvOrderRequestHeader.SelectedIndex].Value.ToString();

                DataSet dsOrderRequestDetails = new DataSet();
                dsOrderRequestDetails = objBLLPreOrderRequest.RetrieveOrderRequestDetail(OrderRequestId);
                dsOrderRequestDetails.Tables[0].TableName = "OrderSummary";
                dsOrderRequestDetails.Tables[1].TableName = "OrderItems";
                dsOrderRequestDetails.Tables[2].TableName = "CompanyDetails";

                if (dsOrderRequestDetails.Tables["OrderSummary"].Rows.Count == 1)
                {
                    DataRow drOrder = dsOrderRequestDetails.Tables["OrderSummary"].Rows[0];

                    #region Order Summary Section
                    //Header Details
                    lblSumOrderNo.Text = drOrder["OrderRequestID"].ToString();
                    OrderStatus = drOrder["Status"].ToString();
                    lblSumStatus.Text = OrderStatus;
                    lblSumRequestedOn.Text = drOrder["RequestedOn"].ToString();

                    //Customer Details
                    CustomerId = Convert.ToInt32(drOrder["CustomerID"]);
                    CustomerName = drOrder["Customer"].ToString();
                    lblCustomer.Text = CustomerName;
                    lblAddress.Text = drOrder["CustomerAddress"].ToString();
                    lblContactNo.Text = drOrder["MobileNo"].ToString();
                    CustomerEmail = drOrder["Email"].ToString();
                    lblEmail.Text = CustomerEmail;

                    //Order Details
                    lblOrderType.Text = drOrder["OrderType"].ToString();
                    lblRecivedType.Text = drOrder["RecivedType"].ToString();
                    lblPaymentType.Text = drOrder["PaymentType"].ToString();
                    lblDeliveryPlace.Text = drOrder["DeliveryPlace"].ToString();
                    lblRemark.Text = drOrder["Remark"].ToString();
                    #endregion

                    #region Order Process & Order Items
                    //Order Process
                    lblodStatus.Text = OrderStatus;
                    lblConfirmation.Text = drOrder["Confirmation"].ToString();
                    lblConfirmationBy.Text = drOrder["ConfirmationBy"].ToString();
                    lblConfirmationDateTime.Text = drOrder["ConfirmationDateTime"].ToString();
                    lblDelivaryPerson.Text = drOrder["DelivaryPerson"].ToString();
                    lblDeliveryStartingDateTime.Text = drOrder["DeliveryStartingDateTime"].ToString();
                    lblHandOverDateTime.Text = drOrder["HandOverDateTime"].ToString();

                    //Order Items
                    BindOrderRequestDetailDataToGridView(dsOrderRequestDetails.Tables["OrderItems"]);

                    //Company Details
                    if (dsOrderRequestDetails.Tables["CompanyDetails"].Rows.Count == 1)
                    {
                        DataRow drCompany = dsOrderRequestDetails.Tables["CompanyDetails"].Rows[0];

                        CompanyName = drCompany["Name"].ToString();
                        CompanyRegisterNo = drCompany["RegisterNo"].ToString();
                        CompanyAddress = drCompany["Address"].ToString();
                        CompanyContactNo = drCompany["ContactNo"].ToString();
                        CompanyEmail = drCompany["Email"].ToString();
                        CompanyFooter = drCompany["Footer"].ToString();

                        lblCompanyName.Text = CompanyName;
                        lblCompanyRegisterNo.Text = CompanyRegisterNo;
                        lblCompanyAddress.Text = CompanyAddress;
                        lblCompanyContactNo.Text = CompanyContactNo;
                        lblCompanyEmail.Text = CompanyEmail;
                        lblCompanyFooter.Text = CompanyFooter;
                    }
                    #endregion

                    #region Order Status Wise Data Changes
                    if (OrderStatus == "Pending")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-warning";
                        infoStatus.Attributes["class"] = "info-box-icon bg-warning";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-warning";

                        pnlDeliveryCharge.Visible = true;
                        InvoiceNo = objBLLPreOrderRequest.GetInvoiceNo(CustomerId).Tables[0].Rows[0]["InvoiceNo"].ToString();
                        lblInvoiceNo.Text = InvoiceNo;
                    }
                    else if (OrderStatus == "Confirmed")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-success";
                        infoStatus.Attributes["class"] = "info-box-icon bg-success";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-success";

                        pnlDeliveryCharge.Visible = true;
                        lblDeliveryCharge.Text = drOrder["DeliveryAmount"].ToString();
                        lblTotalNetAmount.Text = drOrder["TotalNetAmount"].ToString();
                    }
                    else if (OrderStatus == "Rejected")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-danger";
                        infoStatus.Attributes["class"] = "info-box-icon bg-danger";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-danger";

                        pnlDeliveryCharge.Visible = false;
                    }
                    else if (OrderStatus == "Delivered")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-secondary";
                        infoStatus.Attributes["class"] = "info-box-icon bg-secondary";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-secondary";

                        pnlDeliveryCharge.Visible = true;
                        lblDeliveryCharge.Text = drOrder["DeliveryAmount"].ToString();
                        lblTotalNetAmount.Text = drOrder["TotalNetAmount"].ToString();
                    }
                    #endregion

                    VisiblePanel();
                }
                else
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'System error please contact system administrator.');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindOrderRequestDetailDataToGridView(DataTable dtOrderItems)
        {
            try
            {
                gvOrderRequestDetail.DataSource = dtOrderItems;
                gvOrderRequestDetail.DataBind();

                //Calculate Sum and display in footer row
                int totalQuantity = dtOrderItems.AsEnumerable().Sum(row => row.Field<int>("Quantity"));
                decimal totalGrossAmount = dtOrderItems.AsEnumerable().Sum(row => row.Field<decimal>("GrossAmount"));
                decimal totalDiscountAmount = dtOrderItems.AsEnumerable().Sum(row => row.Field<decimal>("DiscountAmount"));
                decimal totalNetAmount = dtOrderItems.AsEnumerable().Sum(row => row.Field<decimal>("NetAmount"));

                gvOrderRequestDetail.FooterRow.Cells[1].Text = "Total";
                gvOrderRequestDetail.FooterRow.Cells[3].Text = totalQuantity.ToString("N0");
                gvOrderRequestDetail.FooterRow.Cells[5].Text = totalGrossAmount.ToString("N2");
                gvOrderRequestDetail.FooterRow.Cells[6].Text = totalDiscountAmount.ToString("N2");
                gvOrderRequestDetail.FooterRow.Cells[7].Text = totalNetAmount.ToString("N2");

                if (OrderStatus == "Rejected")
                {
                    lblTotalNetAmount.Text = totalNetAmount.ToString("N2");
                }
                else
                {
                    TotalDeliveryCharge = 100.00;
                    TotalOrderNetAmount = Convert.ToDouble(totalNetAmount) + TotalDeliveryCharge;
                    lblSubTotal.Text = totalNetAmount.ToString("N2");
                    lblDeliveryCharge.Text = TotalDeliveryCharge.ToString("N2");
                    lblTotalNetAmount.Text = TotalOrderNetAmount.ToString("N2");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            try
            {
                VisiblePanel();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnDeliveryChargeIncrease_Click(object sender, EventArgs e)
        {
            try
            {
                if (TotalDeliveryCharge >= 100)
                {
                    TotalDeliveryCharge += 25;
                    lblDeliveryCharge.Text = TotalDeliveryCharge.ToString("N2");
                    lblTotalNetAmount.Text = (TotalOrderNetAmount + TotalDeliveryCharge - 100).ToString("N2");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnDeliveryChargeDecrease_Click(object sender, EventArgs e)
        {
            try
            {
                if (TotalDeliveryCharge > 100)
                {
                    TotalDeliveryCharge -= 25;
                    lblDeliveryCharge.Text = TotalDeliveryCharge.ToString("N2");
                    lblTotalNetAmount.Text = (TotalOrderNetAmount + TotalDeliveryCharge - 100).ToString("N2");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int affectedRowCount = 0;

                    affectedRowCount = objBLLPreOrderRequest.OrderConfirmation(OrderRequestId, false, TotalDeliveryCharge, "0", 1, Session["UserId"].ToString());
                    if (affectedRowCount == 1)
                    {
                        BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Success...', 'Order rejected successfully.');", true);
                        VisiblePanel();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Order didn\\'t reject.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Random randomNo = new Random();
                    int oriOTP = randomNo.Next(100000, 999999);

                    Cryptography objCryptography = new Cryptography();
                    string encryptedOTP = objCryptography.EncryptString(oriOTP.ToString());

                    int affectedRowCount = 0;

                    affectedRowCount = objBLLPreOrderRequest.OrderConfirmation(OrderRequestId, true, TotalDeliveryCharge, encryptedOTP, 0, Session["UserId"].ToString());
                    if (affectedRowCount > 0)
                    {
                        SendEmail("healerspharmacyavisawella@gmail.com", CustomerEmail, oriOTP);
                        BindOrderRequestHeaderDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToString(ddlOrderType.SelectedValue), Convert.ToInt32(ddlStatus.SelectedValue));
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Success...', 'Order confirmed successfully.');", true);
                        VisiblePanel();
                    }
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Order didn\\'t confirm.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void SendEmail(string from, string to, int otp)
        {
            try
            {
                MailMessage mail = new MailMessage(from, to);

                mail.Subject = "Your Order Has Deliverd - Online Pharmacy";
                mail.Body = "Hi " + CustomerName + ".";
                mail.Body += "\n\nYour order has deliverd!";
                mail.Body += "\nInvoice number : " + lblInvoiceNo.Text.ToString() + "";
                mail.Body += "\nShould arrive to your deliver address within 1 busisness days.";
                mail.Body += "With delivery charges, total amount is LKR " + TotalOrderNetAmount + ". After our delivery person took your ordered medicines and order is correct, give OTP Code to him and confirm your order. OTP Code is " + otp + ".";
                mail.Body += "\n\n" + CompanyFooter + ", Please feel free to contact us for any inquiry? \nYou can contact us anytime.";
                mail.Body += "\n\n-----\n";
                mail.Body += "" + CompanyName + "\n" + CompanyAddress + "\n036-2230427, " + CompanyContactNo + "\n" + CompanyEmail + " \nNational Medicines Regulatory Authority. Reg No: " + CompanyRegisterNo + "";
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;

                NetworkCredential NetworkCred = new NetworkCredential(from, "Pharmacy@123");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void VisiblePanel()
        {
            try
            {
                if (pnlDetail.Visible == false)
                {
                    pnlGrid.Visible = false;
                    lblFormDescription.Text = "Order Summary Details";
                    pnlDetail.Visible = true;

                    if (OrderStatus == "Pending")
                    {
                        btnDeliveryChargeIncrease.Visible = true;
                        btnDeliveryChargeDecrease.Visible = true;
                        btnReject.Visible = true;
                        btnConfirm.Visible = true;
                    }
                    else
                    {
                        btnDeliveryChargeIncrease.Visible = false;
                        btnDeliveryChargeDecrease.Visible = false;
                        btnReject.Visible = false;
                        btnConfirm.Visible = false;
                    }
                }
                else if (pnlDetail.Visible == true)
                {
                    pnlDetail.Visible = false;
                    lblFormDescription.Text = "Pre Requested Order List";
                    pnlGrid.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}