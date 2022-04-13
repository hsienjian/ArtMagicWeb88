<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerRegisterPage.aspx.cs" Inherits="ArtMagicWeb88.CustomerRegisterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href ="css/loginPage.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />

<div class="box">
    <div class="main1">
       
        
        <div class="signup">
            
            <label for="chk" aria-hidden="true">Customer Sign Up!</label>
            
            <table align = "center" >
                <tr>
                    <td >
                        <asp:TextBox ID="regCusUsername" runat="server" placeholder="Username" CssClass="input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="regCusEmail" runat="server" placeholder="Email" CssClass="input" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="regCusEmail" Font-Size="Small" ForeColor="#CC3300">Please insert a valid email address with &quot;@&quot;.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="regCusPassword" runat="server" placeholder="Password" CssClass="input" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="regCusPassword" Font-Size="Small" ForeColor="#CC3300">Password field is empty</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
    
                        <td>
                            <asp:TextBox ID="regCusComPassword" runat="server" placeholder="Confirm Password" CssClass="input" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="regCusComPassword" Font-Size="Small" ForeColor="#CC3300">Confirm password field is empty</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="regCusPassword" ControlToValidate="regCusComPassword" ErrorMessage="Confirm password is not same" Font-Size="Small" ForeColor="#FF3300"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <%--<td class="auto-style2" ><strong>Gender :</strong></td>--%>
                        <td>
                            <asp:DropDownList ID="cusGender" runat="server" CssClass="select">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <br /><asp:TextBox ID="regCusphone" runat="server" TextMode="Phone" placeholder="Phone" CssClass="input"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="regCusphone" Font-Size="Small" ForeColor="#CC3300">Please insert only numeric character.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="regCusphone" ErrorMessage="Only numeric is required" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^(\+?6?01)[0|1|2|3|4|6|7|8|9]\-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="regCusAddress" runat="server" TextMode="MultiLine" placeholder="Address" CssClass="input"></asp:TextBox>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="signBtn" runat="server"  Text="Sign Up" CssClass="button" OnClick="signBtn_Click" />
                        </td>
                    </tr>
                <tr>
                    <td align="center" colspan="2">
                        <span style="font-size: x-small; color: #FFFFFF">already have an account?</span>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" Font-Size="X-Small" Font-Underline="True" NavigateUrl="~/CustomerLoginPage.aspx">Sign in now</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</asp:Content>
