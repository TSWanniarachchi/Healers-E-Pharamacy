<%@ Page Title="Company Item Page" Language="C#" MasterPageFile="~/Pages/Shared/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ItemMaster.aspx.cs" Inherits="ECOMWebApp.Pages.Client.ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">


    <%--<script src="https://unpkg.com/sweetalert2@11.0.18/dist/sweetalert2.all.js"></script>

    <script type="text/javascript">

        function alert(title, text, type) {
            Swal.fire(
                title,
                text,
                type
            )
        }

        ///*Sweetalert2 common type*/
        //Swal.fire(
        //    'Good job!',
        //    'You clicked the button!',
        //    'success'
        //)

        //function Succes(text) {
        //    swal("Successful", text, "success");
        //}        


        //function deletealert(ctl, event) {
        //    // STORE HREF ATTRIBUTE OF LINK CTL (THIS) BUTTON
        //    var defaultAction = $(ctl).prop("href");
        //    // CANCEL DEFAULT LINK BEHAVIOUR
        //    event.preventDefault();
        //    swal({
        //        title: "Are you sure?",
        //        text: "You will not be able to recover this imaginary   file!",
        //        type: "warning",
        //        showCancelButton: true,
        //        confirmButtonColor: "#DD6B55",
        //        confirmButtonText: "Yes, delete it!",
        //        cancelButtonText: "No, cancel plx!",
        //        closeOnConfirm: false,
        //        closeOnCancel: false
        //    },
        //        function (isConfirm) {
        //            if (isConfirm) {
        //                swal({ title: "Deleted!", text: "Your imaginary file has been deleted.", type: "success", confirmButtonText: "OK!", closeOnConfirm: false },
        //                    function () {
        //                        // RESUME THE DEFAULT LINK ACTION
        //                        window.location.href = defaultAction;
        //                        return true;
        //                    });
        //            } else {
        //                swal("Cancelled", "Your imaginary file is safe :)", "error");
        //                return false;
        //            }
        //        });
        //}

    </script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">
    <asp:UpdatePanel ID="upForm" runat="server">
        <ContentTemplate>

            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0" style="font-family: Georgia">Item Master</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item">References</li>
                                <li class="breadcrumb-item active">Company</li>
                                <li class="breadcrumb-item active">Item</li>
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
                                        <font-fa>
                                        Item Master Data View / Add / Edit / Delete
                                    </h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->

                                <!-- card-body -->
                                <div class="card-body pad table-responsive">
                                    <div class="row mb-3">
                                        <%--<asp:Button ID="btnView" runat="server" Text="View Recoards" Visible="false" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-primary"
                                            OnClick="btnView_Click" />
                                        <asp:Button ID="btnAdd" runat="server" Text="Add New Recoard" Visible="true" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-primary"
                                            OnClick="btnAdd_Click" />--%>
                                        <asp:LinkButton ID="LbtnView" runat="server" Text="View Records" Visible="false" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-theme"
                                            OnClick="btnView_Click" CausesValidation="false"></asp:LinkButton>
                                        <asp:LinkButton ID="LbtnAdd" runat="server" Text="Add New Record" Visible="true" Width="150px" Font-Size="16px" CssClass="btn btn-block btn-sm btn-theme"
                                            OnClick="btnAdd_Click" CausesValidation="false"></asp:LinkButton>
                                    </div>
                                    <%--//Start View Item Panel--%>
                                    <div>
                                        <asp:Panel ID="pnlGrid" runat="server" Visible="true" Width="100%">

                                            <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" AllowSorting="True" ClientIDMode="Static" DataKeyNames="ID"
                                                CssClass="table table-striped table-bordered table-hover" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" ShowFooter="False" ShowHeaderWhenEmpty="True"
                                                OnSelectedIndexChanged="gvItem_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="grdbtnSelect" runat="server" ImageUrl="~/Images/Client/grid/Edit.png" CausesValidation="False" CommandName="Select"></asp:ImageButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle />
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Category" HeaderText="Category">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="BrandName" HeaderText="Brand Name">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <%--<asp:BoundField DataField="StdLength" HeaderText="Std Length">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StdWeight" HeaderText="Std Weight">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StdVolume" HeaderText="Std Volume">
                                                        <HeaderStyle />
                                                    </asp:BoundField>--%>
                                                    <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Sellable" HeaderText="Sellable" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Orderning" HeaderText="Orderning" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Returnable" HeaderText="Returnable" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Active" HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle />
                                                    </asp:BoundField>
                                                    <%--<asp:CheckBoxField DataField="IsActive" HeaderText="Active" InsertVisible="true">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <HeaderStyle Width="50px" />
                                                    </asp:CheckBoxField>--%>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <center>No matching records found</center>
                                                </EmptyDataTemplate>
                                                <RowStyle Wrap="true" />
                                                <HeaderStyle Font-Bold="true" VerticalAlign="Middle" HorizontalAlign="Center" CssClass="grid-header-theme" />
                                            </asp:GridView>

                                        </asp:Panel>
                                    </div>
                                    <%--//End Item View Panel--%>

                                    <%--//Start Add New Item Panel--%>
                                    <div>
                                        <asp:Panel ID="pnlDetail" runat="server" Visible="false" Width="100%">

                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group height-control">
                                                        <asp:Label ID="lblItemName" runat="server" Text="Item Name*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblSearchDescription" runat="server" Text="Search Description*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtSearchDescription" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblManufactor" runat="server" Text="Manufactured Company*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlManufactoreComapany" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator ErrorMessage="Please select Manufactore Comapany" ControlToValidate="ddlManufactoreComapany" Display="Dynamic" InitialValue="0" runat="server" ForeColor="Red" />
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblItemType" runat="server" Text="Item Type*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlItemType" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator ErrorMessage="Please select Item Type" ControlToValidate="ddlItemType" Display="Dynamic" InitialValue="0" runat="server" ForeColor="Red" />
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblItemCategory" runat="server" Text="Item Category*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlItemCategory" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator ErrorMessage="Please select Item Category" ControlToValidate="ddlItemCategory" Display="Dynamic" InitialValue="0" runat="server" ForeColor="Red" />
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtUnitPrice" runat="server" Display="Dynamic" ControlToValidate="txtUnitPrice" ErrorMessage="Please enter valid Unit Price" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblMarkPrice" runat="server" Text="Mark Price*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtMarkPrice" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtMarkPrice" runat="server" Display="Dynamic" ControlToValidate="txtMarkPrice" ErrorMessage="Please enter valid Mark Price" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblDiscountPrice" runat="server" Text="Discount Price*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtDiscountPrice" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtDiscountPrice" runat="server" Display="Dynamic" ControlToValidate="txtDiscountPrice" ErrorMessage="Please enter valid Discount Price" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblStdLength" runat="server" Text="Std Length*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtStdLength" runat="server" DataFormatString="{0:N2}" CssClass="form-control"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtStdLength" runat="server" Display="Dynamic" ControlToValidate="txtStdLength" ErrorMessage="Please enter valid std" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblStdWeigth" runat="server" Text="Std Weigth*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtStdWeigth" runat="server" DataFormatString="{0:N2}" CssClass="form-control"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtStdWeigth" runat="server" Display="Dynamic" ControlToValidate="txtStdWeigth" ErrorMessage="Please enter valid std" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>

                                                    <div class="form-group">
                                                        <asp:Label ID="lblStdVolume" runat="server" Text="Std Volume*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtStdVolume" runat="server" DataFormatString="{0:N2}" CssClass="form-control"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtStdVolume" runat="server" Display="Dynamic" ControlToValidate="txtStdVolume" ErrorMessage="Please enter valid std" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$">  
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblManufactureDate" runat="server" Text="Manufacture Date*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtManufactureDate" runat="server" CssClass="input-group date" Height="38px" TextMode="Date" required="required"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblExpirationDate" runat="server" Text="Expiration Date*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtExpirationDate" runat="server" CssClass="input-group date" Height="38px" TextMode="Date" required="required"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblQuntity" runat="server" Text="Quantity*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtQuntity" runat="server" CssClass="form-control" Height="38px" required="required"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtQuntity" runat="server" Display="Dynamic" ControlToValidate="txtQuntity" ErrorMessage="Please enter valid Quntity" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblMinimumOrderQuantity" runat="server" Text="Minimum Order Quantity*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtMinimumOrderQuantity" runat="server" CssClass="form-control" Height="38px" required="required"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RXtxtMinimumOrderQuantity" runat="server" Display="Dynamic" ControlToValidate="txtMinimumOrderQuantity" ErrorMessage="Please enter valid Minimum Order Quantity" ForeColor="Red" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblIsSalable" runat="server" Text="Salable*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlIsSalable" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblIsOrdering" runat="server" Text="Ordering*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlIsOrdering" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblIsReturnable" runat="server" Text="Returnable*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlIsReturnable" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblIsActive" runat="server" Text="Active*" Font-Bold="true"></asp:Label>
                                                        <asp:DropDownList ID="ddlIsActive" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="lblIsRemark" runat="server" Text="Remarks*" Font-Bold="true"></asp:Label>
                                                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" Height="85px" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                </div>
                                            </div>

                                            <%--//Image Row--%>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <%--<asp:Label ID="lblImage" runat="server" Text="Image" Font-Bold="true"></asp:Label>
                                                    <div class="mt-1 mb-1">                                                        
                                                        <asp:FileUpload ID="ImageUploader" runat="server" onchange="ShowImagePreview(this);"   placeholder="Choose Image" CssClass="btn btn-primary col start" />
                                                    </div>
                                                    <asp:Image ID="imgPreview" runat="server" alt="Uploaded image preview" Width="300" />--%>


                                                    <asp:UpdatePanel ID="ImagePanel" runat="server">
                                                        <ContentTemplate>
                                                            <asp:FileUpload ID="ImageUploader" runat="server" onchange="ShowImagePreview(this);" CssClass="row3" Width="100%" />
                                                            <%--<asp:Button runat="server" id="btnInsert" text="Upload" onclick="btnInsert_Click" />--%>

                                                            <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="btnInsert" />
                                                            <asp:PostBackTrigger ControlID="btnUpdate" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <asp:Image ID="imgPreview" runat="server" alt="Uploaded image preview" Height="100" Width="100" />
                                                </div>
                                                <div class="col-md-1">
                                                </div>

                                                <div class="col-md-5">
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
                                    <%--<asp:Button ID="btnCancel" runat="server" Text="CANCEL" Visible="false" CssClass="btn btn-secondary" Width="100px" OnClick="btnCancel_Click" CausesValidation="false"/>--%>
                                    <asp:LinkButton ID="LbtnCancel" runat="server" Text="CANCEL" Visible="false" CssClass="btn btn-secondary btn-theme" Width="100px" OnClick="btnCancel_Click" CausesValidation="false"></asp:LinkButton>
                                    <asp:Button ID="btnInsert" runat="server" Text="SAVE" Visible="false" CssClass="btn btn-success btn-theme" Width="100px" OnClick="btnInsert_Click" />
                                    <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" Visible="false" CssClass="btn btn-primary btn-theme" Width="100px" OnClick="btnUpdate_Click" />
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
            $('#<%= gvItem.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvItem.ClientID%>").find("tr:first"))).DataTable({
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
                        $('#<%= gvItem.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvItem.ClientID%>").find("tr:first"))).DataTable({
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
            debugger;
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
