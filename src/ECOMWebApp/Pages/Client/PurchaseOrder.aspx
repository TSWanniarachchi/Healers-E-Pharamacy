<%@ Page Title="Purchase Orders" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="ECOMWebApp.Pages.Client.PurchaseOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">

    <style>
        .vl {
            border-left: 6px solid #dbe1dd;
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
                            <h1 class="m-0">Pre Orders</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">Order Management</li>
                                <li class="breadcrumb-item active">Pre Orders</li>
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
                            <div class="card card-primary card-outline shadow-sm">

                                <!-- card-header -->
                                <div class="card-header">
                                    <h3 class="card-title">
                                        <i class="fas fa-cart-plus"></i>
                                        <asp:Label ID="lblFormDescription" runat="server" Text="Pre Requested Order List"></asp:Label>
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

                                    <asp:Panel ID="pnlGrid" runat="server" Visible="true">

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
                                            <div class="card-body" style="display: block; height: 65px">

                                                <div class="row">
                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblfaFromDate" runat="server" Text="From Date" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="dtpFromDate" runat="server" AutoPostBack="true" OnTextChanged="dtpFromDate_TextChanged"
                                                            CssClass="input-group date" TextMode="Date"></asp:TextBox>
                                                    </div>

                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblfaToDate" runat="server" Text="To Date" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="dtpToDate" runat="server" AutoPostBack="true" OnTextChanged="dtpToDate_TextChanged"
                                                                CssClass="input-group date" TextMode="Date"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-1" style="text-align: end;">
                                                        <asp:Label ID="lblfaOrderType" runat="server" Text="Order Type" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <asp:DropDownList ID="ddlOrderType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderType_SelectedIndexChanged"
                                                                CssClass="form-control form-control-sm" Font-Size="15px">
                                                                <asp:ListItem Text="Selact All" Value="0" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Prescription Order" Value="Prescription"></asp:ListItem>
                                                                <asp:ListItem Text="Item Cart Order" Value="Item Cart"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-1" style="text-align: end">
                                                        <asp:Label ID="lblfaStatus" runat="server" Text="Status" Font-Size="15px"></asp:Label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"
                                                                CssClass="form-control form-control-sm" Font-Size="15px">
                                                                <asp:ListItem Text="Select All" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Pending" Value="1" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="Confirmed" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Rejected" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Delivered" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- /.card-body -->

                                        </div>
                                        <!-- /.card filter-area -->

                                        <asp:GridView ID="gvOrderRequestHeader" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="OrderRequestID"
                                            CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="true" ShowHeaderWhenEmpty="True"
                                            OnSelectedIndexChanged="gvOrderRequestHeader_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="sdf" runat="server" ImageUrl="~/Images/Client/grid/Select.png" CausesValidation="False" CommandName="Select" ToolTip="View Order Details"></asp:ImageButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="25px" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="OrderRequestID" HeaderText="Order No" Visible="true" />
                                                <asp:BoundField DataField="CreatedDateTime" HeaderText="Ordered Date">
                                                    <HeaderStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Customer" HeaderText="Customer"></asp:BoundField>
                                                <asp:BoundField DataField="DeliveryPlace" HeaderText="Delivery Place">
                                                    <HeaderStyle Width="150px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="OrderType" HeaderText="Order Type">
                                                    <HeaderStyle Width="60px" />
                                                </asp:BoundField>
                                                <%--<asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>--%>
                                                <asp:TemplateField HeaderText="Status" ShowHeader="true">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%--<span class="<%#Eval("badge")%>"><%#Eval("Status")%></span>--%>
                                                        <span class="<%#Eval("Badge")%>" style="font-size: 15px; width: 100px;"><i class="<%#Eval("Icon")%>"></i>
                                                            <%#Eval("Status")%>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Remark" HeaderText="Remark"></asp:BoundField>
                                                <asp:BoundField DataField="TotalAmount" HeaderText="Amount (Rs.)" DataFormatString="{0:N2}">
                                                    <HeaderStyle Width="60px" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <center>No pre requested orders found</center>
                                            </EmptyDataTemplate>
                                            <RowStyle Wrap="true" />
                                            <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme" />
                                            <FooterStyle Font-Bold="true" Height="30px" BackColor="#FFFF99" />
                                        </asp:GridView>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlDetail" runat="server" Visible="false">
                                        <div class="row mb-3 ">
                                            <div class="col-md-1">
                                                <asp:Button ID="btnBack" runat="server" Text="View Orders" Visible="true" CssClass="btn btn-theme" Width="155px" OnClick="btnBack_Click" />
                                            </div>
                                        </div>

                                        <%--Summary Section--%>

                                        <%--Header Details--%>
                                        <div class="row mb-2">
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
                                                        <h5>Requested On</h5>
                                                        <p class="text-muted" style="margin: 0px;">
                                                            <asp:Label ID="lblSumRequestedOn" runat="server" Font-Size="17px"></asp:Label>
                                                        </p>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Header Details--%>

                                        <%--Customer & Order Details--%>
                                        <div class="row mb-2">
                                            <div class="col-md-6">
                                                <%--Customer Details--%>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-lightblue card-wrapper shadow">
                                                            <div class="card-header" style="height: 42px">
                                                                <h3 class="card-title">Customer Details</h3>
                                                                <div class="card-tools">
                                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <!-- /.card-tools -->
                                                            </div>
                                                            <!-- /.card-header -->

                                                            <div class="card-body" style="padding: 4px">

                                                                <div class="row mt-2 ml-3 mb-2">
                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Name</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblCustomer" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Address</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblAddress" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Contact No</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblContactNo" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="row">
                                                                            <div class="col-md-3">
                                                                                <strong>Email</strong>
                                                                            </div>
                                                                            <div class="col-md-1" style="text-align: start">
                                                                                <strong>:</strong>
                                                                            </div>
                                                                            <div class="col-md-8">
                                                                                <asp:Label ID="lblEmail" runat="server" Font-Size="17px"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <!-- /.card-body -->

                                                        </div>
                                                        <!-- /.card -->
                                                    </div>
                                                </div>
                                                <%--End Customer Details--%>

                                                <%--Order Details--%>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-lightblue card-wrapper shadow">
                                                            <div class="card-header " style="height: 42px">
                                                                <h3 class="card-title">Order Details</h3>
                                                                <div class="card-tools">
                                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <!-- /.card-tools -->
                                                            </div>
                                                            <!-- /.card-header -->

                                                            <div class="card-body" style="padding: 4px">

                                                                <div class="row mt-2 ml-3 mb-2">
                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Order Type</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblOrderType" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Recived Type</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblRecivedType" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Payment Type</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblPaymentType" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="mb-3">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <strong>Delivery Place</strong>
                                                                                </div>
                                                                                <div class="col-md-1" style="text-align: start">
                                                                                    <strong>:</strong>
                                                                                </div>
                                                                                <div class="col-md-8">
                                                                                    <asp:Label ID="lblDeliveryPlace" runat="server" Font-Size="17px"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <div class="row">
                                                                            <div class="col-md-3">
                                                                                <strong>Remark</strong>
                                                                            </div>
                                                                            <div class="col-md-1" style="text-align: start">
                                                                                <strong>:</strong>
                                                                            </div>
                                                                            <div class="col-md-8">
                                                                                <asp:Label ID="lblRemark" runat="server" Font-Size="17px"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <!-- /.card-body -->

                                                        </div>
                                                        <!-- /.card -->
                                                    </div>
                                                </div>
                                                <%--End Order Details--%>
                                            </div>

                                            <div class="col-md-6">
                                                <%--Order Process--%>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card card-lightblue card-wrapper shadow">
                                                            <div class="card-header" style="height: 42px">
                                                                <h3 class="card-title">Order Process</h3>
                                                                <div class="card-tools">
                                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                        <i class="fas fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <!-- /.card-tools -->
                                                            </div>
                                                            <!-- /.card-header -->

                                                            <div class="card-body" style="padding: 4px">

                                                                <div class="row ml-4 mb-2">
                                                                    <div class="col-md-12">
                                                                        <asp:Label ID="lbl01" runat="server" Text="Order Status" Font-Size="24px"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <asp:Label ID="lblodStatus" runat="server" Text="Pending" Font-Size="17px"></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row ml-4">
                                                                    <div class="col-md-12">
                                                                        <asp:Label ID="Label5" runat="server" Text="You Need To....." Font-Size="24px"></asp:Label>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="row mt-2 ml-3 mb-2">
                                                                            <div class="col-md-12 vl">
                                                                                <div class="mb-3">
                                                                                    <div class="row">
                                                                                        <div class="col-md-4">
                                                                                            <strong>Confirmation</strong>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: start">
                                                                                            <strong>:</strong>
                                                                                        </div>
                                                                                        <div class="col-md-7">
                                                                                            <asp:Label ID="lblConfirmation" runat="server" Font-Size="17px"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 vl">
                                                                                <div class="mb-3">
                                                                                    <div class="row">
                                                                                        <div class="col-md-4">
                                                                                            <strong>Confirmation By</strong>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: start">
                                                                                            <strong>:</strong>
                                                                                        </div>
                                                                                        <div class="col-md-7">
                                                                                            <asp:Label ID="lblConfirmationBy" runat="server" Font-Size="17px"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 vl">
                                                                                <div class="mb-3">
                                                                                    <div class="row">
                                                                                        <div class="col-md-4">
                                                                                            <strong>Confirmation Date & Time</strong>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: start">
                                                                                            <strong>:</strong>
                                                                                        </div>
                                                                                        <div class="col-md-7">
                                                                                            <asp:Label ID="lblConfirmationDateTime" runat="server" Font-Size="17px"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 vl">
                                                                                <div class="mb-3">
                                                                                    <div class="row">
                                                                                        <div class="col-md-4">
                                                                                            <strong>Delivary Person</strong>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: start">
                                                                                            <strong>:</strong>
                                                                                        </div>
                                                                                        <div class="col-md-7">
                                                                                            <asp:Label ID="lblDelivaryPerson" runat="server" Font-Size="17px"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 vl">
                                                                                <div class="mb-3">
                                                                                    <div class="row">
                                                                                        <div class="col-md-4">
                                                                                            <strong>Delivery Starting Date & Time</strong>
                                                                                        </div>
                                                                                        <div class="col-md-1" style="text-align: start">
                                                                                            <strong>:</strong>
                                                                                        </div>
                                                                                        <div class="col-md-7">
                                                                                            <asp:Label ID="lblDeliveryStartingDateTime" runat="server" Font-Size="17px"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 mb-3 vl">
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <strong>HandOver Date & Time</strong>
                                                                                    </div>
                                                                                    <div class="col-md-1" style="text-align: start">
                                                                                        <strong>:</strong>
                                                                                    </div>
                                                                                    <div class="col-md-7">
                                                                                        <asp:Label ID="lblHandOverDateTime" runat="server" Font-Size="17px"></asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- /.card-body -->

                                                        </div>
                                                        <!-- /.card -->
                                                    </div>
                                                </div>
                                                <%--End Order Process--%>
                                            </div>
                                        </div>
                                        <%--End Customer & Order Details--%>

                                        <%--End Summary Section--%>

                                        <%--(Order Items) Grid View Section--%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card card-lightblue card-wrapper shadow">
                                                    <div class="card-header" style="height: 42px">
                                                        <h3 class="card-title">Order Items</h3>
                                                        <div class="card-tools">
                                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                <i class="fas fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <!-- /.card-tools -->
                                                    </div>
                                                    <!-- /.card-header -->

                                                    <div id="printdivc" class="card-body mb-4" style="padding: 4px; margin: 5px">

                                                        <asp:Panel ID="pnlOrderItems" runat="server" Visible="true" Width="100%">
                                                            <asp:GridView ID="gvOrderRequestDetail" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="ItemMasterID"
                                                                CssClass="table-bordered" BorderWidth="2px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="true" ShowHeaderWhenEmpty="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ItemMasterID" HeaderText="ItemMasterID" Visible="false" />
                                                                    <asp:BoundField DataField="ItemNumber" HeaderText="Number">
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true" />
                                                                        <HeaderStyle Width="100px" />
                                                                        <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Item" HeaderText="Item_Name"></asp:BoundField>
                                                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                                                                        <HeaderStyle Width="100px" />
                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice">
                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                        <HeaderStyle Width="100px" />
                                                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="GrossAmount" HeaderText="Gross Amount">
                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                        <HeaderStyle Width="150px" />
                                                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="DiscountAmount" HeaderText="Discount Amount">
                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                        <HeaderStyle Width="150px" />
                                                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="NetAmount" HeaderText="Net Amount">
                                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                        <HeaderStyle Width="150px" />
                                                                        <FooterStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                                    </asp:BoundField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <center>No matching records found</center>
                                                                </EmptyDataTemplate>
                                                                <RowStyle Wrap="true" Height="35px" />
                                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" Height="50px" CssClass="grid-header-theme" />
                                                                <FooterStyle Font-Bold="true" Height="40px" BackColor="#FFFF99" />
                                                            </asp:GridView>
                                                        </asp:Panel>

                                                        <div class="row mt-4">
                                                            <div class="col-md-8">
                                                                <div class="d-none">
                                                                    <%--Invoice Hidden data--%>
                                                                    <asp:Label ID="lblInvoiceNo" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblSubTotal" runat="server" Visible="true" ForeColor="White"></asp:Label>

                                                                    <%--Company Hidden data--%>
                                                                    <asp:Label ID="lblCompanyName" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblCompanyRegisterNo" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblCompanyAddress" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblCompanyContactNo" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblCompanyEmail" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                    <asp:Label ID="lblCompanyFooter" runat="server" Visible="true" ForeColor="White"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-4 mt-1">
                                                                <div class="row">
                                                                    <asp:Panel ID="pnlDeliveryCharge" runat="server">
                                                                        <h5>Total Delivery Charge (Rs.) :
                                                                    <asp:Label ID="lblDeliveryCharge" runat="server" Text="100.00"></asp:Label></h5>
                                                                    </asp:Panel>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="btnDeliveryChargeIncrease" runat="server" Font-Size="20px" ToolTip="+ Rs.25.00 Delivery Charge"
                                                                        OnClick="btnDeliveryChargeIncrease_Click"><i class="fas fa-caret-square-up"></i></asp:LinkButton>&nbsp;
                                                                    <asp:LinkButton ID="btnDeliveryChargeDecrease" runat="server" Font-Size="20px" ToolTip="- Rs.25.00 Delivery Charge"
                                                                        OnClick="btnDeliveryChargeDecrease_Click"><i class="fas fa-caret-square-down"></i></asp:LinkButton>
                                                                </div>
                                                                <div class="row">
                                                                    <h3>Total Amount (Rs.) :	  
                                                                <asp:Label ID="lblTotalNetAmount" runat="server" ClientIDMode="Static"></asp:Label>
                                                                    </h3>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col-md-8"></div>
                                                            <div class="col-md-2">
                                                                <asp:Button ID="btnReject" runat="server" Text="Reject" Visible="true" CssClass="btn btn-theme" Width="155px" OnClick="btnReject_Click" />
                                                            </div>
                                                            <div class="col-md-2">
                                                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" Visible="true" CssClass="btn btn-theme" Width="155px"
                                                                    OnClick="btnConfirm_Click" OnClientClick="PrintInvoice(); return;" />
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- /.card-body -->

                                                </div>
                                                <!-- /.card -->
                                            </div>
                                        </div>
                                        <%--End (Order Items) Grid View Section--%>
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
            $('#<%= gvOrderRequestHeader.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvOrderRequestHeader.ClientID%>").find("tr:first"))).DataTable({
                stateSave: false,
                lengthChange: true,
                lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
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
                        $('#<%= gvOrderRequestHeader.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvOrderRequestHeader.ClientID%>").find("tr:first"))).DataTable({
                            stateSave: false,
                            lengthChange: true,
                            lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
                            bFilter: true,
                            bsort: true,
                            bPaginate: true,
                            pagingType: "full_numbers"
                        });
                    });
                }
            });
        };

        //Print Invoice
        function PrintInvoice() {

            var CompanyName = document.getElementById("<%=lblCompanyName.ClientID %>").innerHTML;
            var CompanyRegisterNo = document.getElementById("<%=lblCompanyRegisterNo.ClientID %>").innerHTML;
            var CompanyAddress = document.getElementById("<%=lblCompanyAddress.ClientID %>").innerHTML;
            var CompanyContactNo = document.getElementById("<%=lblCompanyContactNo.ClientID %>").innerHTML;
            var CompanyEmail = document.getElementById("<%=lblCompanyEmail.ClientID %>").innerHTML;
            var CompanyFooter = document.getElementById("<%=lblCompanyFooter.ClientID %>").innerHTML;

            var customerName = document.getElementById("<%=lblCustomer.ClientID %>").innerHTML;
            var customerAddress = document.getElementById("<%=lblAddress.ClientID %>").innerHTML;
            var customerEmail = document.getElementById("<%=lblEmail.ClientID %>").innerHTML;

            var invoiceNo = document.getElementById("<%=lblInvoiceNo.ClientID %>").innerHTML;
            var subTotal = document.getElementById("<%=lblSubTotal.ClientID %>").innerHTML;
            var deliveryChargers = document.getElementById("<%=lblDeliveryCharge.ClientID %>").innerHTML;
            var grandTotal = document.getElementById("<%=lblTotalNetAmount.ClientID %>").innerHTML;

            var panel = document.getElementById("<%=pnlOrderItems.ClientID %>");
            var printWindow = window.open('', '', 'height=800,width=970');

            printWindow.document.write('<html><head>');
            printWindow.document.write('<title>Print Invoice</title>');
            printWindow.document.write('<style>');
            printWindow.document.write('@font-face {font-family: SourceSansPro; src: url(SourceSansPro-Regular.ttf);}');
            printWindow.document.write('.clearfix:after { content: ""; display: table; clear: both;}');
            printWindow.document.write('a { color: #0087C3; text-decoration: none;}');
            printWindow.document.write('body { position: relative; width: 21cm;   height: 29.7cm;  margin: 0 auto;  color: #555555; background: #FFFFFF;  font-family: Arial, sans-serif;  font-size: 14px;  font-family: SourceSansPro;}');
            printWindow.document.write('header { padding: 10px 0; margin-bottom: 20px; border-bottom: 1px solid #AAAAAA;}');
            printWindow.document.write('#logo { float: left; margin-top: 8px;}');
            printWindow.document.write('#logo img { height: 100px; width: 100px;}');
            printWindow.document.write('#company { float: right; text-align: right; font-size: 17px;}');
            printWindow.document.write('#details { margin-bottom: 50px;}');
            printWindow.document.write('#client { padding-left: 6px; border-left: 6px solid #0087C3; float: left;}');
            printWindow.document.write('#client .to { color: #777777;}');
            printWindow.document.write('h2.name { font-size: 1.4em; font-weight: normal; margin: 0;}');
            printWindow.document.write('#invoice { float: right; text-align: right;}');
            printWindow.document.write('#invoice h1 { color: #0087C3; font-size: 2.0em; line-height: 1em; font-weight: normal; margin: 0  0 10px 0;}');
            printWindow.document.write('#invoice .date { font-size: 1.1em; color: #777777;}');
            printWindow.document.write('table { border-collapse: collapse; border-spacing: 0; margin-bottom: 20px;}');
            printWindow.document.write('table tfoot td { padding: 10px 20px; background: #FFFFFF; border-bottom: none; font-size: 1.0em; white-space: nowrap;  border-top: 1px solid #AAAAAA;}');
            printWindow.document.write('table tfoot tr:first-child td { border-top: none;}');
            printWindow.document.write('table tfoot tr:last-child td { color: #57B223; font-size: 1.2em; border-top: 1px solid #57B223;}');
            printWindow.document.write('table tfoot tr td:first-child { border: none;}');
            printWindow.document.write('#thanks{ font-size: 1.5rem; margin-bottom: 50px;}');
            printWindow.document.write('#notices{ padding-left: 6px; border-left: 6px solid #0087C3;  }');
            printWindow.document.write('#notices .notice { font-size: 1.2em;}');
            printWindow.document.write('#footer { color: #777777; width: 100%; height: 30px; border-top: 1px solid #AAAAAA; padding: 8px 0; text-align: center;}');
            printWindow.document.write('</style>');
            printWindow.document.write('</head >');
            printWindow.document.write('</head >');

            printWindow.document.write('<body >');
            printWindow.document.write('<header class="clearfix">');
            printWindow.document.write('<div id="logo">');
            printWindow.document.write('<img src="../../Images/Logo/standard-logo.jpg" />');
            printWindow.document.write('</div>');
            printWindow.document.write('<div id="company">');
            printWindow.document.write('<h2 class="name">' + CompanyName + '</h2>');
            printWindow.document.write('<div>' + CompanyAddress + '</div>');
            printWindow.document.write('<div>036-2230427, ' + CompanyContactNo + '</div>');
            printWindow.document.write('<div><a href="mailto:healerspharmacyavissawella@gmail.com">' + CompanyEmail + '</a></div>');
            printWindow.document.write('<div>National Medicines Regulatory Authority. Reg No: ' + CompanyRegisterNo + '</div>');
            printWindow.document.write('</div>');
            printWindow.document.write('</div>');
            printWindow.document.write('</header>');

            printWindow.document.write('<main>');
            printWindow.document.write('<div id="details" class="clearfix">');
            printWindow.document.write('<div id="client">');
            printWindow.document.write('<div class="to">INVOICE TO:</div>');
            printWindow.document.write('<h2 class="name">' + customerName + ' </h2>');
            printWindow.document.write('<div class="address">' + customerAddress + '</div>');
            printWindow.document.write('<div class="email"><a href="mailto:' + customerEmail + '">' + customerEmail + '</a></div>');
            printWindow.document.write('</div>');
            printWindow.document.write('<div id="invoice">');
            printWindow.document.write('<h1>' + invoiceNo + '</h1>');
            printWindow.document.write('<div class="date">Date of Invoice: <%: DateTime.Now.ToString("dd MMMM yyyy") %></div>');
            printWindow.document.write('</div>');
            printWindow.document.write('</div>');

            printWindow.document.write(panel.innerHTML);

            printWindow.document.write('<table align="right" border="0" cellspacing="0" cellpadding="0">');
            printWindow.document.write('<tfoot>');
            printWindow.document.write('<tr>');
            printWindow.document.write('<td>SUB TOTAL</td>');
            //printWindow.document.write('<td>LKR ' + (parseFloat(grandTotal).toFixed(2) - parseFloat(deliveryChargers).toFixed(2)) + '</td>');
            printWindow.document.write('<td>LKR ' + subTotal + '</td>');
            printWindow.document.write('</tr>');
            printWindow.document.write('<tr>');
            printWindow.document.write('<td>DELIVERY</td>');
            printWindow.document.write('<td>LKR ' + deliveryChargers + '</td>');
            printWindow.document.write('</tr>');
            printWindow.document.write('<tr>');
            printWindow.document.write('<td>GRAND TOTAL</td>');
            printWindow.document.write('<td>LKR ' + grandTotal + '</td>');
            printWindow.document.write('</tr>');
            printWindow.document.write('</tfoot>');
            printWindow.document.write('</table>');

            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<br/>');
            printWindow.document.write('<div id="thanks">' + CompanyFooter + '</div>');
            printWindow.document.write('<div id="notices">');
            printWindow.document.write('<div>NOTICE:</div>');
            printWindow.document.write('<div class="notice">Please feel free to contact us for any inquiry.</div>');
            printWindow.document.write('</div>');
            printWindow.document.write('</main>');

            printWindow.document.write('</body>');
            //printWindow.document.write('<div id="footer">Invoice was created on a computer and is valid without the signature and seal.</div>');
            printWindow.document.write('</html>');
            printWindow.document.close();
            //printWindow.focus();
            //printWindow.print();  
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return true;
        }

    </script>

</asp:Content>
