using ECOMBLL;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ECOMWebApp.Pages.Client
{
    public partial class ItemMaster : System.Web.UI.Page
    {

        BLLItem objBLLItem = new BLLItem();
        BLLCommonEnum objBLLCommonEnum = new BLLCommonEnum();
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();
        private static int ItemId;
        private static bool IsAdd = true;
        private static byte[] ImageBytes;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["UserId"] != null && objBLLPageLevelSecurity.IsAccessAdmin(Session["UserGroup"].ToString()))
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        Page.Form.Enctype = "multipart/form-data";
                        BindItemDataToGridView();
                        LoadDropDownData();
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

        //Grid Events--------------------------------------------------------------------------------------------------------
        #region Grid Selected Index
        protected void gvItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            ImageBytes = null;

            try
            {
                ItemId = Convert.ToInt32(gvItem.DataKeys[gvItem.SelectedIndex].Value);

                DataSet dsSelectdItem = new DataSet();
                dsSelectdItem = objBLLItem.RetrieveItemData(ItemId);

                if (dsSelectdItem.Tables[0].Rows.Count == 1)
                {
                    DataRow dr = dsSelectdItem.Tables[0].Rows[0];

                    txtName.Text = dr["Name"].ToString();
                    txtSearchDescription.Text = dr["SearchDescription"].ToString();
                    txtUnitPrice.Text = dr["UnitPrice"].ToString();
                    txtMarkPrice.Text = dr["MarkPrice"].ToString();
                    txtDiscountPrice.Text = dr["DiscountPrice"].ToString();
                    txtStdLength.Text =Math.Round(Convert.ToDecimal(dr["StdLength"].ToString()), 2).ToString();
                    txtStdVolume.Text = Math.Round(Convert.ToDecimal(dr["StdVolume"].ToString()), 2).ToString();
                    txtStdWeigth.Text =Math.Round(Convert.ToDecimal(dr["StdWeight"].ToString()), 2).ToString();
                    txtQuntity.Text = dr["Quntity"].ToString();
                    txtMinimumOrderQuantity.Text = dr["MinOrderQty"].ToString();
                    txtRemark.Text = dr["Remark"].ToString();

                    ddlManufactoreComapany.SelectedValue = dr["ItemManufacturingCorporationId"].ToString();
                    ddlItemType.SelectedValue = dr["ItemTypeId"].ToString();
                    ddlItemCategory.SelectedValue = dr["ItemCategoryId"].ToString();
                    ddlIsSalable.SelectedIndex = Convert.ToInt32(dr["IsSellable"]);
                    ddlIsOrdering.SelectedIndex = Convert.ToInt32(dr["IsOderning"]);
                    ddlIsReturnable.SelectedIndex = Convert.ToInt32(dr["IsReturnable"]);
                    ddlIsActive.SelectedIndex = Convert.ToInt32(dr["IsActive"]);

                    txtManufactureDate.Text = Convert.ToDateTime(dr["ManufacturedDate"]).ToString("yyyy-MM-dd");
                    txtExpirationDate.Text = Convert.ToDateTime(dr["ExpirationDate"]).ToString("yyyy-MM-dd");

                    ImageBytes = (byte[])dr["ItemImage"];
                    string base64String = Convert.ToBase64String(ImageBytes, 0, ImageBytes.Length);
                    imgPreview.ImageUrl = "data:image/png;base64," + base64String;
                    imgPreview.Visible = true;

                }
                txtQuntity.Enabled = false;
                VisiblePanelDetail("Edit");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }
        #endregion

        //Button Events------------------------------------------------------------------------------------------------------ 
        #region Button Events

        #region Insert Item Data
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (Validation())
                {
                    ImageBytes = null;
                    if (Page.IsValid)
                    {
                        int rowsAffected = 0;
                        byte[] imageBytes = null;
                        imageBytes = ImageUpload();

                        rowsAffected = objBLLItem.InsertItemMasterData(txtName.Text.Trim(), txtSearchDescription.Text.Trim(), Convert.ToInt32(ddlItemType.SelectedValue),
                                                  Convert.ToInt32(ddlManufactoreComapany.SelectedValue), Convert.ToInt32(ddlItemCategory.SelectedValue), txtRemark.Text.Trim(),
                                                  Convert.ToInt32(txtQuntity.Text), Convert.ToDouble(txtUnitPrice.Text), Convert.ToDouble(txtMarkPrice.Text), Convert.ToDouble(txtDiscountPrice.Text),
                                                  Convert.ToDouble(txtStdLength.Text), Convert.ToDouble(txtStdWeigth.Text), Convert.ToDouble(txtStdVolume.Text), Convert.ToDateTime(txtManufactureDate.Text),
                                                  Convert.ToDateTime(txtExpirationDate.Text), Convert.ToInt32(txtMinimumOrderQuantity.Text), Convert.ToBoolean(ddlIsSalable.SelectedIndex),
                                                  Convert.ToBoolean(ddlIsOrdering.SelectedIndex), Convert.ToBoolean(ddlIsReturnable.SelectedIndex),
                                                  imageBytes, Convert.ToBoolean(ddlIsActive.SelectedIndex), false, "OBSAdmin", DateTime.Now);

                        if (rowsAffected == 1)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Successful', 'The Item has been successfully Inserted.');", true);
                            BindItemDataToGridView();
                            VisiblePanelGrid();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Error', 'A problem has been occurred while submitting your data.');", true);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }
        #endregion

        #region Update Item Data
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int rowsAffected = 0;
                    byte[] imageBytes = null;
                    imageBytes = ImageUpload();
                    rowsAffected = objBLLItem.UpdateItemMasterData(ItemId, txtName.Text.Trim(), txtSearchDescription.Text.Trim(), Convert.ToInt32(ddlItemType.SelectedValue), Convert.ToInt32(ddlManufactoreComapany.SelectedValue),
                                              Convert.ToInt32(ddlItemCategory.SelectedValue), txtRemark.Text.Trim(), Convert.ToInt32(txtQuntity.Text), Convert.ToDouble(txtUnitPrice.Text),
                                              Convert.ToDouble(txtMarkPrice.Text), Convert.ToDouble(txtDiscountPrice.Text), Convert.ToDouble(txtStdLength.Text), Convert.ToDouble(txtStdWeigth.Text),
                                              Convert.ToDouble(txtStdVolume.Text), Convert.ToDateTime(txtManufactureDate.Text), Convert.ToDateTime(txtExpirationDate.Text),
                                              Convert.ToInt32(txtMinimumOrderQuantity.Text), Convert.ToBoolean(ddlIsSalable.SelectedIndex), Convert.ToBoolean(ddlIsOrdering.SelectedIndex), Convert.ToBoolean(ddlIsReturnable.SelectedIndex),
                                              imageBytes, Convert.ToBoolean(ddlIsActive.SelectedIndex), false, "OBSAdmin", DateTime.Now);
                    if (rowsAffected == 1)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Successful', 'The Item has been successfully modified.');", true);
                        BindItemDataToGridView();
                        VisiblePanelGrid();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Error', 'A problem has been occurred while submitting your data.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
            // Response.Redirect(Request.Url.AbsoluteUri);
        }
        #endregion

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                txtQuntity.Enabled = true;
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsAdd)
                {
                    ClearcontrollersValue();
                    //VisiblePanelGrid();
                }
                else
                {
                    VisiblePanelGrid();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        #endregion
        //Methods-------------------------------------------------------------------------------------------------------------

        #region Custom Methods
        private void AvoidDoubleTime()
        {
            Response.Cache.SetNoStore();
            Response.Cache.AppendCacheExtension("no-cache");
            Response.Expires = 0;
        }
        
        private void BindItemDataToGridView()
        {
            try
            {
                DataSet dsItem = new DataSet();
                dsItem = objBLLItem.RetrieveItemData();

                gvItem.DataSource = dsItem;
                gvItem.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void LoadDropDownData()
        {
            LoadDropDownEnum();
            LoadDropDownManufactureCoparation();
            LoadDropDownItemCategory();
            LoadDropDownItemType();
        }

        private void LoadDropDownEnum()
        {
            try
            {
                if (!this.IsPostBack)
                {
                    Array isSellable = Enum.GetValues(typeof(BLLCommonEnum.CommonEnum));
                    foreach (BLLCommonEnum.CommonEnum data in isSellable)
                    {
                        ddlIsSalable.Items.Add(new ListItem(data.ToString(), ((int)data).ToString()));
                        ddlIsOrdering.Items.Add(new ListItem(data.ToString(), ((int)data).ToString()));
                        ddlIsReturnable.Items.Add(new ListItem(data.ToString(), ((int)data).ToString()));
                        ddlIsActive.Items.Add(new ListItem(data.ToString(), ((int)data).ToString()));
                    }


                }
            }

            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('Enum Dropdown Error');", true);
                throw ex;
            }

        }

        private void LoadDropDownItemCategory()
        {
            try
            {
                DataSet dsItemCategory = new DataSet();
                dsItemCategory = objBLLItem.RetrieveItemCategoryData();
                ddlItemCategory.DataSource = dsItemCategory;
                ddlItemCategory.DataBind();
                ddlItemCategory.Items.Insert(0, new ListItem("--Select Product Category--", "0"));
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('Item Category Dropdown Error');", true);
                throw ex;
            }
        }

        private void LoadDropDownManufactureCoparation()
        {
            try
            {
                DataSet dsManufactureCoparation = new DataSet();
                dsManufactureCoparation = objBLLItem.RetrieveItemManufactureCoparationData();
                ddlManufactoreComapany.DataSource = dsManufactureCoparation;
                ddlManufactoreComapany.DataBind();
                ddlManufactoreComapany.Items.Insert(0, new ListItem("--Select Manufacture Coparation--", "0"));
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('Manufacture Coparation Dropdown Error');", true);
                throw ex;
            }
        }

        private void LoadDropDownItemType()
        {
            try
            {
                DataSet dsItemType = new DataSet();
                dsItemType = objBLLItem.RetrieveIteTypeData();
                ddlItemType.DataSource = dsItemType;
                ddlItemType.DataBind();
                ddlItemType.Items.Insert(0, new ListItem("--Select Item Category--", "0"));
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('Item Type Dropdown Error');", true);
                throw ex;
            }
        }

        #region Insert Update Image
        private byte[] ImageUpload()
        {
            byte[] UPImageBytes = null;
            if (ImageUploader.HasFile)
            {
                HttpPostedFile postedFile = ImageUploader.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(fileName);
                int fileSize = postedFile.ContentLength;

                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                UPImageBytes = binaryReader.ReadBytes((int)stream.Length);
            }

            else if (ImageBytes != null)
            {
                UPImageBytes = ImageBytes;
            }
            else
            {
                string nullImagePath = Server.MapPath("~/Images/Null/No_image.png");
                UPImageBytes = System.Text.Encoding.UTF8.GetBytes(nullImagePath);
            }

            return UPImageBytes;
        }

        #endregion

        private void ClearcontrollersValue()
        {
            try
            {
                txtName.Text = string.Empty;
                txtSearchDescription.Text = string.Empty;
                txtUnitPrice.Text = string.Empty;
                txtMarkPrice.Text = string.Empty;
                txtDiscountPrice.Text = string.Empty;
                txtStdLength.Text = string.Empty;
                txtStdVolume.Text = string.Empty;
                txtStdWeigth.Text = string.Empty;
                txtQuntity.Text = string.Empty;
                txtMinimumOrderQuantity.Text = string.Empty;
                txtRemark.Text = string.Empty;

                ddlManufactoreComapany.SelectedIndex = 0;
                ddlItemType.SelectedIndex = 0;
                ddlItemCategory.SelectedIndex = 0;
                ddlIsSalable.SelectedIndex = 0;
                ddlIsOrdering.SelectedIndex = 0;
                ddlIsReturnable.SelectedIndex = 0;
                ddlIsActive.SelectedIndex = 0;

                txtManufactureDate.Text = string.Empty;
                txtExpirationDate.Text = string.Empty;
                ImageUploader.Attributes.Clear();
                imgPreview.ImageUrl = null;
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

                    LbtnView.Visible = false;
                    LbtnAdd.Visible = true;
                    LbtnCancel.Visible = false;
                    btnInsert.Visible = false;
                    btnUpdate.Visible = false;

                    ClearcontrollersValue();
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

                    LbtnAdd.Visible = false;
                    LbtnView.Visible = true;
                    LbtnCancel.Visible = true;

                    if (operationType.Equals("Add"))
                    {
                        IsAdd = true;

                        btnInsert.Visible = true;
                        btnUpdate.Visible = false;
                        LbtnCancel.Text = "Clear";
                    }
                    else if (operationType.Equals("Edit"))
                    {
                        IsAdd = false;

                        btnInsert.Visible = false;
                        btnUpdate.Visible = true;
                        LbtnCancel.Text = "Cancel";
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Validation Fields
        public bool Validation()
        {
            bool Isvalidat = false;

            if (!string.IsNullOrWhiteSpace(txtName.Text) || !string.IsNullOrWhiteSpace(txtSearchDescription.Text) || !string.IsNullOrWhiteSpace(txtUnitPrice.Text)
                || !string.IsNullOrWhiteSpace(txtMarkPrice.Text) || !string.IsNullOrWhiteSpace(txtDiscountPrice.Text) || !string.IsNullOrWhiteSpace(txtStdLength.Text)
                || !string.IsNullOrWhiteSpace(txtStdVolume.Text) || !string.IsNullOrWhiteSpace(txtStdWeigth.Text) || !string.IsNullOrWhiteSpace(txtQuntity.Text)
                || !string.IsNullOrWhiteSpace(txtMinimumOrderQuantity.Text) || !string.IsNullOrWhiteSpace(txtRemark.Text) || !string.IsNullOrWhiteSpace(txtName.Text))
            {
                //no comment
            }

            if (string.IsNullOrWhiteSpace(txtStdLength.Text) && string.IsNullOrWhiteSpace(txtStdVolume.Text) && string.IsNullOrWhiteSpace(txtStdWeigth.Text))
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Empty', 'Please enter atleast one Std.');", true);

            }
            if (string.IsNullOrWhiteSpace(txtStdLength.Text))
            {
                txtStdLength.Text = "0";
                //if (string.IsNullOrWhiteSpace(txtStdVolume.Text))
                //{
                //    txtStdVolume.Text = "0";
                //    if (string.IsNullOrWhiteSpace(txtStdWeigth.Text))
                //    {
                //        txtStdWeigth.Text = "0";
                //        Isvalidat = true;
                //    }
                //}
            }
            if (string.IsNullOrWhiteSpace(txtStdVolume.Text))
            {
                txtStdVolume.Text = "1";
            }
            if (string.IsNullOrWhiteSpace(txtStdWeigth.Text))
            {
                txtStdWeigth.Text = "0";
            }

            if (txtStdVolume.Text.Trim() !=string.Empty || txtStdLength.Text.Trim() != string.Empty|| txtStdWeigth.Text.Trim() != string.Empty)
            {
                Isvalidat = true;
            }


            else
            {
                
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('Please Enter values\\'t .');", true);
                //ScriptManager.RegisterStartupScript(this.btnUpdate, this.btnUpdate.GetType(), "ErrorProvider", "alert('Please Enter values\\'t .');", true);
            }

            return Isvalidat;
        }
        #endregion

        #endregion
    }
}