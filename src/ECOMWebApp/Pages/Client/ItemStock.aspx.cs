using ECOMBLL;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Client
{
    public partial class ItemStock : System.Web.UI.Page
    {
        BLLStock objBLLStock = new BLLStock();
        BLLCommonFunction objBLLCommonFunction = new BLLCommonFunction();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null)
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        BindDataToCompanyGridView();
                        BindProductCategory();
                        BindItem();
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //if (pnlDetail.Visible == false)
                //{
                //    pnlGrid.Visible = false;
                //    pnlDetail.Visible = true;

                //    btnAdd.Visible = false;
                //    btnView.Visible = true;
                //    btnCancel.Visible = true;
                //    btnInsert.Visible = true;
                //    btnUpdate.Visible = false;
                //}
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
                if (pnlGrid.Visible == false)
                {
                    //pnlDetail.Visible = false;
                    pnlGrid.Visible = true;

                    //btnView.Visible = false;
                    //btnAdd.Visible = true;
                    btnCancel.Visible = false;
                    //btnInsert.Visible = false;
                    btnUpdate.Visible = false;

                    ClearcontrollersValue();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void OnCheckedChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //if (pnlDetail.Visible == true)
            //{
            //    pnlDetail.Visible = false;
            //    pnlGrid.Visible = true;
            //}

            ClearcontrollersValue();
        }

        private void BindDataToCompanyGridView()
        {
            try
            {
                DataSet dsCompany = new DataSet();
                dsCompany = objBLLStock.RetrieveStockDetails();

                gvCompany1.DataSource = dsCompany;
                gvCompany1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ClearcontrollersValue()
        {
            try
            {
                //txtName.Text = string.Empty;
                //txtAddress.Text = string.Empty;
                //txtContactNo.Text = string.Empty;
                //txtEmail.Text = string.Empty;
                //txtDescription.Text = string.Empty;
                //txtFooter.Text = string.Empty;
                //ImageUploader.Attributes.Clear();
                //imgPreview.ImageUrl = null;
                //chkActive.Checked = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindProductCategory()
        {
            try
            {
                DataSet dsItemCategory = new DataSet();
                dsItemCategory = objBLLCommonFunction.GetComboActiveProductCategory();



                Product_Category.Items.Clear();
                if (dsItemCategory.Tables[0].Rows.Count > 0)
                {
                    Product_Category.DataTextField = "Name";
                    Product_Category.DataValueField = "ID";
                    Product_Category.DataSource = dsItemCategory;
                    Product_Category.DataBind();
                    Product_Category.Items.Insert(0, new ListItem("Select All", "%"));
                    Product_Category.SelectedIndex = 0;
                }
                else
                {
                    Product_Category.DataSource = dsItemCategory;
                    Product_Category.DataBind();
                    Product_Category.Items.Insert(0, new ListItem("No Data", "%"));
                    Product_Category.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindItem()
        {
            try
            {
                DataSet dsItem = new DataSet();
                dsItem = objBLLCommonFunction.GetComboActiveItemsSet();



                 Item_Category.Items.Clear();
                if (dsItem.Tables[0].Rows.Count > 0)
                {
                    Item_Category.DataTextField = "Name";
                    Item_Category.DataValueField = "ID";
                    Item_Category.DataSource = dsItem;
                    Item_Category.DataBind();
                    Item_Category.Items.Insert(0, new ListItem("Select All", "%"));
                    Item_Category.SelectedIndex = 0;
                }
                else
                {
                    Item_Category.DataSource = dsItem;
                    Item_Category.DataBind();
                    Item_Category.Items.Insert(0, new ListItem("No Data", "%"));
                    Item_Category.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Product_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                string proid = Product_Category.SelectedValue.ToString();
                string itmid = Item_Category.SelectedValue.ToString();

                DataSet dsSelectdCompany = new DataSet();
                dsSelectdCompany = objBLLStock.RetrieveStockDetailsByProduct(proid, itmid);

                if (dsSelectdCompany.Tables[0].Rows.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'No Data Record Found In This Product.');", true);
                    gvCompany1.DataSource = dsSelectdCompany;
                    gvCompany1.DataBind();

                }
                else
                {
                    gvCompany1.DataSource = dsSelectdCompany;
                    DataRow dr = dsSelectdCompany.Tables[0].Rows[0];
                    gvCompany1.DataBind();
                    
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void Item_Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                string proid = Product_Category.SelectedValue.ToString();
                string itmid = Item_Category.SelectedValue.ToString();

                DataSet dsSelectdCompany = new DataSet();
                dsSelectdCompany = objBLLStock.RetrieveStockDetailsByItem(proid, itmid);


                if (dsSelectdCompany.Tables[0].Rows.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'No Data Record Found In This Item.');", true);
                    gvCompany1.DataSource = dsSelectdCompany;
                    gvCompany1.DataBind();
                }
                else
                {
                    gvCompany1.DataSource = dsSelectdCompany;
                    DataRow dr = dsSelectdCompany.Tables[0].Rows[0];
                    gvCompany1.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvCompany1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCompany1.EditIndex = -1;
            BindDataToCompanyGridView();
        }

        protected void gvCompany1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCompany1.EditIndex = e.NewEditIndex;
            BindDataToCompanyGridView();
        }

        protected void gvCompany1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["DefualtConnection"].ConnectionString;
                SqlConnection con;
                Label id = gvCompany1.Rows[e.RowIndex].FindControl("lblID") as Label;
                TextBox qty = gvCompany1.Rows[e.RowIndex].FindControl("txt_quantity") as TextBox;
                con = new SqlConnection(cs);
                con.Open();
                //updating the record  
                SqlCommand cmd = new SqlCommand("Update ItemMaster set Quntity='" + Convert.ToInt32(qty.Text) + "' where ID=" + Convert.ToInt32(id.Text), con);
                int a = cmd.ExecuteNonQuery();
                if(a > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('success', 'Successfull', 'Quantity Updated Successfully.');", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'UnSuccessfull', 'Quantity Updated UnSuccessfully.');", true);
                }
                con.Close();
                gvCompany1.EditIndex = -1;
                BindDataToCompanyGridView();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
           
        }

        protected void gvCompany1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string dateText = ((Label)e.Row.FindControl("lblExpireDate")).Text;

                if (!string.IsNullOrEmpty(dateText))
                {
                    DateTime dateValue = DateTime.ParseExact(dateText, "MM/dd/yyyy", null);

                    if (dateValue <= DateTime.Now.AddDays(15))
                    {
                        e.Row.Cells[13].BackColor = Color.Red;
                    }
                    else if (dateValue >= DateTime.Now.AddDays(16) && dateValue <= DateTime.Now.AddDays(30))
                    {
                        e.Row.Cells[13].BackColor = Color.Yellow;
                    }
                    else
                    {
                        e.Row.Cells[13].BackColor = Color.LightGreen;
                    }
                }
                else
                {
                    e.Row.Cells[13].BackColor = Color.LightGreen;
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int a = Convert.ToInt32(((TextBox)e.Row.FindControl("txt_Quantity")).Text);

                if (a == 0)
                {
                    e.Row.Cells[5].BackColor = Color.Red;
                }
                else if (a >= 0 && a <= 8)
                {
                    e.Row.Cells[5].BackColor = Color.Yellow;
                }
                else if (a >= 9 && a <= 1000)
                {
                    e.Row.Cells[5].BackColor = Color.LightGreen;
                }
                else
                {
                    e.Row.Cells[5].BackColor = Color.LightGreen;
                }
            }

        }
    }
}