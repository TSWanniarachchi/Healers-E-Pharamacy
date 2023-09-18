<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ECOMWebApp.Pages.Customer.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>MyMedi SignUp</title>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="../../Content/bootstrap.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="../../Fonts/css/fonts.googleapis.css" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="../../Plugins/fontawesome/css/all.min.css" />
    <style>
        body {
            /*background-color: #182b3a;
            background-image: linear-gradient(315deg, #182b3a 0%, #20a4f3 74%);*/
            background-color: rgb(15,75,143);
            background: linear-gradient(45deg, rgba(15,75,143,1) 0%, rgb(26, 2, 0) 100%);
        }
    </style>


    <style type="text/css">
        .btn {
            display: block;
            width: 220px;
            height: 70px;
            border-radius: 25px;
            outline: none;
            border: none;
            background-image: linear-gradient(to right, #ffb901, #007bff, #ffb901);
            background-size: 200%;
            font-size: 1.2rem;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            text-transform: uppercase;
            margin: 1rem 0;
            cursor: pointer;
            transition: .5s;
        }

            .btn:hover {
                background-position: right;
            }

        .linkhover:hover {
            color: #ffb901;
        }
    </style>

    <!-- sweetalert2 -->
    <script src="../../Scripts/sweetalert2.js"></script>
    <script type="text/javascript">
        function sweetalert(type, title, message) {
            Swal.fire({
                icon: type,
                title: title,
                text: message,
            })
        }
    </script>

</head>

<body>

    <!-- Content Wrapper. Contains page content -->
    <%--<div class="container">--%>


    <div class="container-fluid">
        <div class="mt-2 mb-1">
            <center>
                 <img class="avatar" src="../../Images/Logo/circle-logo.png" width="100" height="100" />
           </center>
            <%--  <div class="content-wrapper">--%>

            <form id="form1" runat="server">

                <!-- Content Header (Page header) -->
                <div class="content">


                    <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="col-md text-center mt-1">
                                <asp:Label ID="lblMyMedi" runat="server" Text="Healers Pharmacy Sign Up Form" Font-Size="X-Large" Font-Italic="True" Font-Bold="True" ForeColor="White"></asp:Label>
                            </div>

                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblName" runat="server" Text="Name*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" BorderColor="Black"
                                            pattern="^[a-z A-Z]{3,}$" title="Enter your name" required="required" autocomplete="off" placeholder="Enter your name"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" BorderColor="Black"
                                            pattern="^[a-z A-Z 0-9 ,./]{3,}$" title="Enter your address" required="required" autocomplete="off" placeholder="Enter your address"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblDistrict" runat="server" Text="District*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <div class="">
                                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" Height="38px" BorderColor="Black">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblNic" runat="server" Text="NIC*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtNic" runat="server" CssClass="form-control" Height="38px" BorderColor="Black"
                                            pattern="^([0-9]{9}[x|X|v|V]|[0-9]{12})$" title="Enter your NIC" required="required" autocomplete="off" placeholder="Enter your NIC"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Gender*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <div class="">
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Height="38px" BorderColor="Black">
                                                <asp:ListItem Value="0" Selected="True">Select one</asp:ListItem>
                                                <asp:ListItem Value="1">Male</asp:ListItem>
                                                <asp:ListItem Value="2">Female</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblMobile" runat="server" Text="Mobile*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" Height="38px" BorderColor="Black"
                                            pattern="^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|91)(0|2|3|4|5|7|9)|7(0|1|4|5|6|7|8)\d)\d{6}$" MaxLength="10"
                                            title="Enter your Mobile Number" required="required" autocomplete="off" placeholder="Enter your mobille number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblEmail" runat="server" Text="Email*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" ValidateRequestMode="Enabled" BorderColor="Black"
                                            pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Enter your email" required="required" autocomplete="off" placeholder="Enter your email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblUserName" runat="server" Text="UserName*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" BorderColor="Black"
                                            pattern="^[a-zA-Z0-9]{3,}$" titel="Enter Characters Only" required="required" autocomplete="off" placeholder="Enter username"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblPassword" runat="server" Text="Password*" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" BorderColor="Black"
                                            titel="Enter Characters Only" required="required" autocomplete="off" placeholder="Enter strong password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lblConfimPassword" runat="server" Text="Confirm Password" Font-Bold="true" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtConfimPassword" runat="server" CssClass="form-control" TextMode="Password" BorderColor="Black"
                                            titel="Enter Characters Only" required="required" autocomplete="off" placeholder="Enter password again"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <center>
                                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" Height="40px" Font-Size="18px" OnClick="btnSave_Click" />
                               </center>

                                <div class="text-center" style="color: white !important">
                                    Alrady have an account? <asp:HyperLink ID="HyperLink5" CssClass="linkhover" runat="server" Text="Login Here" NavigateUrl="~/Pages/Login.aspx"></asp:HyperLink>
                                </div>
                            </div>

                            <div class="row mt-2" style="color: white;">
                                <div class="col-4 text-left">
                                    <b>Ocean Blue Software &trade;</b>
                                </div>

                                <div class="col-8 text-right">
                                    <strong>Copyright &copy; <%: DateTime.Now.Year %> <a class="linkhover" href="https://oceanbluesoftwaresolutions.com">OBS &trade;</a> All rights reserved. </strong>
                                </div>
                            </div>

                        </div>

                    </div>


                    <%-- </div>--%>
                    <%-- <div style="color: white" class="float-right d-none d-sm-inline">
                    </div>--%>

                    <!-- Default to the left -->





                </div>

            </form>

        </div>
    </div>

    <%-- </div>--%>
    <%-- </div>--%>
    <!-- /.content-wrapper -->


    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
