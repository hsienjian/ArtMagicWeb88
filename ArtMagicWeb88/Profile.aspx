<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.cs" Inherits="ArtMagicWeb88.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .auto-style8 {
            width: 541px;
        }
    </style>

    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style8">
                <div style="font-family: 'Comic Sans MS'; font-size: large; text-align: center; vertical-align: middle; border: 2px solid #C0C0C0">
                    <br />
                    Profile Maintenenance<br />
                    <br />
                    <br />
                    You are logged in as:
            <asp:Label ID="lblUsername" runat="server"></asp:Label>
                    <br />
                    <br />
                    Wish to change your password?<br />
                    Please
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ChangePasswordPage.aspx">click here</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    If this isn&#39;t your correct username,<br />
                    please
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginPage.aspx">click here</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Back to Home" PostBackUrl="~/HomePage.aspx" BackColor="Black" BorderColor="Black" BorderStyle="Groove" CssClass="buttons" Height="43px" Width="194px" />
                    <br />
                    <br />
                    <br />
                </div>
                <br />
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <p>
    </p>
</asp:Content>
