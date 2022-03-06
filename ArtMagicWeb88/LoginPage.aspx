<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ArtMagicWeb88.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-size: small;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td colspan="2" align="center"><h3>WELCOME TO ARTMAGICWEB!</h3></td>
                </tr>
                <tr>
                    <td align="center" style="width:50%"><b>Email ID :</b></td>
                    <td>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width:50%"><b>Password :</b></td>
                    <td>
                        <asp:TextBox ID="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="loginBtn" runat="server" Text="Login" Width="69px" OnClick="loginBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <span class="auto-style2">Haven&#39;t sign up?</span>
                        <asp:HyperLink ID="regLink" runat="server" CssClass="auto-style2" Font-Italic="True" Font-Overline="False" Font-Size="Small" Font-Underline="True" ForeColor="#0099FF" NavigateUrl="~/RegisterPage.aspx">Sign up here</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
