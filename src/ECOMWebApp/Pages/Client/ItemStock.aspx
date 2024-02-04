<%@ Page Title="ItemStock" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ItemStock.aspx.cs" Inherits="ECOMWebApp.Pages.Client.StockPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style type="text/css">
                  
 table.blueTable 
 {
    width: 100%;
 }
table.blueTable th
{
                   
    position : sticky;
    top : 0;
    background-color:  #0E4B8C;
    color: #E8DCDA;
    z-index: 0;

}
table.header-fixed 
{
    position: fixed;
    top: 0px; display:none;
    background-color:white;
} 
    


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">
     
     <asp:UpdatePanel ID="upForm" runat="server">
        <ContentTemplate>

            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Stock</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item active">Stock</li>
                            </ol>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">

                            <!-- card -->
                            <div class="card card-primary card-outline">

                                <!-- card-header -->
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-warehouse nav-icon"></i>
                                        Stock / View / Edit
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">
                                    <div class="card card-lightblue shadow-sm">
                                            <div class="card-header" style="height: 38px">
                                                <i class="fas fa-filter"></i>
                                                <h3 class="card-title">Selecting Category Area&nbsp;&nbsp;&nbsp;&nbsp;</h3>

                                                <div class="card-tools">
                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                </div>
                                                <!-- /.card-tools -->
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="display: block; height: 70px">

                                                <div class="row">                                                
                                                    <div class="row">
                                                        
                                                          <asp:Label ID="lblproductcategory" runat="server" Text="Products :" Font-Size="16px"></asp:Label>&nbsp;&nbsp;
                                                          <asp:DropDownList ID="Product_Category" runat="server" DataTextField="Name" DataValueField="ID" AutoPostBack="true" CssClass="form-control-sm" Height="30px" Width="160px" OnSelectedIndexChanged="Product_Category_SelectedIndexChanged">
                                                          </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                                                            
                                                          <asp:Label ID="lblitemcategory" runat="server" Text="Items :" Font-Size="16px"></asp:Label>&nbsp;&nbsp;
                                                          <asp:DropDownList ID="Item_Category" runat="server" DataTextField="Name" DataValueField="ID" AutoPostBack="true" CssClass="form-control-sm" Height="30px" Width="120px" OnSelectedIndexChanged="Item_Category_SelectedIndexChanged">
                                                          </asp:DropDownList>
                                                          </div>
                                                </div>

                                            </div>
                                            <!-- /.card-body -->
                                        </div>

                                    <div style="height:380px; overflow:auto" class="ml-2 mr-2">
                                        <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%">

                                            <asp:GridView ID="gvCompany1" runat="server" AutoGenerateColumns="False" 
                                                CssClass="table table-striped table-bordered table-hover blueTable" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" OnRowCancelingEdit="gvCompany1_RowCancelingEdit" OnRowEditing="gvCompany1_RowEditing" OnRowUpdating="gvCompany1_RowUpdating" OnRowDataBound="gvCompany1_RowDataBound">
                                                <Columns>
                                                  
                                                    <asp:TemplateField HeaderStyle-Width="60px">  <%--HeaderStyle-BackColor="#2F4F4F" HeaderStyle-ForeColor="White"--%>
                                                      <ItemTemplate> <asp:ImageButton  ID="btn_Edit" runat="server" ImageUrl="~/Images/Client/grid/Select.png" CommandName="Edit" ToolTip="Edit Stock"></asp:ImageButton></ItemTemplate>
                                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />  
                                                      <EditItemTemplate>  
                                                      <asp:ImageButton ID="btn_Update" runat="server" ImageUrl="~/Images/Client/grid/Edit.png" CommandName="Update" ToolTip="Update Quantity"></asp:ImageButton>&nbsp;&nbsp;&nbsp;
                                                      <asp:ImageButton ID="btn_Cancel" runat="server" ImageUrl="~/Images/Client/grid/Delete.png" CommandName="Cancel" ToolTip="Cancel"></asp:ImageButton>
                                                      </EditItemTemplate> 
                                                    
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblID" runat="server" Text='<%# Eval("StID") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Item Name">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblItemName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>        
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Product Name">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblProductName" runat="server" Text='<%# Eval("ProName") %>'></asp:Label>        
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Item Category">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblItemCategoryName" runat="server" Text='<%# Eval("CatName") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Quantity">
                                                   <ItemTemplate>
                                                   <asp:TextBox ID="txt_Quantity" runat="server" Text='<%#Eval("Quntity") %>' Width="100px" onkeypress="OnlyNumericEntry()" BackColor="Transparent" BorderColor="Transparent" ReadOnly="true" style="text-align: center"></asp:TextBox>
                                                   </ItemTemplate>
                                                   <EditItemTemplate>  
                                                   <asp:TextBox ID="txt_quantity" runat="server" Text='<%#Eval("Quntity") %>' Width="100px" onkeypress="OnlyNumericEntry()"></asp:TextBox>  
                                                   </EditItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Unit Price">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Mark Price">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblMarkPrice" runat="server" Text='<%# Eval("MarkPrice","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Discount Price">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblDiscountPrice" runat="server" Text='<%# Eval("DiscountPrice","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Std Length">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblStdLength" runat="server" Text='<%# Eval("StdLength","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Std Weight">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblStdWeight" runat="server" Text='<%# Eval("StdWeight","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Std Volume">
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblStdVolume" runat="server" Text='<%# Eval("StdVolume","{0:N2}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="MNF Date">
                                                       <HeaderTemplate>
                                                           <asp:Label ID="lblMan" ToolTip="Manufacturing Date" runat="server" Text="MNF Date"></asp:Label>
                                                       </HeaderTemplate>
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblManufatureDate" runat="server" Text='<%# Eval("ManufacturedDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="EXP Date">
                                                   <HeaderTemplate>
                                                    <asp:Label ID="lblExp" ToolTip="Expire Date" runat="server" Text="EXP Date"></asp:Label>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                   <asp:Label ID = "lblExpireDate" runat="server" Text='<%# Eval("ExpirationDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                                   </ItemTemplate>
                                                   </asp:TemplateField>

                                                   
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <center>No matching records found</center>
                                                </EmptyDataTemplate>
                                                <RowStyle Wrap="true" />
                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center"/>
                                            </asp:GridView>

                                        </asp:Panel>
                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <!-- card-footer -->
                                <div class="card-footer">
                                    <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Visible="false" CssClass="btn btn-secondary" Width="100px" OnClick="btnCancel_Click" />
                                    <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" Visible="false" CssClass="btn btn-primary" Width="100px" OnClick="btnUpdate_Click" />
                                </div>
                                <!-- /.card-footer -->

                            </div>
                            <!-- /.card -->

                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- ./row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../../Scripts/sweetalert2.js"></script>
     <script type="text/javascript">

        //On Page Load
      <%--  $(document).ready(function () {
            $('#<%= gvCompany1.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCompany1.ClientID%>").find("tr:first"))).DataTable({
                stateSave: false,
                lengthChange: true,
                lengthMenu: [[5, 20, 50, -1], [5, 20, 50, "All"]],
                bFilter: true,
                bsort: true,
                bPaginate: true,
                pagingType: "full_numbers"
            });
        });

        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $(document).ready(function () {
                        $('#<%= gvCompany1.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCompany1.ClientID%>").find("tr:first"))).DataTable({
                            stateSave: false,
                            lengthChange: true,
                            lengthMenu: [[5, 20, 50, -1], [5, 20, 50, "All"]],
                            bFilter: true,
                            bsort: true,
                            bPaginate: true,
                            pagingType: "full_numbers"
                        });
                    });
                }
            });
         };--%>


         function sweetalert(type, title, message) {
             Swal.fire({
                 icon: type,
                 title: title,
                 text: message,
             })
         }

         function OnlyNumericEntry() {
             if ((event.keyCode < 48 || event.keyCode > 57)) {
                 event.returnValue = false;
             }
         }

     </script>
</asp:Content>
