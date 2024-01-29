<%@ Page Title="Company" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="ECOMWebApp.Pages.Client.Company" %>

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
                            <h1 class="m-0">Company</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item active">Company</li>
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
                                        <i class="fas fa-columns"></i>
                                        Company data View / Edit
                                    </h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">
                                    <div class="row mb-3">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add New Recoard" Enabled="false" Visible="true" Width="150px" CssClass="btn btn-block btn-sm btn-theme" OnClick="btnAdd_Click" />
                                        <asp:LinkButton ID="btnView" runat="server" Visible="false" Text="View Recoards" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-theme"
                                            OnClick="btnView_Click"></asp:LinkButton>
                                    </div>

                                    <div>
                                        <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%">

                                            <asp:GridView ID="gvCompany" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="ID"
                                                CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="False" ShowHeaderWhenEmpty="True"
                                                OnSelectedIndexChanged="gvCompany_SelectedIndexChanged" OnRowDeleting="gvCompany_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="grdbtnSelect" runat="server" ImageUrl="~/Images/Client/grid/Edit.png" CausesValidation="False" CommandName="Select"></asp:ImageButton>
                                                            <asp:ImageButton ID="grdbtnDelete" runat="server" ImageUrl="~/Images/Client/grid/Delete.png" CausesValidation="False" CommandName="Delete" Visible="false"
                                                                OnClientClick="return confirm('Are you sure you want to delete?'); "></asp:ImageButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="40px" />
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name">
                                                        <HeaderStyle Width="300px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Address" HeaderText="Address">
                                                        <HeaderStyle Width="200px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No">
                                                        <HeaderStyle Width="100px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Email" HeaderText="Email">
                                                        <HeaderStyle Width="150px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Description" HeaderText="Description" Visible="false">
                                                        <HeaderStyle Width="180px" />
                                                    </asp:BoundField>
                                                    <asp:CheckBoxField DataField="IsActive" HeaderText="Active" InsertVisible="true">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <HeaderStyle Width="50px" />
                                                    </asp:CheckBoxField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <center>No company record found</center>
                                                </EmptyDataTemplate>
                                                <RowStyle Wrap="true" />
                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme" />
                                            </asp:GridView>

                                        </asp:Panel>
                                    </div>

                                    <div>
                                        <asp:Panel ID="pnlDetail" runat="server" Visible="false" Width="100%">

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblName" runat="server" Text="Name*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                            pattern="^[a-z A-Z 0-9 .()]{3,}$" titel="Enter Characters Only" required="required" autocomplete="off" placeholder="Enter Characters Only"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblAddress" runat="server" Text="Address*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Height="38px" TextMode="MultiLine"
                                                            pattern="^[a-z A-Z 0-9 ,./]{3,}$" titel="Enter Characters Only" required="required" autocomplete="off" placeholder="Enter Characters Only"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblContactNo" runat="server" Text="Contact No*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" MaxLength="10"
                                                            pattern="^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|91)(0|2|3|4|5|7|9)|7(0|1|4|5|6|7|8)\d)\d{6}$"
                                                            titel="Enter Numbers Only" required="required" autocomplete="off" placeholder="0xxxxxxxxxx"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblEmail" runat="server" Text="Email" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"
                                                            pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" titel="Enter Characters Only" required="required" autocomplete="off" placeholder="companyname@gmail.com"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblDescription" runat="server" Text="Description" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Height="38px" TextMode="MultiLine"
                                                            autocomplete="off" placeholder="Enter Any Characters"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblFooter" runat="server" Text="Footer*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtFooter" runat="server" TextMode="MultiLine" CssClass="form-control" Height="38px"
                                                            required="required" autocomplete="off" placeholder="Enter Any Characters"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <asp:Label ID="lblImage" runat="server" Text="Logo" Font-Bold="true"></asp:Label>
                                                    <div class="mt-1 mb-1">
                                                        <asp:FileUpload ID="imageUploader" runat="server" placeholder="Chose Image" onchange="ShowImagePreview(this);" />
                                                    </div>
                                                    <asp:Image ID="imgPreview" runat="server" alt="Uploaded image preview" Width="150px" Height="100px" />
                                                </div>
                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblActive" runat="server" Text="Active" Font-Bold="true"></asp:Label>
                                                        <div class="mt-1">
                                                            <asp:CheckBox ID="chkActive" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>

                                        </asp:Panel>
                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <!-- card-footer -->
                                <div class="card-footer">
                                    <asp:LinkButton ID="btnCancel" runat="server" Visible="false" Text="Cancel" Width="100px" CssClass="btn btn-theme" OnClick="btnCancel_Click"></asp:LinkButton>
                                    <asp:Button ID="btnInsert" runat="server" Text="Save" Visible="false" CssClass="btn btn-theme" Width="100px" OnClick="btnInsert_Click" />
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" CssClass="btn btn-theme" Width="100px" OnClick="btnUpdate_Click" />
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

            <div style="width: 0px; height: 0px;">
                <asp:UpdatePanel ID="upImageUploder" runat="server">
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnUpdate" />
                        <asp:PostBackTrigger ControlID="btnInsert" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:FileUpload ID="SupporterImageUploder" runat="server" Visible="true" Width="0px" Height="0px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">

    <script type="text/javascript">

        //On Page Load
        $(document).ready(function () {
            $('#<%= gvCompany.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCompany.ClientID%>").find("tr:first"))).DataTable({
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
                        $('#<%= gvCompany.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvCompany.ClientID%>").find("tr:first"))).DataTable({
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
        };

        //Preview Image before Upload using Fileupload
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgPreview.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</asp:Content>
