using ECOMBLL;
using System;
using System.Data;
using System.Web.UI;

namespace ECOMWebApp.Pages.Client
{
    public partial class Customer : System.Web.UI.Page
    {
        BLLCustomer objBLLCustomer = new BLLCustomer();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null)
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        BindCustomerDataToGridView();
                    }
                    //Page post back event(Button press Event or etc..)
                    else
                    {

                    }
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

        private void BindCustomerDataToGridView()
        {
            try
            {
                DataSet dsCustomer = new DataSet();

                dsCustomer = objBLLCustomer.RetrieveCustomerData();
                gvCustomer.DataSource = dsCustomer;
                gvCustomer.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}