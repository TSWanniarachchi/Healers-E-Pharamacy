<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECOMWebApp.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login </title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <link href="../Content/login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="../Scripts/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a81368914c.js" type="text/javascript"></script>

    <style type="text/css">
        .btn {
            display: block;
            width: 220px;
            height: 40px;
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

    <script type="text/javascript">
        function PrintDiv() {
            if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0) {
                document.getElementsByTagName("body")[0].className += " safari";
            }
        }
    </script>


</head>
<body class="loginbody">

    <span id="circle" class="circle"></span>

    <form id="form2" runat="server">
        <%-- <div class="content-wrapper">--%>
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-7 mobile-hidden"></div>

                <div class="col-md-4 login-form-style mobile-view" style="margin-left: 45px; padding-left: 55px">

                    <center>
                        <img src="../Images/Logo/circle-logo.png" alt="" width="120px" height="120px" />
                        <p style="color: white; font-size: 27px;">Healers Pharmacy & Grocery (Pvt) LTD </p>
                    </center>

                    <div class="col-md-12" style="color: white; text-align: center">
                        <p style="color: #ffb901; font-size: 24px; font-style: italic;">Purchase and get medicines delivered at your door step</p>
                    </div>
                    <div>
                        <p class="title" style="color: white; font-size: 20px;">Username</p>
                        <center>
                            <asp:TextBox ID="txtUsername" runat="server" name="username" placeholder="Username" Font-Size="18px" CssClass="username form-control shadow" Height="37px" Width="250px" required="" autofocus=""></asp:TextBox>
                        </center>
                    </div>

                    <div>
                        <p class="title" style="color: white; font-size: 20px;">Password</p>
                        <center>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" name="password" Font-Size="18px" CssClass="username form-control shadow" Height="37px" placeholder="Password" required=""></asp:TextBox>
                        </center>
                    </div>

                    <div class="row mt-2" style="color: white; font-size: 14px;">
                        <div class="col-6 text-left">
                            <asp:HyperLink ID="HyperLink4" runat="server" Text="Forgot Password" NavigateUrl="#" CssClass="linkhover"></asp:HyperLink>
                        </div>

                        <div class="col-6 text-right">
                            <asp:HyperLink ID="HyperLink5" runat="server" Text="Create Account" NavigateUrl="~/Pages/Customer/SignUp.aspx" CssClass="linkhover"></asp:HyperLink>
                        </div>
                    </div>


                    <div>
                        <center>
                            <asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        </center>
                    </div>

                    <div class="mt-3" style="text-align: center">
                        <p style="color: white; font-size: 14px; margin: 0px">Copyright © 2021 <a href="" target="_blank" class="linkhover">OBS Team.</a> All rights reserved.</p>
                    </div>

                </div>
            </div>
            <%--</div>--%>
    </form>
</body>
</html>
