using ECOMBLL;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Client
{
    public partial class PrescriptionOrder : System.Web.UI.Page
    {
        BLLMedicalPrescription objBLLMedicalPrescription = new BLLMedicalPrescription();
        BLLCommonFunction objBLLCommonFunction = new BLLCommonFunction();
        BLLPageLevelSecurity objBLLPageLevelSecurity = new BLLPageLevelSecurity();
        DataTable dtPrescriptionMedicine = new DataTable();

        private static int MedicalPrescriptionId = 0;
        private static int AvailableQuantity = 0;
        private static bool IsChangeConfirmedQuantity = false;
        private static string OrderStatus = string.Empty;
        private static string FileName;
        private static Bitmap OrgImage;

        private static int Rotate = 0;
        private static int Flip = 0;

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

                        BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
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

        protected void dtpFromDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(dtpFromDate.Text) > Convert.ToDateTime(dtpToDate.Text))
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('info', 'info...', 'From Date cannot be greater than To Date.');", true);

                BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
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

                BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
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
                BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvMedicalPrescriptionOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                MedicalPrescriptionId = Convert.ToInt32(gvMedicalPrescriptionOrder.DataKeys[gvMedicalPrescriptionOrder.SelectedIndex].Value);

                DataSet dsMedicalPrescription = new DataSet();
                dsMedicalPrescription = objBLLMedicalPrescription.RetrieveMedicalPrescriptionOrder(MedicalPrescriptionId);
                if (dsMedicalPrescription.Tables[0].Rows.Count == 1)
                {
                    DataRow dr = dsMedicalPrescription.Tables[0].Rows[0];

                    #region Order Details
                    //Header Details
                    lblSumOrderNo.Text = dr["PrescriptionNo"].ToString();
                    OrderStatus = dr["Status"].ToString();
                    lblSumStatus.Text = OrderStatus;
                    lblSumRequestedOn.Text = dr["RequestedOn"].ToString();

                    //Customer Details
                    lblCustomer.Text = dr["Customer"].ToString();
                    lblContactNo.Text = dr["MobileNo"].ToString();
                    lblAddress.Text = dr["Address"].ToString();

                    //Medical Prescription Image
                    byte[] bytes = (byte[])dr["MedicalPrescription"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgPrescription.ImageUrl = "data:image/png;base64," + base64String;

                    //Others
                    lblTotalNetAmount.Text = "0.00";
                    #endregion

                    #region Order Status Wise Data Changes
                    if (OrderStatus == "Pending")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-warning";
                        infoStatus.Attributes["class"] = "info-box-icon bg-warning";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-warning";

                        BindItemCategory();
                        BindItemType();
                        BindItem(Convert.ToInt32(ddlItemCategory.SelectedValue), Convert.ToInt32(ddlItemType.SelectedValue));
                        BindOrderRejectReason();
                        PopulatePrescriptionItemDataTable();
                    }
                    else if (OrderStatus == "Confirmed")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-success";
                        infoStatus.Attributes["class"] = "info-box-icon bg-success";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-success";

                        lblConfirmationOn_1.Text = dr["ConfirmationOn"].ToString();
                        BindClientConfirmedPrescriptionItemsToGridView(MedicalPrescriptionId);
                    }
                    else if (OrderStatus == "Rejected")
                    {
                        infoOrderReferanceNo.Attributes["class"] = "info-box-icon bg-danger";
                        infoStatus.Attributes["class"] = "info-box-icon bg-danger";
                        infoRequestedOn.Attributes["class"] = "info-box-icon bg-danger";

                        lblAlertRejectReason.Text = dr["RejectReason"].ToString();
                        lblConfirmationOn_0.Text = dr["ConfirmationOn"].ToString();
                    }
                    #endregion

                    #region Prescription Image Tools
                    DataBaseImageSavetoProjectFloder(base64String);

                    Rotate = 0;
                    Flip = 0;
                    #endregion
                }

                VisiblePanels();
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
                VisiblePanels();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private bool PageIsValid()
        {
            //int availableQuantity = txtAvailableQuantity.Text == "Out of Stock" ? 0 : Convert.ToInt32(txtAvailableQuantity.Text);
            Int64 confirmedQuantity = txtQuntity.Text == "" ? 0 : Convert.ToInt64(txtQuntity.Text);

            if (ddlItem.SelectedIndex <= 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Please select medication.');", true);
                return false;
            }

            if (gvPrescriptionItem.Rows.Count > 0)
            {
                dtPrescriptionMedicine = (DataTable)ViewState["Records"];

                // Check whether item is existing in the gridview
                DataView viewItemMasterId = new DataView(dtPrescriptionMedicine);
                DataTable dtDistinctItemMasterId = viewItemMasterId.ToTable(true, "ItemMasterId");
                if (dtDistinctItemMasterId.Rows.Count > 0)
                {
                    foreach (DataRow Row in dtDistinctItemMasterId.Rows)
                    {
                        if (Convert.ToInt32(ddlItem.SelectedValue) == Convert.ToInt32(Row["ItemMasterId"]))
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Selected Medicine - " + ddlItem.SelectedItem.ToString() + " is already added, Please edit added item.');", true);
                            return false;
                        }
                    }
                }
            }

            if (AvailableQuantity == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Selected Medicine - " + ddlItem.SelectedItem.ToString() + " is out of stock.');", true);
                return false;
            }

            if (confirmedQuantity <= 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Confirmed quantity should be greater than 0.');", true);
                return false;
            }

            if (confirmedQuantity > AvailableQuantity)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Confirmed quantity cannot be greater than available quantity.');", true);
                return false;
            }

            return true;
        }

        protected void ddlConfirmation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlConfirmation.SelectedValue == "-1")
            {
                lblRemark.Visible = false;
                txtRemark.Visible = false;
                lblRejectReason.Visible = false;
                ddlRejectReason.Visible = false;
                btnRejectOrder.Visible = false;
                btnSendToCustomer.Visible = false;
            }
            else if (ddlConfirmation.SelectedValue == "0")
            {
                lblRemark.Visible = false;
                txtRemark.Visible = false;
                lblRejectReason.Visible = true;
                ddlRejectReason.Visible = true;
                btnRejectOrder.Visible = true;
                btnSendToCustomer.Visible = false;
            }
            else if (ddlConfirmation.SelectedValue == "1")
            {
                lblRemark.Visible = true;
                txtRemark.Visible = true;
                lblRejectReason.Visible = false;
                ddlRejectReason.Visible = false;
                btnRejectOrder.Visible = false;
                btnSendToCustomer.Visible = true;
            }
        }

        protected void btnSendToCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                if (!IsChangeConfirmedQuantity)
                {
                    dtPrescriptionMedicine = (DataTable)ViewState["Records"];

                    if (dtPrescriptionMedicine.Rows.Count > 0)
                    {
                        //Begin Trans
                        objBLLMedicalPrescription.BeginTransaction();

                        int affectedRowCount = 0;

                        affectedRowCount += objBLLMedicalPrescription.ConfirmationMedicalPrescription(MedicalPrescriptionId, true, txtRemark.Text.ToString().Trim(), -1, Session["UserId"].ToString());
                        foreach (DataRow dr in dtPrescriptionMedicine.Rows)
                        {
                            int itemMasterId = Convert.ToInt32(dr["ItemMasterId"]);
                            int quntity = Convert.ToInt32(dr["Quntity"]);

                            affectedRowCount += objBLLMedicalPrescription.InsertMedicalPrescriptionItem(MedicalPrescriptionId, itemMasterId, quntity, Session["UserId"].ToString());
                        }

                        if (affectedRowCount == dtPrescriptionMedicine.Rows.Count + 1)
                        {
                            //Comit Trans
                            objBLLMedicalPrescription.CommitTransaction();
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'success...', 'The medicine in the prescription has been successfully sent to the customer.');", true);
                            ClearFormControllersValue();
                            BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
                        }
                        else
                        {
                            //Rollback Trans
                            objBLLMedicalPrescription.RollbackTransaction();
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'The medicine in the prescription has not been successfully sent to the customer.');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Select medication first.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Please finish the change confim quantity process at first.');", true);
                }
            }
            catch (Exception ex)
            {
                //Rollback Trans
                objBLLMedicalPrescription.RollbackTransaction();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void btnRejectOrder_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlRejectReason.SelectedIndex > 0)
                {
                    int affectedRowCount = 0;

                    affectedRowCount = objBLLMedicalPrescription.ConfirmationMedicalPrescription(MedicalPrescriptionId, false, "NULL", Convert.ToInt32(ddlRejectReason.SelectedValue), Session["UserId"].ToString());
                    if (affectedRowCount == 1)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'success...', 'Medical prescription order rejected successfully..');", true);
                        ClearFormControllersValue();
                        BindMedicalPrescriptionDataToGridView(Convert.ToDateTime(dtpFromDate.Text), Convert.ToDateTime(dtpToDate.Text), Convert.ToInt32(ddlStatus.SelectedValue));
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Medical prescription order did not reject.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'error...', 'Please select the reject reason.');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindMedicalPrescriptionDataToGridView(DateTime fromDate, DateTime toDate, int status)
        {
            try
            {
                DataSet dsMedicalPrescriptionOrder = new DataSet();

                dsMedicalPrescriptionOrder = objBLLMedicalPrescription.RetrieveMedicalPrescriptionOrder(fromDate, toDate, status);
                gvMedicalPrescriptionOrder.DataSource = dsMedicalPrescriptionOrder;
                gvMedicalPrescriptionOrder.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindOrderRejectReason()
        {
            try
            {
                DataSet dsOrderRejectReason = new DataSet();
                dsOrderRejectReason = objBLLCommonFunction.GetComboOrderRejectReason();

                ddlRejectReason.Items.Clear();
                if (dsOrderRejectReason.Tables[0].Rows.Count > 0)
                {
                    ddlRejectReason.DataTextField = "Description";
                    ddlRejectReason.DataValueField = "ID";
                    ddlRejectReason.DataSource = dsOrderRejectReason;
                    ddlRejectReason.DataBind();
                    ddlRejectReason.Items.Insert(0, new ListItem("Select One", "0"));
                    ddlRejectReason.SelectedIndex = 0;
                }
                else
                {
                    ddlRejectReason.DataSource = dsOrderRejectReason;
                    ddlRejectReason.DataBind();
                    ddlRejectReason.Items.Insert(0, new ListItem("No Data", "0"));
                    ddlRejectReason.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindClientConfirmedPrescriptionItemsToGridView(int medicalPrescriptionId)
        {
            try
            {
                DataSet dsPrescriptionItems = new DataSet();

                dsPrescriptionItems = objBLLMedicalPrescription.RetrieveClientConfirmedPrescriptionItems(medicalPrescriptionId);
                gvPrescriptionItem.DataSource = dsPrescriptionItems;
                gvPrescriptionItem.DataBind();
                this.gvPrescriptionItem.Columns[0].Visible = false;

                //Calculate Sum and display in footer row
                int totalQuntity = dsPrescriptionItems.Tables[0].AsEnumerable().Sum(row => row.Field<int>("Quntity"));
                decimal totalGrossAmount = dsPrescriptionItems.Tables[0].AsEnumerable().Sum(row => row.Field<decimal>("GrossAmount"));
                decimal totalDiscountAmount = dsPrescriptionItems.Tables[0].AsEnumerable().Sum(row => row.Field<decimal>("DiscountAmount"));
                decimal totalNetAmount = dsPrescriptionItems.Tables[0].AsEnumerable().Sum(row => row.Field<decimal>("NetAmount"));

                gvPrescriptionItem.FooterRow.Cells[3].Text = totalQuntity.ToString("N0");
                gvPrescriptionItem.FooterRow.Cells[5].Text = totalGrossAmount.ToString("N2");
                gvPrescriptionItem.FooterRow.Cells[6].Text = totalDiscountAmount.ToString("N2");
                gvPrescriptionItem.FooterRow.Cells[7].Text = totalNetAmount.ToString("N2");

                lblTotalNetAmount.Text = totalNetAmount.ToString("N2");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void VisiblePanels()
        {
            try
            {
                if (pnlGrid.Visible == false)
                {
                    pnlDetail.Visible = false;
                    pnlGrid.Visible = true;

                    lblFormDescription.Text = "Medical Prescription Order List";
                }
                else if (pnlDetail.Visible == false)
                {
                    pnlGrid.Visible = false;
                    pnlDetail.Visible = true;

                    lblFormDescription.Text = "Medical Prescription Order Details";

                    if (OrderStatus == "Pending")
                    {
                        pnlConfirmation.Visible = true;
                        pnlPrescriptionItems.Visible = true;
                        pnlPrescriptionItemSelector.Visible = true;
                        altConfirmed.Visible = false;
                        pnlRejectAlert.Visible = false;
                    }
                    else if (OrderStatus == "Confirmed")
                    {
                        pnlConfirmation.Visible = false;
                        pnlPrescriptionItems.Visible = true;
                        pnlPrescriptionItemSelector.Visible = false;
                        altConfirmed.Visible = true;
                        pnlRejectAlert.Visible = false;
                    }
                    else if (OrderStatus == "Rejected")
                    {
                        pnlConfirmation.Visible = false;
                        pnlPrescriptionItems.Visible = false;
                        pnlPrescriptionItemSelector.Visible = false;
                        altConfirmed.Visible = false;
                        pnlRejectAlert.Visible = true;
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
                ClearPrescriptionItemDataTable();

                imgPrescription.ImageUrl = null;
                ddlConfirmation.SelectedIndex = 0;
                lblRejectReason.Visible = false;
                ddlRejectReason.Visible = false;
                btnRejectOrder.Visible = false;
                btnSendToCustomer.Visible = false;

                VisiblePanels();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region -------------- Image Processing

        private void DataBaseImageSavetoProjectFloder(string base64String)
        {
            try
            {
                string physicalPath = Server.MapPath("~/Images/Temp/");
                string virtualPath = "~/Images/Temp/";

                if (!System.IO.Directory.Exists(physicalPath))
                    System.IO.Directory.CreateDirectory(physicalPath);

                Random randomNo = new Random();
                FileName = "orgPrescription" + randomNo.Next(1, 1000000) + ".png";
                string imagePath = physicalPath + FileName;

                string cleanData = base64String.Replace("data:image/png;base64,", "");
                byte[] imgBytes = System.Convert.FromBase64String(cleanData);
                MemoryStream ms = new MemoryStream(imgBytes);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
                img.Save(imagePath, System.Drawing.Imaging.ImageFormat.Png);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void imgbtnReset_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string virtualPath = "~/Images/Temp/";
                imgPrescription.ImageUrl = virtualPath + FileName;

                Rotate = 0;
                Flip = 0;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void imgbtnRotate_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string physicalPath = Server.MapPath("~/Images/Temp/");
                string virtualPath = "~/Images/Temp/";

                OrgImage = (Bitmap)Bitmap.FromFile(physicalPath + FileName);
                Bitmap temp = OrgImage;
                Bitmap bmap = (Bitmap)temp.Clone();

                Rotate += 1;
                if (Rotate == 1)
                {
                    bmap.RotateFlip(RotateFlipType.Rotate90FlipNone);
                }
                else if (Rotate == 2)
                {
                    bmap.RotateFlip(RotateFlipType.Rotate180FlipNone);
                }
                else if (Rotate == 3)
                {
                    bmap.RotateFlip(RotateFlipType.Rotate270FlipNone);
                }
                else if (Rotate == 4)
                {
                    bmap.RotateFlip(RotateFlipType.RotateNoneFlipNone);
                    Rotate = 0;
                }

                OrgImage = (Bitmap)bmap.Clone();
                Random rnd = new Random();
                int a = rnd.Next();
                OrgImage.Save(Server.MapPath(virtualPath + a + ".png"));
                imgPrescription.ImageUrl = virtualPath + a + ".png";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void imgbtnFlip_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string physicalPath = Server.MapPath("~/Images/Temp/");
                string virtualPath = "~/Images/Temp/";

                OrgImage = (Bitmap)Bitmap.FromFile(physicalPath + FileName);
                Bitmap temp = OrgImage;
                Bitmap bmap = (Bitmap)temp.Clone();

                Flip += 1;
                if (Flip == 1)
                {
                    bmap.RotateFlip(RotateFlipType.Rotate180FlipY);
                }
                else if (Flip == 2)
                {
                    imgPrescription.ImageUrl = virtualPath + FileName;
                    Flip = 0;
                }

                OrgImage = (Bitmap)bmap.Clone();
                Random rnd = new Random();
                int a = rnd.Next();
                OrgImage.Save(Server.MapPath(virtualPath + a + ".png"));
                imgPrescription.ImageUrl = virtualPath + a + ".png";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        #endregion

        #region -------------- Prescription items Grid view processing

        private void BindItemCategory()
        {
            try
            {
                DataSet dsItemCategory = new DataSet();
                dsItemCategory = objBLLCommonFunction.GetComboActiveItemCategory();

                ddlItemCategory.Items.Clear();
                if (dsItemCategory.Tables[0].Rows.Count > 0)
                {
                    ddlItemCategory.DataTextField = "Name";
                    ddlItemCategory.DataValueField = "ID";
                    ddlItemCategory.DataSource = dsItemCategory;
                    ddlItemCategory.DataBind();
                    //ddlItemCategory.Items.Insert(0, new ListItem("Select One", "0"));
                    ddlItemCategory.SelectedIndex = 4;
                }
                else
                {
                    ddlItemCategory.DataSource = dsItemCategory;
                    ddlItemCategory.DataBind();
                    ddlItemCategory.Items.Insert(0, new ListItem("No Data", "0"));
                    ddlItemCategory.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindItemType()
        {
            try
            {
                DataSet dsItemType = new DataSet();
                dsItemType = objBLLCommonFunction.GetComboActiveItemType();

                ddlItemType.Items.Clear();
                if (dsItemType.Tables[0].Rows.Count > 0)
                {
                    ddlItemType.DataTextField = "Name";
                    ddlItemType.DataValueField = "ID";
                    ddlItemType.DataSource = dsItemType;
                    ddlItemType.DataBind();
                    ddlItemType.Items.Insert(0, new ListItem("Select One", "0"));
                    ddlItemType.SelectedIndex = 0;
                }
                else
                {
                    ddlItemType.DataSource = dsItemType;
                    ddlItemType.DataBind();
                    ddlItemType.Items.Insert(0, new ListItem("No Data", "0"));
                    ddlItemType.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindItem(int ItemCategory, int ItemType)
        {
            try
            {
                DataSet dsItem = new DataSet();
                dsItem = objBLLCommonFunction.GetComboActiveItem(ItemCategory, ItemType);

                ddlItem.Items.Clear();
                if (dsItem.Tables[0].Rows.Count > 0)
                {
                    ddlItem.DataTextField = "Name";
                    ddlItem.DataValueField = "ID";
                    ddlItem.DataSource = dsItem;
                    ddlItem.DataBind();
                    ddlItem.Items.Insert(0, new ListItem("Select One", "0"));
                    ddlItem.SelectedIndex = 0;
                }
                else
                {
                    ddlItem.DataSource = dsItem;
                    ddlItem.DataBind();
                    ddlItem.Items.Insert(0, new ListItem("No Data", "0"));
                    ddlItem.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlItemCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlItemType.SelectedIndex = 0;
                BindItem(Convert.ToInt32(ddlItemCategory.SelectedValue), Convert.ToInt32(ddlItemType.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void ddlItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindItem(Convert.ToInt32(ddlItemCategory.SelectedValue), Convert.ToInt32(ddlItemType.SelectedValue));
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlItem.SelectedIndex > 0)
                {
                    DataSet dsAvailableQuantity = new DataSet();
                    dsAvailableQuantity = objBLLCommonFunction.GetItemAvailableQuantity(Convert.ToInt32(ddlItem.SelectedValue));
                    if (dsAvailableQuantity.Tables[0].Rows.Count == 1)
                    {
                        DataRow dr = dsAvailableQuantity.Tables[0].Rows[0];

                        int availableQuantity = Convert.ToInt32(dr["Quntity"].ToString());
                        if (availableQuantity > 0)
                        {
                            txtAvailableQuantity.BackColor = System.Drawing.ColorTranslator.FromHtml("#66ff33");
                            AvailableQuantity = availableQuantity;
                            txtAvailableQuantity.Text = availableQuantity.ToString();
                            txtQuntity.Text = "0";
                            txtQuntity.ReadOnly = false;
                        }
                        else if (availableQuantity == 0)
                        {
                            txtAvailableQuantity.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
                            AvailableQuantity = 0;
                            txtAvailableQuantity.Text = "Out of Stock";
                            txtQuntity.Text = "";
                            txtQuntity.ReadOnly = true;
                        }
                        else
                        {
                            txtAvailableQuantity.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff9999");
                            AvailableQuantity = 0;
                            txtAvailableQuantity.Text = "0";
                            txtQuntity.ReadOnly = true;
                        }
                    }
                }
                else
                {
                    AvailableQuantity = -1;
                    txtAvailableQuantity.Text = "";
                    txtQuntity.Text = "";
                    txtQuntity.ReadOnly = true;
                    txtAvailableQuantity.BackColor = System.Drawing.ColorTranslator.FromHtml("#E9ECEF");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void PopulatePrescriptionItemDataTable()
        {
            try
            {
                if (ViewState["Records"] == null)
                {
                    dtPrescriptionMedicine.Columns.Add("ItemMasterId", typeof(Int32));
                    dtPrescriptionMedicine.Columns.Add("Item", typeof(String));
                    dtPrescriptionMedicine.Columns.Add("Quntity", typeof(Int32));
                    dtPrescriptionMedicine.Columns.Add("UnitPrice", typeof(double));
                    dtPrescriptionMedicine.Columns.Add("GrossAmount", typeof(double));
                    dtPrescriptionMedicine.Columns.Add("DiscountAmount", typeof(double));
                    dtPrescriptionMedicine.Columns.Add("NetAmount", typeof(double));
                    ViewState["Records"] = dtPrescriptionMedicine;

                    gvPrescriptionItem.DataSource = dtPrescriptionMedicine;
                    gvPrescriptionItem.DataBind();
                }
                else
                {
                    ClearPrescriptionItemDataTable();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ClearPrescriptionItemDataTable()
        {
            try
            {
                dtPrescriptionMedicine = (DataTable)ViewState["Records"];
                dtPrescriptionMedicine.Rows.Clear();
                gvPrescriptionItem.DataSource = dtPrescriptionMedicine;
                gvPrescriptionItem.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAddtoGridView_Click(object sender, EventArgs e)
        {
            try
            {
                if (PageIsValid())
                {
                    int itemMasterId = 0;
                    string itemName = string.Empty;
                    int quntity = 0;
                    double unitPrice = 0.00;
                    double unitMarkPrice = 0.00;
                    double unitDiscountPrice = 0.00;
                    double grossAmount = 0.00;
                    double discountAmount = 0.00;
                    double netAmount = 0.00;

                    itemMasterId = Convert.ToInt32(ddlItem.SelectedValue);
                    itemName = ddlItem.SelectedItem.ToString();
                    quntity = Convert.ToInt32(txtQuntity.Text);
                    dtPrescriptionMedicine = (DataTable)ViewState["Records"];

                    DataTable dtItemPrice = objBLLCommonFunction.GetItemPrice(itemMasterId).Tables[0];
                    if (dtItemPrice.Rows.Count == 1)
                    {
                        DataRow dr = dtItemPrice.Rows[0];

                        itemName = dr["Name"].ToString();
                        unitPrice = Convert.ToDouble(dr["UnitPrice"]);
                        unitMarkPrice = Convert.ToDouble(dr["UnitMarkPrice"]);
                        unitDiscountPrice = Convert.ToDouble(dr["UnitDiscountPrice"]);

                        grossAmount = quntity * unitMarkPrice;
                        discountAmount = quntity * unitDiscountPrice;
                        netAmount = grossAmount - discountAmount;
                    }

                    dtPrescriptionMedicine.Rows.Add(itemMasterId, itemName, quntity, unitMarkPrice, grossAmount, discountAmount, netAmount);
                    BindPrescriptionItemDataToGridView(dtPrescriptionMedicine);

                    ddlItemType.SelectedIndex = 0;
                    ddlItem.SelectedIndex = 0;
                    txtQuntity.Text = "";
                    txtQuntity.ReadOnly = true;
                    txtAvailableQuantity.Text = "";
                    txtAvailableQuantity.ReadOnly = true;
                    txtAvailableQuantity.BackColor = System.Drawing.ColorTranslator.FromHtml("#E9ECEF");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvPrescriptionItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvPrescriptionItem.EditIndex = e.NewEditIndex;
                IsChangeConfirmedQuantity = true;

                dtPrescriptionMedicine = (DataTable)ViewState["Records"];
                BindPrescriptionItemDataToGridView(dtPrescriptionMedicine);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvPrescriptionItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gvPrescriptionItem.EditIndex = -1;
                IsChangeConfirmedQuantity = false;

                dtPrescriptionMedicine = (DataTable)ViewState["Records"];
                BindPrescriptionItemDataToGridView(dtPrescriptionMedicine);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvPrescriptionItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int itemMasterId = Convert.ToInt32(gvPrescriptionItem.DataKeys[e.RowIndex].Values[0]);
                int changeQuntity = Convert.ToInt32((gvPrescriptionItem.Rows[e.RowIndex].FindControl("grdtxtQuantity") as TextBox).Text);

                dtPrescriptionMedicine = (DataTable)ViewState["Records"];
                DataRow dtrow = dtPrescriptionMedicine.Select("ItemMasterId=" + itemMasterId.ToString() + "").FirstOrDefault();
                string ItemName = dtrow["Item"].ToString();

                if (changeQuntity <= AvailableQuantity)
                {
                    double grossAmount = 0.00;
                    double discountAmount = 0.00;
                    double netAmount = 0.00;

                    DataTable dtItemPrice = objBLLCommonFunction.GetItemPrice(itemMasterId).Tables[0];
                    if (dtItemPrice.Rows.Count == 1)
                    {
                        DataRow dr = dtItemPrice.Rows[0];

                        double unitMarkPrice = Convert.ToDouble(dr["UnitMarkPrice"]);
                        double unitDiscountPrice = Convert.ToDouble(dr["UnitDiscountPrice"]);

                        grossAmount = changeQuntity * unitMarkPrice;
                        discountAmount = changeQuntity * unitDiscountPrice;
                        netAmount = grossAmount - discountAmount;
                    }

                    dtrow["Quntity"] = changeQuntity;
                    dtrow["GrossAmount"] = grossAmount;
                    dtrow["DiscountAmount"] = discountAmount;
                    dtrow["NetAmount"] = netAmount;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('error', 'Error...', 'Available " + ItemName.ToString() + " quantity is " + AvailableQuantity.ToString() + " and you have entered confirmed quntity more than avilable quantity.');", true);
                }

                IsChangeConfirmedQuantity = false;
                gvPrescriptionItem.EditIndex = -1;
                BindPrescriptionItemDataToGridView(dtPrescriptionMedicine);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvPrescriptionItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (ViewState["Records"] != null)
            {
                int ItemMasterId = Convert.ToInt32(e.Keys["ItemMasterId"]);
                dtPrescriptionMedicine = (DataTable)ViewState["Records"];

                for (int i = dtPrescriptionMedicine.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = dtPrescriptionMedicine.Rows[i];
                    if (Convert.ToInt32(dr["ItemMasterId"]) == ItemMasterId)
                        dr.Delete();
                }
                dtPrescriptionMedicine.AcceptChanges();

                BindPrescriptionItemDataToGridView(dtPrescriptionMedicine);
            }
        }

        private void BindPrescriptionItemDataToGridView(DataTable dataTable)
        {
            try
            {
                gvPrescriptionItem.DataSource = dataTable;
                gvPrescriptionItem.DataBind();

                //Calculate Sum and display in footer row
                int totalQuntity = dataTable.AsEnumerable().Sum(row => row.Field<int>("Quntity"));
                double totalGrossAmount = dataTable.AsEnumerable().Sum(row => row.Field<double>("GrossAmount"));
                double totalDiscountAmount = dataTable.AsEnumerable().Sum(row => row.Field<double>("DiscountAmount"));
                double totalNetAmount = dataTable.AsEnumerable().Sum(row => row.Field<double>("NetAmount"));

                gvPrescriptionItem.FooterRow.Cells[3].Text = totalQuntity.ToString("N0");
                gvPrescriptionItem.FooterRow.Cells[5].Text = totalGrossAmount.ToString("N2");
                gvPrescriptionItem.FooterRow.Cells[6].Text = totalDiscountAmount.ToString("N2");
                gvPrescriptionItem.FooterRow.Cells[7].Text = totalNetAmount.ToString("N2");

                lblTotalNetAmount.Text = totalNetAmount.ToString("N2");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }
}