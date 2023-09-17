using ECOMBLL;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;

namespace ECOMWebApp.Pages.Client
{
    public partial class Home : System.Web.UI.Page
    {
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();
        BLLPharmacyDashboard objBLLPharmacyDashboard = new BLLPharmacyDashboard();

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
                        DateTime fromDate = new DateTime(now.Year, now.Month, 1);
                        DateTime toDate = now;

                        BindDashBoardData(fromDate, toDate);
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
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindDashBoardData(DateTime fromDate, DateTime toDate)
        {
            try
            {
                DataSet dsPharmacyDashboard = new DataSet();
                dsPharmacyDashboard = objBLLPharmacyDashboard.RetrievePharamacyDashbordData(fromDate, toDate);

                dsPharmacyDashboard.Tables[0].TableName = "HeaderAlertData";
                dsPharmacyDashboard.Tables[1].TableName = "DateWiseTotalSales";
                dsPharmacyDashboard.Tables[2].TableName = "ItemStock";
                dsPharmacyDashboard.Tables[3].TableName = "MinimumQuantityItems";
                dsPharmacyDashboard.Tables[4].TableName = "ItemExpirationDate";
                dsPharmacyDashboard.Tables[5].TableName = "SalesSummary";

                //Header Alert Box 
                if (dsPharmacyDashboard.Tables["HeaderAlertData"].Rows.Count > 0)
                {
                    DataRow dr = dsPharmacyDashboard.Tables["HeaderAlertData"].Rows[0];

                    lblNewCustomers.Text = dr["NewCustomersCount"].ToString();
                    lblNewOrders.Text = dr["NewOrdersCount"].ToString();
                    lblConfirmedOrders.Text = dr["ConfirmedOrdersCount"].ToString();
                    lblRejectedOrder.Text = dr["RejectedOrderCount"].ToString();
                }
                else
                {
                    lblNewCustomers.Text = "0";
                    lblNewOrders.Text = "0";
                    lblConfirmedOrders.Text = "0";
                    lblRejectedOrder.Text = "0";
                }

                //Sales Report Bar Chart
                chartSales.DataSource = dsPharmacyDashboard.Tables["DateWiseTotalSales"];
                decimal totalSale = dsPharmacyDashboard.Tables["DateWiseTotalSales"].AsEnumerable().Sum(row => row.Field<decimal>("TotalSale"));
                lblTotalNetSale.Text = totalSale.ToString("N2");

                //Stock Report Pie Chart
                chartStock.DataSource = dsPharmacyDashboard.Tables["ItemStock"];
                int quantity = dsPharmacyDashboard.Tables["ItemStock"].AsEnumerable().Sum(row => row.Field<int>("Quantity"));
                lblStockCount.Text = quantity.ToString("N0");

                //Minimum Quantity Items Table
                reptrMinimumStock.DataSource = dsPharmacyDashboard.Tables["MinimumQuantityItems"];
                reptrMinimumStock.DataBind();

                //Item Expiration Date Table
                reptrItemExpirationDate.DataSource = dsPharmacyDashboard.Tables["ItemExpirationDate"];
                reptrItemExpirationDate.DataBind();

                //Last 30 days pharmacy Sales Summary
                if (dsPharmacyDashboard.Tables["SalesSummary"].Rows.Count > 0)
                {
                    DataRow dr = dsPharmacyDashboard.Tables["SalesSummary"].Rows[0];

                    lblTotalGrossAmount.Text = Convert.ToDecimal(dr["TotalGrossAmount"]).ToString("N2");
                    lblTotalDiscountAmount.Text = Convert.ToDecimal(dr["TotalDiscountAmount"]).ToString("N2");
                    lblTotalDeliveryAmount.Text = Convert.ToDecimal(dr["TotalDeliveryAmount"]).ToString("N2");
                    lblTotalNetAmount.Text = Convert.ToDecimal(dr["TotalNetAmount"]).ToString("N2");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}