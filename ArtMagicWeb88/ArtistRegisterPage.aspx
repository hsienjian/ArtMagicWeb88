<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ArtistRegisterPage.aspx.cs" Inherits="ArtMagicWeb88.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href ="css/loginPage.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />

<div class="box">
    <div class="main1">
        <input type="checkbox" id="chk" aria-hidden="true"/>
        
        <div class="signup">
            
            <label for="chk" aria-hidden="true">Artist Sign Up!</label>
            
            <table align = "center" >
                <tr>
                    <td >
                        <asp:TextBox ID="regArtUsername" runat="server" placeholder="Username" CssClass="input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="regArtEmail" runat="server" placeholder="Email" CssClass="input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="regArtEmail" Font-Size="Small" ForeColor="#CC3300">Please insert a valid email address with &quot;@&quot;.</asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="regArtPassword" runat="server" placeholder="Password" CssClass="input" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="regArtPassword" Font-Size="Small" ForeColor="#CC3300">Password field is empty</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
    
                        <td>
                            <asp:TextBox ID="regArtComPassword" runat="server" placeholder="Confirm Password" CssClass="input" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="regArtComPassword" Font-Size="Small" ForeColor="#CC3300">Confirm password field is empty</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="regArtPassword" ControlToValidate="regArtComPassword" ErrorMessage="Confirm password is not same" Font-Size="Small" ForeColor="#FF3300"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <%--<td class="auto-style2" ><strong>Gender :</strong></td>--%>
                        <td>
                            <asp:DropDownList ID="artGender" runat="server" CssClass="select">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <br /><asp:TextBox ID="regArtphone" runat="server" TextMode="Phone" placeholder="Phone" CssClass="input"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="regArtphone" Font-Size="Small" ForeColor="#CC3300">Please insert only numeric character.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="regArtphone" ErrorMessage="Only numeric is required" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^(\+?6?01)[0|1|2|3|4|6|7|8|9]\-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="regArtAddress" runat="server" TextMode="MultiLine" placeholder="Address" CssClass="input"></asp:TextBox>
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
                        <span style="font-size: x-small; color: #FFFFFF;">already have an account?</span>
                        <asp:HyperLink ID="Hyperink" runat="server" Font-Italic="True" Font-Size="X-Small" Font-Underline="True" NavigateUrl="~/ArtLoginPage.aspx">Sign in now</asp:HyperLink>

                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</asp:Content>
