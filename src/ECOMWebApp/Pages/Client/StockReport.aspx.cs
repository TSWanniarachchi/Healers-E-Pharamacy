using ECOMBLL;
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Client
{
    public partial class StockReport : System.Web.UI.Page
    {
        BLLStock objBLLStock = new BLLStock();
        BLLCommonFunction objBLLCommonFunction = new BLLCommonFunction();



        private static int stockId;
        private int totquantity= 0;
        private decimal totuprice = (decimal)0.0;
        private decimal totmprice = (decimal)0.0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] != null)
                {
                    //Page load event
                    if (!Page.IsPostBack)
                    {
                        ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                        scriptManager.RegisterPostBackControl(this.ExportData);
                        BindDataToCompanyGridView();
                        BindGridviewFooter();
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
                    pnlGrid.Visible = true;
                    ClearcontrollersValue();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        protected void gvCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
            ClearcontrollersValue();
        }

        private void BindDataToCompanyGridView()
        {
            try
            {
                gvCompany.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvCompany.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvCompany.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvCompany.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvCompany.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[5].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[6].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[7].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[8].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[9].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvCompany.Columns[10].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvCompany.Columns[11].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                DataSet dsCompany = new DataSet();
                dsCompany = objBLLStock.RetrieveStockDetails();

                gvCompany.DataSource = dsCompany;
                gvCompany.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void BindGridviewFooter()
        {
            gvCompany.FooterRow.Cells[0].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[1].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[2].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[3].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[4].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[5].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[8].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[9].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[10].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[11].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvCompany.FooterRow.Cells[2].Text = "Total :";
            gvCompany.FooterRow.Cells[2].Font.Bold = true;
            gvCompany.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            gvCompany.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Center;
            gvCompany.FooterRow.Cells[3].Font.Bold = true;
            gvCompany.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            gvCompany.FooterRow.Cells[4].Font.Bold = true;
            gvCompany.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            gvCompany.FooterRow.Cells[5].Font.Bold = true;
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
                    //Product_Category.DataTextField = "Name";
                    //Product_Category.DataValueField = "ID";
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
                    //Item_Category.DataTextField = "Name";
                    //Item_Category.DataValueField = "ID";
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

        protected void gvCompany_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void gvCompany_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totquantity += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Quntity"));
                totuprice += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "UnitPrice"));
                totmprice += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "MarkPrice"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = String.Format("{0}", totquantity);
                if (e.Row.Cells[3].Text.Equals(e.Row.Cells[3].Text))
                {
                    e.Row.Cells[0].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[1].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[2].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[3].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[4].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[5].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[8].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[9].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[10].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[11].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Font.Bold = true;
                    e.Row.Cells[2].Text = "Total :";
                    e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Center;
                    e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                }
                e.Row.Cells[4].Text = String.Format("{0:N2}", totuprice);
                e.Row.Cells[5].Text = String.Format("{0:N2}", totmprice);
            }
        }

        protected void ExportData_Click(object sender, EventArgs e)
        {
            // Clear all content output from the buffer stream
            Response.ClearContent();
            // Specify the default file name using "content-disposition" RESPONSE header
            Response.AppendHeader("content-disposition", "attachment; filename=StockSummery.xls");
            // Set excel as the HTTP MIME type
            Response.ContentType = "application/excel";
            // Create an instance of stringWriter for writing information to a string
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();



            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // Set white color as the background color for gridview header row
            gvCompany.HeaderRow.Style.Add("background-color", "#FFFFFF"); 
            gvCompany.HeaderRow.Style.Add("color", "#E8DCDA");

            // Set background color of each cell of GridView1 header row
            foreach (TableCell tableCell in gvCompany.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#0E4B8C";
            }

            // Set background color of each cell of each data row of GridView1
            foreach (GridViewRow gridViewRow in gvCompany.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            gvCompany.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

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
                    gvCompany.DataSource = dsSelectdCompany;
                    gvCompany.DataBind();

                }
                else 
                {
                    gvCompany.DataSource = dsSelectdCompany;
                    DataRow dr = dsSelectdCompany.Tables[0].Rows[0];
                    gvCompany.DataBind();
                    ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                    scriptManager.RegisterPostBackControl(this.ExportData);

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
                    gvCompany.DataSource = dsSelectdCompany;
                    gvCompany.DataBind();

                }
                else
                {
                    gvCompany.DataSource = dsSelectdCompany;
                    DataRow dr = dsSelectdCompany.Tables[0].Rows[0];
                    gvCompany.DataBind();
                    ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                    scriptManager.RegisterPostBackControl(this.ExportData);

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }
    }
}