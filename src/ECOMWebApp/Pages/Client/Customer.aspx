<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="ECOMWebApp.Pages.Client.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">

    <asp:UpdatePanel ID="upForm" runat="server">
        <ContentTemplate>

            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Customers</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item active">Customers</li>
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
                                        <i class="fas fa-users"></i>
                                        Registerd Customer List
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">

                                    <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="ID"
                                        CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="False" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                                            <asp:BoundField DataField="Customer" HeaderText="Customer"></asp:BoundField>
                                            <asp:BoundField DataField="Address" HeaderText="Address"></asp:BoundField>
                                            <asp:BoundField DataField="District" HeaderText="District"></asp:BoundField>
                                            <asp:BoundField DataField="NICNo" HeaderText="NICNo"></asp:BoundField>
                                            <asp:BoundField DataField="Gender" HeaderText="Gender"></asp:BoundField>
                                            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo"></asp:BoundField>
                                            <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                            <asp:CheckBoxField DataField="IsActive" HeaderText="Active" InsertVisible="true">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:CheckBoxField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <center>No matching records found</center>
                                        </EmptyDataTemplate>
                                        <RowStyle Wrap="true" />
                                        <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme"/>
                                    </asp:GridView>

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
            $('#<%= gvCustomer.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCustomer.ClientID%>").find("tr:first"))).DataTable({
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
                        $('#<%= gvCustomer.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCustomer.ClientID%>").find("tr:first"))).DataTable({
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

    </script>

</asp:Content>
