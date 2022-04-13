<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ArtLoginPage.aspx.cs" Inherits="ArtMagicWeb88.ArtLoginPage" %>
<%@ Register TagPrefix="cDate" TagName="showDate" Src="~/WebUserControl1.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <cDate:showDate ID="ctlDate" runat="server" PageTitle="Welcome to Art Magic Web Gallery" />
    <link href ="css/loginPage.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />

<div class="box">
    <div class="main">
        <input type="checkbox" id="chk" aria-hidden="true"/>
        
        <div class="login">
            <label for="chk" aria-hidden="true">Artist Login</label>
            <table align = "center" >
                <tr>
                    <td class="text-center" >
                        <asp:TextBox ID="email" runat="server" placeholder="Email" CssClass="input" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="* Please insert a valid email" Font-Size="Small" ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" CssClass="input"></asp:TextBox>

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
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" Font-Size="X-Small" Font-Underline="True" NavigateUrl="~/ArtistRegisterPage.aspx">Sign Up now!</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="login" runat="server" style="color: #FF0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</div>

</asp:Content>