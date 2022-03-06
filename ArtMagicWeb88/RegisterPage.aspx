<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="ArtMagicWeb88.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    
    <style type="text/css">
        .auto-style1 {
            width: 405px;
        }
        .auto-style2 {
            width: 166px;
        }
        .auto-style3 {
            width: 425px;
        }
    </style>
    
</head>
    <body>
        <form id="form1" runat="server">
            <div class="auto-style1" style="margin: auto; border-style: hidden; padding: inherit; width: 700px; height: 600px">
                <table align = "center" >
                    <tr >
                        <td colspan="2" align="center">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="center">
                            <h3>&nbsp;Sign Up Now!</h3>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2"><b>Email :</b></td>
                        <td class="auto-style3">
                            <asp:TextBox ID="regEmail" runat="server" Height="25px" Width="220px" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="regEmail" ErrorMessage="Please insert a valid email address with &quot;@&quot;." Font-Size="Small" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="regEmail" ErrorMessage="Only character is required" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" ><b>Password :</b></td>
                        <td class="auto-style3">
                            <asp:TextBox ID="regPassword" runat="server" Height="25px" Width="220px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="regEmail" ErrorMessage="Password field is empty" Font-Size="Small" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" ><b>Confirm Password :</b></td>
                        <td class="auto-style3">
                            <asp:TextBox ID="regComPassword" runat="server" Height="25px" Width="220px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="regEmail" ErrorMessage="Confirm password field is empty" Font-Size="Small" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="regPassword" ControlToValidate="regComPassword" ErrorMessage="Password is not same" Font-Size="Small" ForeColor="#FF3300"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="signBtn" runat="server" Font-Bold="True" Font-Size="X-Small" Height="30px" Text="Sign Up" Width="92px" OnClick="signBtn_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False" Font-Size="Small" ForeColor="#FF3300" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
