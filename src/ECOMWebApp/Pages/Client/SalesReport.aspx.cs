using ECOMBLL;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMWebApp.Pages.Client
{
    public partial class SalesReport : System.Web.UI.Page
    {
        BLLSales objBLLSales = new BLLSales();

        private decimal totgrossamount = (decimal)0.0;
        private decimal totdiscountamount = (decimal)0.0;
        private decimal totnetamount = (decimal)0.0;

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
                        txtfromDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        txttoDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                        BindDataToSalesGridView();
                        BindGridviewFooter();
                        BindFromDateGridView();
                        BindToDateGridView();
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
                   
                    //btnInsert.Visible = false;
                    

                    ClearcontrollersValue();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }
       

        

        private void BindDataToSalesGridView()
        {
            try
            {
                gvSales.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvSales.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvSales.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                gvSales.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvSales.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvSales.Columns[5].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                gvSales.Columns[6].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                DataSet dsSales = new DataSet();
                dsSales = objBLLSales.RetrieveInvoiceDetails();

                gvSales.DataSource = dsSales;
                gvSales.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindGridviewFooter()
        {
            gvSales.FooterRow.Cells[1].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[2].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[3].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[4].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[5].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF99");
            gvSales.FooterRow.Cells[2].Text = "Total :";
            gvSales.FooterRow.Cells[2].Font.Bold = true;
            gvSales.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            gvSales.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            gvSales.FooterRow.Cells[3].Font.Bold = true;
            gvSales.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            gvSales.FooterRow.Cells[4].Font.Bold = true;
            gvSales.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            gvSales.FooterRow.Cells[5].Font.Bold = true;
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

        protected void gvSales_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totgrossamount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalGrossAmount"));
                totdiscountamount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalDiscountAmount"));
                totnetamount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalNetAmount"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = String.Format("{0:N2}", totgrossamount);
                if (e.Row.Cells[3].Text.Equals(e.Row.Cells[3].Text))
                {
                    e.Row.Cells[1].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[2].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[3].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[4].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[5].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF99");
                    e.Row.Font.Bold = true;
                    e.Row.Cells[2].Text = "Total :";
                    e.Row.HorizontalAlign = HorizontalAlign.Right;
                }
                e.Row.Cells[4].Text = String.Format("{0:N2}", totdiscountamount);
                e.Row.Cells[5].Text = String.Format("{0:N2}", totnetamount);
            }
        }

        protected void TxtfromDate_TextChanged(object sender, EventArgs e)
        {
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.ExportData);
            try
            {
                if (Convert.ToDateTime(txtfromDate.Text) > Convert.ToDateTime(txttoDate.Text))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'From Date cannot be greater than To Date.');", true);
                    BindFromDateGridView();
                }
                else
                {
                    BindFromDateGridView();
                    ScriptManager scriptManage = ScriptManager.GetCurrent(this.Page);
                    scriptManage.RegisterPostBackControl(this.ExportData);
                }
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindFromDateGridView()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = objBLLSales.RetrieveInvoiceDetailsByDate(Convert.ToDateTime(txtfromDate.Text), Convert.ToDateTime(txttoDate.Text));
                gvSales.DataSource = ds;
                gvSales.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void txttoDate_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(txtfromDate.Text) > Convert.ToDateTime(txttoDate.Text))
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "popup", "sweetalert('warning', 'Warning...', 'To Date cannot be less than From Date.');", true);
                    BindToDateGridView();
                }
                else
                {
                    BindToDateGridView();
                    ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                    scriptManager.RegisterPostBackControl(this.ExportData);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ErrorProvider", "alert('" + ex.Message.Replace("'", "") + "');", true);
            }
        }

        private void BindToDateGridView()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = objBLLSales.RetrieveInvoiceDetailsByDate(Convert.ToDateTime(txtfromDate.Text), Convert.ToDateTime(txttoDate.Text));
                gvSales.DataSource = ds;
                gvSales.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        protected void ExportData_Click(object sender, EventArgs e)
        {
            // Clear all content output from the buffer stream
            Response.ClearContent();
            // Specify the default file name using "content-disposition" RESPONSE header
            Response.AppendHeader("content-disposition", "attachment; filename=SalesSummery.xls");
            // Set excel as the HTTP MIME type
            Response.ContentType = "application/excel";
            // Create an instance of stringWriter for writing information to a string
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();



            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // Set white color as the background color for gridview header row
            gvSales.HeaderRow.Style.Add("background-color", "#FFFFFF");
            gvSales.HeaderRow.Style.Add("color", "#E8DCDA");

            // Set background color of each cell of GridView1 header row
            foreach (TableCell tableCell in gvSales.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#0E4B8C";
            }

            // Set background color of each cell of each data row of GridView1
            foreach (GridViewRow gridViewRow in gvSales.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            gvSales.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
}