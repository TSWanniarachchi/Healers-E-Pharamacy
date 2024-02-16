<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="ECOMWebApp.Pages.Customer._404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphForm" runat="server">

    <div class="ps-page--notfound">
        <div class="container">
            <ul class="ps-breadcrumb">
                <li class="ps-breadcrumb__item"><a href="../Customer/Home.aspx">Home</a></li>
                <li class="ps-breadcrumb__item active" aria-current="page">404</li>
            </ul>
            <div class="ps-page__content">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-5">
                        <img src="../../Images/Customer/cartoon-doctor.jpg" alt="cartoon-doctor">
                    </div>
                    <div class="col-12 col-md-6 col-lg-7">
                        <h1 class="ps-page__name">404</h1>
                        <h5>This page has been probably moved somewhere...</h5>
                        <p>Please back to homepage or check our offer</p>
                        <div><a class="ps-btn ps-btn--primary" href="../Customer/Home.aspx">Back to homepage</a></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
