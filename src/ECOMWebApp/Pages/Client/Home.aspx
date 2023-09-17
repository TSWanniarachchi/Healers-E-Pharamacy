<%@ Page Title="Home" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ECOMWebApp.Pages.Client.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <style>
        @media only screen and (max-width: 420px) {
            .mobile-view {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-1">
                <div class="col-sm-6">
                    <h1 class="m-0">Dashboard</h1>
                </div>
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

                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblNewCustomers" runat="server" Text="Label"></asp:Label>
                                    </h3>

                                    <p>New Customers</p>
                                </div>
                                <div class="icon">
                                    <%--<canvas id="visitors-chart" height="200"></canvas>--%>
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="Customer.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-purple">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblNewOrders" runat="server" Text="Label"></asp:Label>
                                    </h3>

                                    <p>New Orders</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-add-circle"></i>
                                    <%--  </div>
                        <!-- /.card-body -->

                        <!-- card-footer -->
                        <div class="card-footer">
                        </div>
                        <!-- /.card-footer -->

                    </div>
                    <!-- /.card -->--%>
                                </div>
                                <a href="PurchaseOrder.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblConfirmedOrders" runat="server" Text="Label"></asp:Label>
                                    </h3>

                                    <p>Confirmed Orders</p>
                                </div>
                                <div class="icon">
                                    <%--<i class="ion ion-person-add"></i>--%>
                                    <i class="ion ion-android-cart"></i>
                                </div>
                                <a href="PurchaseOrder.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                            <%--<div class="small-box bg-success">
                                <div class="inner">
                                    <h3>53<sup style="font-size: 20px">%</sup></h3>

                                    <p>Dispatched</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>--%>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="lblRejectedOrder" runat="server" Text="Label"></asp:Label>
                                    </h3>

                                    <p>Rejected Orders</p>
                                </div>
                                <div class="icon">
                                    <%--<i class="ion ion-pie-graph"></i>--%>
                                    <i class="ion ion-android-cancel"></i>
                                </div>
                                <a href="PurchaseOrder.aspx" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header border-0">
                                    <div class="d-flex justify-content-between">
                                        <h3 class="card-title">These 5 items have highest available quantity</h3>
                                        <a href="StockReport.aspx">View Report</a>
                                    </div>
                                </div>
                                <div class="card-body" style="padding-block-start: 5px;">
                                    <div class="d-flex">
                                        <p class="d-flex flex-column">
                                            <span class="text-bold text-lg">Total Stock Count - 
                                                <asp:Label ID="lblStockCount" runat="server"></asp:Label>
                                            </span>
                                            <span>Medicines Availabilty</span>
                                        </p>
                                        <p class="ml-auto d-flex flex-column text-right">
                                            <span class="text-danger">
                                                <i class="fas fa-arrow-down"></i>12.5%
                                            </span>
                                            <span class="text-muted">At Pharmacy Stock</span>
                                        </p>
                                    </div>
                                    <!-- /.d-flex -->

                                    <div class="position-relative mb-4">
                                        <%--<canvas id="visitors-chart" height="200"></canvas>--%>

                                        <asp:Chart runat="server" ID="chartStock" Height="290px" Width="375px" ToolTip="Stock Chart" CssClass="mobile-view">
                                            <series>
                                                <asp:Series Name="Series1" XValueMember="0" XValueType="String" YValueMembers="1" YValueType="Int32" ChartType="Pie" YValuesPerPoint="4">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true" ShadowColor="#cccccc"></asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </div>

                                    <div class="d-flex flex-row justify-content-end">
                                        <span class="mr-2">
                                            <i class="fas fa-square text-primary"></i>Medicine Name & Amount
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->

                            <div class="card">
                                <div class="card-header border-0">
                                    <h3 class="card-title">Deficit and Nearing Completion Products</h3>
                                    <div class="card-tools">
                                        <a href="#" class="btn btn-tool btn-sm">
                                            <i class="fas fa-download"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-sm">
                                            <i class="fas fa-bars"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-striped table-valign-middle">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Unit Price</th>
                                                <th>Stock Amount</th>
                                                <th>More</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="reptrMinimumStock" runat="server">
                                                <itemtemplate>

                                                    <tr>
                                                        <td>
                                                            <img src='data:image/jpg;base64,<%# !string.IsNullOrEmpty(Eval("Medicine").ToString()) ? Convert.ToBase64String((byte[])Eval("ItemImage")) : string.Empty %>'
                                                                alt="Product 1" class="img-circle img-size-32 mr-2" style="width: 30px; height: 30px" />
                                                            <%#Eval("Medicine")%>
                                                        </td>
                                                        <td>LKR <%#Eval("UnitPrice")%></td>
                                                        <td>
                                                            <span class="<%#Eval("badge")%>"><%#Eval("AvilableQuantity")%></span>
                                                        </td>
                                                        <td>
                                                            <a href="StockReport.aspx" class="text-muted">
                                                                <i class="fas fa-search"></i>
                                                            </a>
                                                        </td>
                                                    </tr>

                                                </itemtemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col-md-6 -->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header border-0">
                                    <div class="d-flex justify-content-between">
                                        <h3 class="card-title">Sales in last 7 days</h3>
                                        <a href="SalesReport.aspx">View Report</a>
                                    </div>
                                </div>
                                <div class="card-body" style="padding-block-start: 5px;">
                                    <div class="d-flex">
                                        <p class="d-flex flex-column">
                                            <span class="text-bold text-lg">Total Sales - LKR
                                                <asp:Label ID="lblTotalNetSale" runat="server"></asp:Label>
                                            </span>
                                            <span>Net Sales (LKR)</span>
                                        </p>
                                        <p class="ml-auto d-flex flex-column text-right">
                                            <span class="text-success">
                                                <i class="fas fa-arrow-up"></i>33.1%
                                            </span>
                                            <span class="text-muted">Since last week</span>
                                        </p>
                                    </div>
                                    <!-- /.d-flex -->

                                    <div class="position-relative mb-4">
                                        <%--<canvas id="sales-chart" height="200"></canvas>--%>

                                        <asp:Chart runat="server" ID="chartSales" Height="290px" Width="470px"
                                            ClientIDMode="AutoID" ToolTip="Sales Chart" CssClass="mobile-view">
                                            <series>
                                                <asp:Series Name="Series1" XValueMember="0" XValueType="String" YValueMembers="1" YValueType="Int32">
                                                </asp:Series>
                                            </series>
                                            <chartareas>
                                                <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true">
                                                    <area3dstyle enable3d="True"></area3dstyle>
                                                </asp:ChartArea>
                                            </chartareas>
                                        </asp:Chart>
                                    </div>

                                    <div class="d-flex flex-row justify-content-end">
                                        <span class="mr-2">
                                            <i class="fas fa-square text-primary"></i>Last 7 days
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->

                            <div class="card">
                                <div class="card-header border-0">
                                    <h3 class="card-title">Expired and Nearing Expiration Products</h3>
                                    <div class="card-tools">
                                        <a href="#" class="btn btn-tool btn-sm">
                                            <i class="fas fa-download"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-sm">
                                            <i class="fas fa-bars"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-striped table-valign-middle">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Status</th>
                                                <th>Expiration Date</th>
                                                <th>Stock</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="reptrItemExpirationDate" runat="server">
                                                <itemtemplate>

                                                    <tr>
                                                        <td>
                                                            <img src='data:image/jpg;base64,<%# !string.IsNullOrEmpty(Eval("Medicine").ToString()) ? Convert.ToBase64String((byte[])Eval("ItemImage")) : string.Empty %>'
                                                                alt="Product 1" class="img-circle img-size-32 mr-2" style="width: 30px; height: 30px" />
                                                            <%#Eval("Medicine")%>
                                                        </td>
                                                        <td>
                                                            <span class="<%#Eval("badge")%>"><%#Eval("Status")%></span>
                                                        </td>
                                                        <td>
                                                            <%#Eval("ExpirationDate")%>

                                                        </td>
                                                        <td>
                                                            <%#Eval("AvilableQuantity")%>
                                                        </td>
                                                    </tr>

                                                </itemtemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.card -->

                        </div>
                        <!-- /.col-md-6 -->
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title">Total Sales Summary in last 30 days</h5>

                                    <div class="card-tools">
                                        <%--<button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>--%>
                                        <div class="btn-group">
                                            <%--<button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown">
                                                <i class="fas fa-wrench"></i>
                                            </button>--%>
                                            <a href="#" class="btn btn-tool btn-sm">
                                                <i class="fas fa-bars"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                                <a href="#" class="dropdown-item">Action</a>
                                                <a href="#" class="dropdown-item">Another action</a>
                                                <a href="#" class="dropdown-item">Something else here</a>
                                                <a class="dropdown-divider"></a>
                                                <a href="#" class="dropdown-item">Separated link</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6 col-12">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-info"><i class="fas fa-money-bill"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">GROSS AMOUNT</span>
                                                    <span class="info-box-number">LKR 
                                                        <asp:Label ID="lblTotalGrossAmount" runat="server" Text="0.00"></asp:Label>
                                                    </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-3 col-sm-6 col-12">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-success"><i class="fas fa-wallet"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">DISCOUNT AMOUNT</span>
                                                    <span class="info-box-number">LKR 
                                                        <asp:Label ID="lblTotalDiscountAmount" runat="server" Text="0.00"></asp:Label>
                                                    </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-3 col-sm-6 col-12">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-warning"><i class="fas fa-truck"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">DELIVERY AMOUNT</span>
                                                    <span class="info-box-number">LKR 
                                                        <asp:Label ID="lblTotalDeliveryAmount" runat="server" Text="0.00"></asp:Label>
                                                    </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-3 col-sm-6 col-12">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-danger"><i class="far fa-money-bill-alt"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">NET AMOUNT</span>
                                                    <span class="info-box-number">LKR 
                                                        <asp:Label ID="lblTotalNetAmount" runat="server" Text="0.00"></asp:Label>
                                                    </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                </div>
                                <!-- ./card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col -->
            </div>
            <!-- ./row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">

    <!-- OPTIONAL SCRIPTS -->
    <script src="../../Plugins/Client/chart.js/Chart.min.js"></script>
    <!-- AdminLTE for function purposes -->
    <script src="../../Scripts/adminlte-function.js"></script>
    <!-- AdminLTE dashboard -->
    <script src="../../Scripts/dashboard2.js"></script>
    <script src="../../Scripts/dashboard3.js"></script>

</asp:Content>

