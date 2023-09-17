using ECOMBLL;
using System;
using System.Data;
using System.Web.UI;

namespace ECOMWebApp
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();
        BALAdminMaster objBALAdminMaster = new BALAdminMaster();

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

                        BindNavigationPageDataCount(fromDate, toDate);
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

        private void BindNavigationPageDataCount(DateTime fromDate, DateTime toDate)
        {
            try
            {
                DataSet dsNavigationPageDataCount = new DataSet();

                dsNavigationPageDataCount = objBALAdminMaster.NavigationPageDataCount(fromDate, toDate);
                if (dsNavigationPageDataCount.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsNavigationPageDataCount.Tables[0].Rows[0];

                    lblPendingPurchaseOrderCount.Text = dr["PendingPurchaseOrderCount"].ToString();
                    lblPendingPrescriptionCount.Text = dr["PendingPrescriptionOrderCount"].ToString();
                    lblFeedbackCount.Text = dr["FeedbackCount"].ToString();

                    //Company logo
                    byte[] bytes = (byte[])dr["Logo"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgLogo.ImageUrl = "data:image/png;base64," + base64String;
                }
                else
                {
                    lblPendingPurchaseOrderCount.Text = "0";
                    lblPendingPrescriptionCount.Text = "0";
                    lblFeedbackCount.Text = "0";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}