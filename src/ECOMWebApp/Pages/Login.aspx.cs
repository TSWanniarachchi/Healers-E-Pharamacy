using ECOMBLL;
using System;
using System.Data;
using System.Web.UI;

namespace ECOMWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        BLLSystemUserLogin objBLLSystemUserLogin = new BLLSystemUserLogin();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Page load event
                if (!Page.IsPostBack)
                {
                    Session.Remove("UserId");
                    Session.Remove("UserGroup");
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = string.Empty;
                string password = string.Empty;
                string encryptedpassword = string.Empty;
                DataSet dsSysUser = new DataSet();

                username = txtUsername.Text.Trim();
                password = txtPassword.Text.Trim();
                dsSysUser = objBLLSystemUserLogin.RetrieveSystemUserLoginDetails(username);

                if (dsSysUser.Tables[0].Rows.Count > 0)
                {
                    if (dsSysUser.Tables[0].Rows.Count == 1)
                    {
                        DataRow dr = dsSysUser.Tables[0].Rows[0];

                        string dbId = dr["ID"].ToString();
                        string dbUserId = dr["UserID"].ToString();
                        string dbPassword = dr["Password"].ToString();
                        int dbUserGroupId = Convert.ToInt32(dr["UserGroupID"]);
                        string dbUserGroup = dr["UserGroup"].ToString();
                        bool dbIsActive = Convert.ToBoolean(dr["IsActive"]) ? true : false;
                        bool dbIsDelete = Convert.ToBoolean(dr["IsDelete"]) ? true : false;

                        Cryptography objCryptography = new Cryptography();
                        encryptedpassword = objCryptography.EncryptString(password);

                        if (username == dbUserId && encryptedpassword == dbPassword)
                        {
                            if(dbIsActive == true)
                            {
                                if (dbIsDelete == false)
                                {
                                    //SuperAdmin
                                    if (dbUserGroupId == 1)
                                    {
                                        Session["UserId"] = dbUserId;
                                        Session["UserGroup"] = dbUserGroup;
                                        Response.Redirect("~/Pages/Client/Home.aspx", false);
                                    }
                                    //Admin
                                    else if (dbUserGroupId == 2)
                                    {
                                        Session["UserId"] = dbUserId;
                                        Session["UserGroup"] = dbUserGroup;
                                        Response.Redirect("~/Pages/Client/Home.aspx", false);
                                    }
                                    //CompanyAdmin
                                    else if (dbUserGroupId == 3)
                                    {
                                        Session["UserId"] = dbUserId;
                                        Session["UserGroup"] = dbUserGroup;
                                        Response.Redirect("~/Pages/Client/Home.aspx", false);
                                    }
                                    //DelivaryPerson
                                    else if (dbUserGroupId == 4)
                                    {
                                        Session["UserId"] = dbUserId;
                                        Session["UserGroup"] = dbUserGroup;
                                        Response.Redirect("~/Pages/Delivery/DeliveryHome.aspx", false);
                                    }
                                    //Customer
                                    else if (dbUserGroupId == 5)
                                    {
                                        Session["UserId"] = dbUserId;
                                        Session["UserGroup"] = dbUserGroup;
                                        Response.Redirect("~/Pages/Customer/Home.aspx", false);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('System error, Please contact the system administrator.');", true);
                                        return;
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('Your acount is Banded, Please contact the pharamacy.');", true);
                                    return;
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('Your acount is Inactive, Please contact the help centure.');", true);
                                return;
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('Your enterd password is incorrect.');", true);
                            return;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('System error, Please contact the system administrator.');", true);
                        return;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.btnLogin, this.btnLogin.GetType(), "ErrorProvider", "alert('You are not a member of E-Pharamacy system. Please check your enterd username or Create a new account.');", true);
                    return;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

    }
}