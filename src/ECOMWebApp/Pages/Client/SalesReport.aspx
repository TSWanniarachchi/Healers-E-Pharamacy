<%@ Page Title="Sales Report" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="ECOMWebApp.Pages.Client.SalesReport" %>
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
                            <h1 class="m-0">Sales Report</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item">Reports</li>
                                <li class="breadcrumb-item active">Sales Report</li>
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
                                        <i class="far fa-money-bill-alt nav-icon"></i>
                                        Sales Report / View
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
                                                <h3 class="card-title">Selecting Date Area&nbsp;&nbsp;&nbsp;&nbsp;</h3>

                                                <div class="card-tools">
                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                </div>
                                                <!-- /.card-tools -->
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="display: block; height: 60px">

                                                <div class="row">                                                
                                                          <div class="col-md-8">
                                                          <asp:Label ID="lblfromdate" runat="server" Text="From :" Font-Size="15px"></asp:Label>&nbsp;
                                                          <asp:TextBox ID="txtfromDate" runat="server" TextMode="Date" Height="25px" Width="150px" CssClass="form-control-sm" AutoPostBack="true" OnTextChanged="TxtfromDate_TextChanged"></asp:TextBox>&nbsp;&nbsp;
                                                            
                                                          <asp:Label ID="lbltodate" runat="server" Text="To :" Font-Size="15px"></asp:Label>&nbsp;
                                                          <asp:TextBox ID="txttoDate" runat="server" TextMode="Date" Height="25px" Width="150px" CssClass="form-control-sm" AutoPostBack="true" OnTextChanged="txttoDate_TextChanged"></asp:TextBox>
                                                          </div>
                                                 </div>
                                            </div>

                                            </div>
                                            <!-- /.card-body -->
                                        </div>
                                    
                                    <div style="height:300px; overflow:auto" class="ml-2 mr-2">
                                        <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%">
                                           
                                            <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                                                ClientIDMode="Static" DataKeyNames="ID"  CssClass="table table-striped table-bordered table-hover blueTable" 
                                                BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="True" ShowHeaderWhenEmpty="True" 
                                                OnRowDataBound="gvSales_RowDataBound">    <%--OnSelectedIndexChanged="gvCompany_SelectedIndexChanged" OnRowDeleting="gvCompany_RowDeleting"--%>
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="No" Visible="false">  <%--FooterStyle-BackColor="#BDB76B"--%>
                                                        <HeaderStyle Width="100px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="InvoiceNo" HeaderText="Invoice No">
                                                        <HeaderStyle Width="150px" Font-Bold="true" Font-Size="18px" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="Date" HeaderText="Date">
                                                        <HeaderStyle Width="200px" Font-Bold="true" Font-Size="18px"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TotalGrossAmount" DataFormatString="{0:N2}" HeaderText="Total Gross Amount">
                                                        <HeaderStyle Width="200px"  Font-Bold="true" Font-Size="18px" />
                                                    </asp:BoundField> 
                                                    <asp:BoundField DataField="TotalDiscountAmount" DataFormatString="{0:N2}" HeaderText="Total Discount Amount">
                                                        <HeaderStyle Width="200px"  Font-Bold="true" Font-Size="18px"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TotalNetAmount" DataFormatString="{0:N2}" HeaderText="Total Net Amount">
                                                        <HeaderStyle Width="200px"  Font-Bold="true" Font-Size="18px"/>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Settle" HeaderText="Settle">
                                                        <HeaderStyle Width="100px"  Font-Bold="true" Font-Size="18px"/>
                                                    </asp:BoundField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <center>No matching records found</center>
                                                </EmptyDataTemplate>
                                                <RowStyle Wrap="true" />
                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <!-- card-footer -->
                                <div class="card-footer">
                                    <asp:LinkButton ID="PritData" runat="server" CssClass="btn btn-primary btn-theme" Width="150px" Height="40px" OnClientClick="return PrintGridData()">
                                    <i class="fas fa-print"></i>&nbsp;&nbsp;Print Report</asp:LinkButton>
                                    <asp:LinkButton ID="ExportData" runat="server" CssClass="btn btn-primary btn-theme" Width="150px" Height="40px" AutoPostBack="true" OnClick="ExportData_Click">
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
            printWindow.document.write('</head><body ><center><h3><br/>Sales Report - Healers Pharmacy Avissawella</h3></hr>');
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
