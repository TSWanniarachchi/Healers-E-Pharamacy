<%@ Page Title="Stock Report" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="StockReport.aspx.cs" Inherits="ECOMWebApp.Pages.Client.StockReport" %>
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
                            <h1 class="m-0">Stock Report</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item">Reports</li>
                                <li class="breadcrumb-item active">Stock Report</li>
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
                                        <i class="fas fa-cubes nav-icon"></i>
                                        Stock Report / View
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">
                                    <div class="card card-blue shadow-sm">
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

                                    <div style="height:400px; overflow:auto" class="ml-2 mr-2">
                                        
                                        <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%">

                                            <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static"
                                                CssClass="table table-striped table-bordered table-hover blueTable" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="true" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvCompany_SelectedIndexChanged1" OnRowDataBound="gvCompany_RowDataBound">    <%--OnSelectedIndexChanged="gvCompany_SelectedIndexChanged" OnRowDeleting="gvCompany_RowDeleting"--%>

                                                <Columns>
                                                    <asp:BoundField DataField="Name" HeaderText="Item Name">
                                                        <HeaderStyle Width="400px"/> <%--BackColor="#004d4d" ForeColor ="White"   FooterStyle-BackColor="#BDB76B"--%>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ProName" HeaderText="Product Category">
                                                        <HeaderStyle Width="400px"/>
                                                    </asp:BoundField> 
                                                    <asp:BoundField DataField="CatName" HeaderText="Item Category">
                                                        <HeaderStyle Width="400px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Quntity" HeaderText="Quantity">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField> 
                                                    <asp:BoundField DataField="UnitPrice" DataFormatString="{0:N2}" HeaderText="Unit Price">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="MarkPrice" DataFormatString="{0:N2}" HeaderText="Mark Price">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="DiscountPrice" DataFormatString="{0:N2}" HeaderText="Discount Price">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StdLength" DataFormatString="{0:N2}" HeaderText="Std Length">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StdWeight" DataFormatString="{0:N2}" HeaderText="Std Weight">
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StdVolume" DataFormatString="{0:N2}" HeaderText="Std Volume"> 
                                                        <HeaderStyle Width="100px"  />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="ManufacturedDate" HeaderText="Manufature Date" DataFormatString="{0:MM/dd/yy}">
                                                        <HeaderStyle Width="180px"  />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="ExpirationDate" HeaderText="Expire Date" DataFormatString="{0:MM/dd/yy}">
                                                        <HeaderStyle Width="180px"  />
                                                    </asp:BoundField>

                                                   
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
                                     <asp:LinkButton ID="PritData" runat="server" CssClass="btn btn-primary btn-theme" Width="150px" Height="40px"  OnClientClick="return PrintGridData()">
                                    <i class="fas fa-print"></i>&nbsp;&nbsp;Print Report</asp:LinkButton>
                                    <asp:LinkButton ID="ExportData" runat="server" CssClass="btn btn-primary btn-theme" Width="150px" Height="40px"  AutoPostBack="true" OnClick="ExportData_Click">
                                    <i class="far fa-file-excel"></i>&nbsp;&nbsp;Export Report</asp:LinkButton>
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

        function PrintGridData() {
            var panel = document.getElementById("<%=pnlGrid.ClientID %>");
            var printWindow = window.open('', '', 'height=800,width=1000');
            printWindow.document.write('<html><head>');
            printWindow.document.write('</head><body ><center><h3><br/>Stock Report - Healers Pharmacy Avissawella</h3></hr>');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</br></hr></br><p>Generated By OBS Software Solutions E-Pharmacy System</p></center ></body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }

        function sweetalert(type, title, message) {
            Swal.fire({
                icon: type,
                title: title,
                text: message,
            })
        }

    </script>
</asp:Content>
