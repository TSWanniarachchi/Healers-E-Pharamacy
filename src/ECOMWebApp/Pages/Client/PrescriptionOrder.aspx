<%@ Page Title="Medical Prescription Order" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PrescriptionOrder.aspx.cs" Inherits="ECOMWebApp.Pages.Client.PrescriptionOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">

    <style type="text/css">
        .prescrption-content {
            padding: 0px 0px !important;
            width: -webkit-fill-available;
        }

        .content-wrapper {
            width: -webkit-fill-available;
        }

        .DDl {
            width: 128px;
            margin: 0 15px 0 0;
            font: 12px tahoma;
            max-height: 200px;
            overflow-y: scroll;
            position: relative;
        }

        .outofstock {
            padding: 0.375rem 0.4rem;
        }
    </style>

    <script src="../../Plugins/Client/imagezoom/js-image-zoom.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">

    <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="always" ChildrenAsTriggers="true">
        <ContentTemplate>

            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Prescription Orders</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">Order Management</li>
                                <li class="breadcrumb-item active">Prescription Orders</li>
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
                                        <i class="fas fa-notes-medical"></i>
                                        <asp:Label ID="lblFormDescription" runat="server" Text="Medical Prescription Order List"></asp:Label>
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="maximize">
                                            <i class="fas fa-expand"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">

                                    <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%" Height="100%">

                                        <!-- card filter-area -->
                                        <div class="card card-lightblue shadow-sm">

                                            <!-- card-header -->
                                            <div class="card-header" style="height: 38px">
                                                <i class="fas fa-filter"></i>
                                                <h3 class="card-title">Filter Area&nbsp&nbsp&nbsp&nbsp</h3>

                                                <!-- card-tools -->
                                                <div class="card-tools">
                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                </div>
                                                <!-- /.card-tools -->

                                            </div>
                                            <!-- /.card-header -->

                                            <!-- card-body -->
                                            <div class="card-body" style="display: block; height: 60px">
                                                <div class="row">
                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblFromDate" runat="server" Text="From Date" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <asp:TextBox ID="dtpFromDate" runat="server" AutoPostBack="true" OnTextChanged="dtpFromDate_TextChanged"
                                                            CssClass="input-group date" TextMode="Date"></asp:TextBox>
                                                    </div>

                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblToDate" runat="server" Text="To Date" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="dtpToDate" runat="server" AutoPostBack="true" OnTextChanged="dtpToDate_TextChanged"
                                                                CssClass="input-group date" TextMode="Date"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblStatus" runat="server" Text="Status" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                                                CssClass="form-control form-control-sm" Font-Size="15px">
                                                                <asp:ListItem Text="Select All" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Pending" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Confirmed" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Rejected" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.card-body -->

                                        </div>
                                        <!-- /.card filter-area -->

                                        <asp:GridView ID="gvMedicalPrescriptionOrder" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="ID"
                                            CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowHeaderWhenEmpty="True"
                                            OnSelectedIndexChanged="gvMedicalPrescriptionOrder_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="sdf" runat="server" ImageUrl="~/Images/Client/grid/Select.png" CausesValidation="False"
                                                            CommandName="Select" ToolTip="View Details"></asp:ImageButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="25px" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                                                <asp:BoundField DataField="PrescriptionNo" HeaderText="Prescription No" />
                                                <asp:BoundField DataField="Customer" HeaderText="Customer">
                                                    <%--<HeaderStyle Width="300px" />--%>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Address" HeaderText="Address">
                                                    <%--<HeaderStyle Width="200px" />--%>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MobileNo" HeaderText="Contact No">
                                                    <HeaderStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ShowHeader="true">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%--<span class="<%#Eval("badge")%>"><%#Eval("Status")%></span>--%>
                                                        <span class="<%#Eval("Badge")%>" style="font-size: 15px; width: 100px;"><i class="<%#Eval("Icon")%>"></i>
                                                            <%#Eval("Status")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:BoundField DataField="Status" HeaderText="Status">
                                                    <HeaderStyle Width="70px" />
                                                </asp:BoundField>--%>
                                                <%--<asp:TemplateField HeaderText="Prescription">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgPrescription" runat="server" Height="40px" Width="80px"
                                                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("MedicalPrescription")) %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>--%>
                                                <asp:BoundField DataField="Remark" HeaderText="Remark">
                                                    <HeaderStyle Width="100px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CreatedDateTime" HeaderText="Sended Date & Time">
                                                    <%--<HeaderStyle Width="100px" />--%>
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <center>No Medical Prescription Orders found</center>
                                            </EmptyDataTemplate>
                                            <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <RowStyle Wrap="true" />
                                            <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme" />
                                        </asp:GridView>

                                    </asp:Panel>

                                    <asp:Panel ID="pnlDetail" runat="server" Visible="false" Width="100%" Height="100%">

                                        <div class="row mb-3">
                                            <div class="col-md-4">
                                                <asp:Button ID="btnView" runat="server" Text="View Orders" Visible="true" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-theme"
                                                    OnClick="btnView_Click" />
                                            </div>
                                        </div>

                                        <%--Header Details--%>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="info-box">
                                                    <span id="infoOrderReferanceNo" runat="server" class="info-box-icon bg-gradient-blue"><i class="fas fa-cart-arrow-down"></i></span>
                                                    <div class="info-box-content">
                                                        <h5>Order Referance No</h5>
                                                        <p class="text-muted" style="margin: 0px;">
                                                            <asp:Label ID="lblSumOrderNo" runat="server" Font-Size="17px"></asp:Label>
                                                        </p>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="info-box">
                                                    <span id="infoStatus" runat="server" class="info-box-icon bg-warning"><i class="fas fa-info"></i></span>
                                                    <div class="info-box-content">
                                                        <h5>Order Status</h5>
                                                        <p class="text-muted" style="margin: 0px;">
                                                            <asp:Label ID="lblSumStatus" runat="server" Font-Size="17px"></asp:Label>
                                                        </p>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="info-box">
                                                    <span id="infoRequestedOn" runat="server" class="info-box-icon bg-gradient-blue"><i class="fas fa-user-clock"></i></span>
                                                    <div class="info-box-content">
                                                        <h5>Requested Time</h5>
                                                        <p class="text-muted" style="margin: 0px;">
                                                            <asp:Label ID="lblSumRequestedOn" runat="server" Font-Size="17px"></asp:Label>
                                                        </p>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Header Details--%>

                                        <%--Customer Details--%>
                                        <asp:Panel ID="Panel1" runat="server" Visible="false" Width="100%" Height="100%">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="callout callout-info shadow">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <asp:Label ID="lbl01" runat="server" Text="Customer  :" Font-Size="17px" Font-Bold="true"></asp:Label>&nbsp&nbsp
                                                            <asp:Label ID="lblCustomer" runat="server" Font-Size="17px"></asp:Label>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <asp:Label ID="lbl02" runat="server" Text="Contact No  :" Font-Size="17px" Font-Bold="true"></asp:Label>&nbsp&nbsp
                                                            <asp:Label ID="lblContactNo" runat="server" Font-Size="17px"></asp:Label>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <asp:Label ID="lbl03" runat="server" Text="Address  :" Font-Size="17px" Font-Bold="true"></asp:Label>&nbsp&nbsp
                                                            <asp:Label ID="lblAddress" runat="server" Font-Size="17px"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <%--End Customer Details--%>

                                        <div class="row mt-2">
                                            <div class="col-md-4">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-lightblue card-wrapper shadow">
                                                            <div class="card-header" style="height: 42px">
                                                                <h3 class="card-title">Medicle Prescription&nbsp;&nbsp;
                                                                        <i class="fas fa-file-prescription"></i></h3>
                                                                <div class="card-tools">
                                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <!-- /.card-tools -->
                                                            </div>
                                                            <!-- /.card-header -->

                                                            <div class="card-body" style="padding: 4px">
                                                                <%--<div class="ribbon-wrapper ribbon-lg">
                                                                    <div class="ribbon bg-warning text-lg">
                                                                        Pending
                                                                    </div>
                                                                </div>--%>

                                                                <div id="img-container" style="height: 410px;">
                                                                    <asp:Image ID="imgPrescription" runat="server" ImageUrl="../../Images/Temp/1.jpg" CssClass="prescrption-content" BorderWidth="1px" />
                                                                </div>
                                                            </div>
                                                            <!-- /.card-body -->

                                                            <div class="card-foot er" style="padding: 0px !important; height: 42px">
                                                                <div class="row mt-2">
                                                                    <div class="col-4 text-center">
                                                                        <asp:ImageButton ID="imgbtnReset" runat="server" ImageUrl="~/Images/Client/status/arrow-undo.png" ToolTip="Reset" OnClick="imgbtnReset_Click" />
                                                                    </div>
                                                                    <div class="col-4 text-center">
                                                                        <asp:ImageButton ID="imgbtnRotate" runat="server" ImageUrl="~/Images/Client/status/rotate.png" ToolTip="Rotate 90°" OnClick="imgbtnRotate_Click" />
                                                                    </div>
                                                                    <div class="col-4 text-center">
                                                                        <asp:ImageButton ID="imgbtnFlip" runat="server" ImageUrl="~/Images/Client/status/flip-horizontal.png" ToolTip="Flip Y-axis" OnClick="imgbtnFlip_Click" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- /.card-footer -->
                                                        </div>
                                                        <!-- /.card -->
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <asp:Panel ID="pnlPrescriptionItems" runat="server" Visible="false" Width="100%" Height="100%">
                                                            <div class="card card-lightblue card-wrapper shadow">
                                                                <div class="card-header" style="height: 42px">
                                                                    <h3 class="card-title">Prescription Items &nbsp;&nbsp;
                                                                        <i class="fas fa-pills"></i></h3>
                                                                    <div class="card-tools">
                                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                            <i class="fas fa-minus"></i>
                                                                        </button>
                                                                    </div>
                                                                    <!-- /.card-tools -->
                                                                </div>
                                                                <!-- /.card-header -->

                                                                <div class="card-body" style="padding: 3px 8px 0px 8px;">

                                                                    <asp:Panel ID="pnlPrescriptionItemSelector" runat="server" Visible="false" Width="100%" Height="100%">
                                                                        <div class="row mb-2">
                                                                            <div class="col-md-6">
                                                                                <asp:Label ID="lblItemCategory" runat="server" Text="Item Category" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                                <asp:DropDownList ID="ddlItemCategory" runat="server" AutoPostBack="true" size="1" CssClass="form-control form-control-sm"
                                                                                    OnSelectedIndexChanged="ddlItemCategory_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <asp:Label ID="lblItemType" runat="server" Text="Item Type" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                                <asp:DropDownList ID="ddlItemType" runat="server" AutoPostBack="true" CssClass="form-control form-control-sm"
                                                                                    OnSelectedIndexChanged="ddlItemType_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row mb-2">
                                                                            <div class="col-md-6">
                                                                                <asp:Label ID="lblItem" runat="server" Text="Item" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                                <asp:DropDownList ID="ddlItem" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" CssClass="form-control form-control-sm"></asp:DropDownList>
                                                                            </div>

                                                                            <div class="col-md-2">
                                                                                <asp:Label ID="lblAvailableQuantity" runat="server" Text="Available Qty" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                                <br />
                                                                                <asp:TextBox ID="txtAvailableQuantity" runat="server" CssClass="form-control outofstock" Font-Bold="true" Text="" Height="30px" MaxLength="5" ReadOnly="true"></asp:TextBox>
                                                                            </div>

                                                                            <div class="col-md-2">
                                                                                <asp:Label ID="lblQuntity" runat="server" Text="Confirmed Qty" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                                <br />
                                                                                <asp:TextBox ID="txtQuntity" runat="server" CssClass="form-control" TextMode="Number" required="required" Text="" Height="30px" MaxLength="3" ReadOnly="true" min="0" max="10000"></asp:TextBox>
                                                                            </div>

                                                                            <div class="col-md-2">
                                                                                <br />
                                                                                <asp:Button ID="btnAddtoGridView" runat="server" Text="Add" Visible="true" Height="30px" Enabled="true" CssClass="btn btn-block btn-sm btn-theme" Style="padding: 0px" OnClick="btnAddtoGridView_Click" />
                                                                            </div>
                                                                        </div>

                                                                        <hr style="border-width: 2px" />
                                                                    </asp:Panel>

                                                                    <div class="row mb-2 mt-2 mb-2">
                                                                        <div class="col-md-12">

                                                                            <div runat="server" id="altConfirmed" class="alert alert-success alert-dismissible mt-1 mb-3" style="margin: 5px">
                                                                                <h5><i class="fas fa-clipboard-check"></i>&nbsp;&nbsp; This Presentation is confirmed.</h5>
                                                                                <hr />
                                                                                This medical presentation has been already confirmed.
                                                                                <br />
                                                                                Confirmed On = 
                                                                        <asp:Label ID="lblConfirmationOn_1" runat="server"></asp:Label>.
                                                                            </div>

                                                                            <asp:GridView ID="gvPrescriptionItem" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="ItemMasterId"
                                                                                CssClass="" BorderWidth="2px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="True" ShowHeaderWhenEmpty="True" AllowPaging="true"
                                                                                OnRowEditing="gvPrescriptionItem_RowEditing"
                                                                                OnRowCancelingEdit="gvPrescriptionItem_RowCancelingEdit"
                                                                                OnRowUpdating="gvPrescriptionItem_RowUpdating"
                                                                                OnRowDeleting="gvPrescriptionItem_RowDeleting">
                                                                                <Columns>
                                                                                    <asp:CommandField AccessibleHeaderText="Action" HeaderText="Action" ButtonType="Image"
                                                                                        ShowEditButton="true"
                                                                                        EditImageUrl="~/Images/Client/grid/Edit.png"
                                                                                        ShowDeleteButton="true"
                                                                                        DeleteImageUrl="~/Images/Client/grid/Delete.png"
                                                                                        UpdateImageUrl="~/Images/Client/grid/Ok.png"
                                                                                        ShowCancelButton="true"
                                                                                        CancelImageUrl="~/Images/Client/grid/Undo.png" />

                                                                                    <asp:BoundField DataField="ItemMasterId" HeaderText="ID" Visible="false" />
                                                                                    <asp:TemplateField HeaderText="Medicine">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("Item")%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Quantity">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("Quntity")%>
                                                                                        </ItemTemplate>
                                                                                        <EditItemTemplate>
                                                                                            <asp:TextBox ID="grdtxtQuantity" runat="server" Text='<%#Eval("Quntity")%>' TextMode="Number" required="required" min="1" max="10000" MaxLength="5" Width="65px"></asp:TextBox>
                                                                                        </EditItemTemplate>
                                                                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Unit Price (Piese)">
                                                                                        <ItemTemplate>
                                                                                            <%# Eval("UnitPrice", "{0:0.00}") %>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Gross Amount">
                                                                                        <ItemTemplate>
                                                                                            <%# Eval("GrossAmount", "{0:0.00}") %>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Width="120px" />
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Discount Amount">
                                                                                        <ItemTemplate>
                                                                                            <%# Eval("DiscountAmount", "{0:0.00}") %>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Net Amount">
                                                                                        <ItemTemplate>
                                                                                            <%# Eval("NetAmount", "{0:0.00}") %>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <EmptyDataTemplate>
                                                                                    <center>No records found</center>
                                                                                </EmptyDataTemplate>
                                                                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                                                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                                                                                <RowStyle Wrap="true" />
                                                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme" Height="50px" Wrap="true" />
                                                                                <RowStyle Height="8px" HorizontalAlign="Center" />
                                                                                <FooterStyle Height="15px" Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Right" BackColor="#FFFF99" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <!-- /.card-body -->

                                                                <div class="card-footer">
                                                                    <div class="row">
                                                                        <div class="col-md-5"></div>
                                                                        <div class="col-md-7" style="padding-left: 37px">
                                                                            <%-- <h5>Total Gross Amount (Rs.) :	100.00 </h5>
                                                                        <h5>Total Discount Amount (Rs.) :	100.00 </h5>--%>
                                                                            <h3>Total Amount (Rs.) :	  
                                                                <asp:Label ID="lblTotalNetAmount" Text="0.00" runat="server"></asp:Label>
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.card-footer -->
                                                            </div>
                                                        </asp:Panel>

                                                        <asp:Panel ID="pnlRejectAlert" runat="server" Visible="false" Width="100%" Height="100%">
                                                            <div class="card card-lightblue card-wrapper shadow">
                                                                <div class="card-header" style="height: 42px">
                                                                    <h3 class="card-title">Alert &nbsp;&nbsp;
                                                                        <i class="fas fa-exclamation-triangle"></i>
                                                                    </h3>

                                                                    <div class="card-tools">
                                                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                            <i class="fas fa-minus"></i>
                                                                        </button>
                                                                    </div>
                                                                    <!-- /.card-tools -->
                                                                </div>
                                                                <!-- /.card-header -->

                                                                <div class="card-body" style="padding: 3px 8px 0px 8px;">

                                                                    <div class="alert alert-danger alert-dismissible mt-1 mb-1" style="margin: 5px">
                                                                        <h5><i class="icon fas fa-ban"></i>This Presentation is Rejected.</h5>
                                                                        <hr />
                                                                        This medical presentation has been rejected. Reason for that = 
                                                                        <asp:Label ID="lblAlertRejectReason" runat="server" ForeColor="Yellow" Font-Bold="true"></asp:Label>.
                                                                        Please contact prescription sended customer.&emsp;&emsp;

                                                                        <br />
                                                                        Rejected On = 
                                                                        <asp:Label ID="lblConfirmationOn_0" runat="server"></asp:Label>.
                                                                    </div>

                                                                    <div class="text-center">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Client/InvalidPrescription.jpg" Width="450px" Height="294px"></asp:Image>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                        <!-- /.card -->
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <asp:Panel ID="pnlConfirmation" runat="server" Visible="false" Width="100%" Height="100%">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card card-lightblue card-wrapper shadow">
                                                        <div class="card-header" style="height: 42px">
                                                            <h3 class="card-title">Order Confirmation &nbsp;&nbsp;
                                                                        <i class="fas fa-exclamation-triangle"></i></h3>
                                                            <div class="card-tools">
                                                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <!-- /.card-tools -->
                                                        </div>
                                                        <!-- /.card-header -->

                                                        <div class="card-body" style="padding: 3px 8px 0px 8px; height: 75px;">
                                                            <div class="row mb-2">
                                                                <div class="col-md-1"></div>
                                                                <div class="col-md-4">
                                                                    <asp:Label ID="lblConfirmation" runat="server" Text="Confirmation" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddlConfirmation" runat="server" AutoPostBack="true" Height="35px" OnSelectedIndexChanged="ddlConfirmation_SelectedIndexChanged"
                                                                        CssClass="form-control form-control-sm">
                                                                        <asp:ListItem Selected="True" Value="-1">Select One</asp:ListItem>
                                                                        <asp:ListItem Value="1">Confirm</asp:ListItem>
                                                                        <asp:ListItem Value="0">Reject</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <asp:Label ID="lblRemark" runat="server" Text="Remark" Visible="false" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control form-control-sm" Height="35px" Visible="false" placeholder="Enter Remark" pattern="^[a-z A-Z 0-9 ,./-]{3,}$"></asp:TextBox>
                                                                    <asp:Label ID="lblRejectReason" runat="server" Text="Reject Reason*" Visible="false" Font-Size="15px" Font-Bold="true"></asp:Label>
                                                                    <asp:DropDownList ID="ddlRejectReason" runat="server" Visible="false" Height="35px" CssClass="form-control form-control-sm">
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <div class="col-md-2">
                                                                    <br />
                                                                    <asp:Button ID="btnRejectOrder" runat="server" Text="Reject Order" Visible="false" OnClick="btnRejectOrder_Click"
                                                                        CssClass="btn btn-block btn-sm btn-theme" />
                                                                    <asp:Button ID="btnSendToCustomer" runat="server" Text="Send To Customer" Visible="false" OnClick="btnSendToCustomer_Click"
                                                                        CssClass="btn btn-block btn-sm btn-theme" />
                                                                </div>
                                                                <div class="col-md-1"></div>
                                                            </div>
                                                        </div>
                                                        <!-- /.card-body -->

                                                    </div>
                                                    <!-- /.card -->
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </asp:Panel>

                                </div>
                                <!-- /.card-body -->

                                <!-- card-footer -->
                                <div class="card-footer">
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

    <script type="text/javascript">

        //On Page Load
        $(document).ready(function () {
            $('#<%= gvMedicalPrescriptionOrder.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvMedicalPrescriptionOrder.ClientID%>").find("tr:first"))).DataTable({
                stateSave: false,
                lengthChange: true,
                lengthMenu: [[5, 20, 50, -1], [5, 20, 50, "All"]],
                bFilter: true,
                bsort: true,
                bPaginate: true,
                pagingType: "full_numbers"
            });
        });

        // If the width and height of the image are not known or to adjust the image to the container of it
        var options = {
            fillContainer: true
            , offset: { vertical: 0, horizontal: 10 }
            , "zoomPosition": "original"
        };
        new ImageZoom(document.getElementById("img-container"), options);

        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $(document).ready(function () {
                        $('#<%= gvMedicalPrescriptionOrder.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvMedicalPrescriptionOrder.ClientID%>").find("tr:first"))).DataTable({
                            stateSave: false,
                            lengthChange: true,
                            lengthMenu: [[5, 20, 50, -1], [5, 20, 50, "All"]],
                            bFilter: true,
                            bsort: true,
                            bPaginate: true,
                            pagingType: "full_numbers"
                        });
                    });

                    new ImageZoom(document.getElementById("img-container"), options);
                }
            });
        };

    </script>

</asp:Content>
