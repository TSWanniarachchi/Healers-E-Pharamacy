using ECOMBLL;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;

namespace ECOMWebApp.Pages.Client
{
    public partial class Company : System.Web.UI.Page
    {
        BLLCompany objBLLCompany = new BLLCompany();
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();

        private static int CompanyId;
        private static bool IsAdd = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null && objBLLPageLevelSecurity.IsAccessAdmin(Session["UserGroup"].ToString()))
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        BindCompanyDataToGridView();
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                VisiblePanelDetail("Add");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                VisiblePanelGrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                CompanyId = Convert.ToInt32(gvCompany.DataKeys[gvCompany.SelectedIndex].Value);

                DataSet dsSelectdCompany = new DataSet();
                dsSelectdCompany = objBLLCompany.RetrieveCompanyData(CompanyId);

                if (dsSelectdCompany.Tables[0].Rows.Count == 1)
                {
                    DataRow dr = dsSelectdCompany.Tables[0].Rows[0];

                    txtName.Text = dr["Name"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtContactNo.Text = dr["ContactNo"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtDescription.Text = dr["Description"].ToString();
                    txtFooter.Text = dr["Footer"].ToString();
                    if (dr["Logo"] != System.DBNull.Value)
                    {
                        byte[] bytes = (byte[])dr["Logo"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        imgPreview.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    chkActive.Checked = Convert.ToBoolean(dr["IsActive"]) ? true : false;

                    VisiblePanelDetail("Edit");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int affectedRowCount = 0;
                    byte[] imageBytes = null;

                    if (imageUploader.HasFile)
                    {
                        HttpPostedFile postedFile = imageUploader.PostedFile;
                        string fileName = Path.GetFileName(postedFile.FileName);
                        string fileExtension = Path.GetExtension(fileName);
                        int fileSize = postedFile.ContentLength;

                        if (fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".png")
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'Only jpg and png file allowed.');", true);
                            return;
                        }
                        else if (fileSize > 2097152)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'Maximum size 2(MB) exceeded.');", true);
                            return;
                        }
                        else
                        {
                            Stream stream = postedFile.InputStream;
                            BinaryReader binaryReader = new BinaryReader(stream);
                            imageBytes = binaryReader.ReadBytes((int)stream.Length);
                        }
                    }
                    else
                    {
                        string nullImagePath = Server.MapPath("~/Images/Null/blank.png");
                        imageBytes = System.Text.Encoding.UTF8.GetBytes(nullImagePath);
                    }

                    affectedRowCount = objBLLCompany.InsertCompanyData(txtName.Text.Trim(), txtAddress.Text.Trim(), txtContactNo.Text.Trim(),
                                                               txtEmail.Text.Trim().ToLower(), txtDescription.Text.Trim(), imageBytes, txtFooter.Text.Trim(),
                                                               chkActive.Checked, Session["UserId"].ToString());
                    if (affectedRowCount == 1)
                    {
                        BindCompanyDataToGridView();
                        VisiblePanelGrid();
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Success...', 'Company data successfully inserted.');", true);
                    }
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Company data didn\\'t insert.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int affectedRowCount = 0;
                    byte[] imageBytes = null;
                    bool isChangeLogo = true;

                    if (imageUploader.HasFile)
                    {
                        HttpPostedFile postedFile = imageUploader.PostedFile;
                        string fileName = Path.GetFileName(postedFile.FileName);
                        string fileExtension = Path.GetExtension(fileName);
                        int fileSize = postedFile.ContentLength;

                        if (fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".png")
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'Only jpg and png file allowed.');", true);
                            return;
                        }
                        else if (fileSize > 2097152)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'Maximum size 2(MB) exceeded.');", true);
                            return;
                        }
                        else
                        {
                            Stream stream = postedFile.InputStream;
                            BinaryReader binaryReader = new BinaryReader(stream);
                            imageBytes = binaryReader.ReadBytes((int)stream.Length);

                            isChangeLogo = true;
                        }
                    }
                    else
                    {
                        string nullImagePath = Server.MapPath("~/Images/Null/blank.png");
                        imageBytes = System.Text.Encoding.UTF8.GetBytes(nullImagePath);

                        isChangeLogo = false;
                    }

                    affectedRowCount = objBLLCompany.UpdateCompanyData(CompanyId, txtName.Text.Trim(), txtAddress.Text.Trim(), txtContactNo.Text.Trim(),
                                                               txtEmail.Text.Trim().ToLower(), txtDescription.Text.Trim(), imageBytes, isChangeLogo, txtFooter.Text.Trim(),
                                                               chkActive.Checked, Session["UserId"].ToString());
                    if (affectedRowCount == 1)
                    {
                        BindCompanyDataToGridView();
                        VisiblePanelGrid();
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Success...', 'Company data successfully updated.');", true);
                        //Response.Redirect(Request.Url.AbsoluteUri);
                    }
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Company data didn\\'t update.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvCompany_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            try
            {
                if (objBLLCompany.DeleteCompanyData(Convert.ToInt32(e.Keys["ID"])) == 1)
                {
                    BindCompanyDataToGridView();
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Success...', 'Company data successfully deleted.');", true);
                }
                else
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Company data didn\\'t delete.');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdd)
                    ClearFormControllersValue();
                else
                    VisiblePanelGrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindCompanyDataToGridView()
        {
            try
            {
                DataSet dsCompany = new DataSet();

                dsCompany = objBLLCompany.RetrieveCompanyData();
                gvCompany.DataSource = dsCompany;
                gvCompany.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void VisiblePanelGrid()
        {
            try
            {
                if (pnlGrid.Visible == false)
                {
                    pnlDetail.Visible = false;
                    pnlGrid.Visible = true;

                    btnView.Visible = false;
                    btnAdd.Visible = true;
                    btnCancel.Visible = false;
                    btnInsert.Visible = false;
                    btnUpdate.Visible = false;

                    ClearFormControllersValue();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void VisiblePanelDetail(string operationType)
        {
            try
            {
                if (pnlDetail.Visible == false)
                {
                    pnlGrid.Visible = false;
                    pnlDetail.Visible = true;

                    btnAdd.Visible = false;
                    btnView.Visible = true;
                    btnCancel.Visible = true;

                    if (operationType.Equals("Add"))
                    {
                        IsAdd = true;

                        btnInsert.Visible = true;
                        btnUpdate.Visible = false;
                    }
                    else if (operationType.Equals("Edit"))
                    {
                        IsAdd = false;

                        btnInsert.Visible = false;
                        btnUpdate.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ClearFormControllersValue()
        {
            try
            {
                txtName.Text = string.Empty;
                txtAddress.Text = string.Empty;
                txtContactNo.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtFooter.Text = string.Empty;
                imageUploader.Attributes.Clear();
                imgPreview.ImageUrl = null;
                chkActive.Checked = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}