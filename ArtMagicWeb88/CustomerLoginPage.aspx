<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerLoginPage.aspx.cs" Inherits="ArtMagicWeb88.CustomerLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href ="css/loginPage.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />

<div class="box">
    <div class="main">
        
        
        <div class="login">
            <label for="chk" aria-hidden="true">Customer Login</label>
            <table align = "center" >
                <tr>
                    <td >
                        <asp:TextBox ID="email" runat="server" placeholder="Email" CssClass="input"></asp:TextBox>

                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="password" runat="server" placeholder="Password" CssClass="input" TextMode="Password"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="button" OnClick="loginBtn_Click" />
                    </td>

                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <span style="font-size: x-small; color: #FFFFFF;">still haven&#39;t have account?</span>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" Font-Size="X-Small" Font-Underline="True" NavigateUrl="~/CustomerRegisterPage.aspx">Sign Up now!</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="login" runat="server" Text="Label1"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</div>
</asp:Content>
