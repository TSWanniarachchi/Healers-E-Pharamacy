using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Customer
{
    public partial class CustomerMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null)
                {
                    lblUName.Text = Session["UserId"].ToString();
                    lbtnAction.Text = "Logout";
                    //Session.Remove("UserId");
                }

                ArrayList items = (ArrayList)Session["mycart"];
                if (Session["mycart"] != null)
                {
                    int Icount = items.Count;
                    lblCartItemcountL.Text = Convert.ToString(Icount);
                    lblCartItemcountM.Text = Convert.ToString(Icount);
                }
                else
                {
                    countL.Visible = false;
                    countM.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }

        }
                
        protected void lbtnItemSearch_Click(object sender, EventArgs e)
        {            
            if (!string.IsNullOrWhiteSpace(txtItemName.Text))
            {
                Session["SearchItemName"] = txtItemName.Text;
                Response.Redirect("~/Pages/Customer/Shop.aspx");
            }
        }

        protected void lbtnAction_Click(object sender, EventArgs e)
        {
            try
            {
                lbtnAction.Text = "Login";
                Session.Remove("UserId");
                lblUName.Text = "";
                Response.Redirect("~/Pages/Login.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }
    }
}