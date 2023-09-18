using ECOMBLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Customer
{
    public partial class SignUp : System.Web.UI.Page
    {
        BLLCustomer objBLLCustomer = new BLLCustomer();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Page load event
                if (!Page.IsPostBack)
                {
                    BindDistrict();
                    txtUserName.Attributes.Add("autocomplete", "off");
                    txtPassword.Attributes.Add("autocomplete", "off");

                    //txtUserName.Text = string.Empty;
                }
                //Page post back event(Button press Event or etc..)
                else
                {
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid && PageValidate())
                {
                    int affectedRowCount = 0;

                    objBLLCustomer.BeginTransaction();

                    affectedRowCount += objBLLCustomer.InsertCustomerData(txtName.Text.Trim(), txtAddress.Text.Trim(),
                                        Convert.ToInt32(ddlDistrict.SelectedValue), txtNic.Text.Trim(), true, txtMobile.Text.Trim(),
                                        txtEmail.Text.Trim(), txtUserName.Text.Trim());

                    affectedRowCount += objBLLCustomer.InsertSysUserSecurityData(txtUserName.Text.Trim(), txtPassword.Text.Trim());

                    if (affectedRowCount == 2)
                    {
                        objBLLCustomer.CommitTransaction();
                        ClearFormControllersValue();
                        ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('success', 'Success...', 'Your account successfully created.');", true);
                    }
                    else
                    {
                        objBLLCustomer.RollbackTransaction();
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Your account didn\\'t created.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                objBLLCustomer.RollbackTransaction();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindDistrict()
        {
            try
            {
                DataSet dsDistrict = new DataSet();
                dsDistrict = objBLLCustomer.RetrieveActiveDistrict();

                ddlDistrict.Items.Clear();
                if (dsDistrict.Tables[0].Rows.Count > 0)
                {
                    ddlDistrict.DataTextField = "Name";
                    ddlDistrict.DataValueField = "ID";
                    ddlDistrict.DataSource = dsDistrict;
                    ddlDistrict.DataBind();
                    ddlDistrict.Items.Insert(0, new ListItem("Select One", "0"));
                    ddlDistrict.SelectedIndex = 0;
                }
                else
                {
                    ddlDistrict.DataSource = dsDistrict;
                    ddlDistrict.DataBind();
                    ddlDistrict.Items.Insert(0, new ListItem("No Data", "0"));
                    ddlDistrict.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private bool PageValidate()
        {
            try
            {
                if (ddlDistrict.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('info', 'Success...', 'please select district');", true);
                    return false;
                }
                else if (ddlGender.SelectedIndex == 0)
                {
                    ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('info', 'Success...', 'please select gender');", true);
                    return false;
                }
                else if (txtPassword.Text.Trim() != txtConfimPassword.Text.Trim())
                {
                    ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('info', 'Password checking...', 'Please check both passwords are correct');", true);
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        public void ClearFormControllersValue()
        {
            try
            {
                txtName.Text = string.Empty;
                txtAddress.Text = string.Empty;
                ddlDistrict.SelectedIndex = 0;
                txtNic.Text = string.Empty;
                ddlGender.SelectedIndex = 0;
                txtMobile.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtConfimPassword.Text = string.Empty;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public void CheckPasswordCorrect()
        //{
        //    try
        //    {
        //        if (txtPassword == txtConfimPassword)
        //        {
        //            ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('success', 'Success...', 'Both passwords are correct');", true);

        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(btnSave, btnSave.GetType(), "popup", "sweetalert('error', 'Error...', 'Please check both passwords are correct');", true);

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

    }
}