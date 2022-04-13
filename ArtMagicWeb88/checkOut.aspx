<%@ Page Language="C#" MasterPageFile="~/login.Master" AutoEventWireup="true" CodeBehind="checkOut.aspx.cs" Inherits="ArtMagicWeb88.checkOut" %>
<%@ Register TagPrefix="greet" TagName="showGreet" Src="~/loginUserControl.ascx" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <greet:showGreet ID="ctlGreet" runat="server" />
    <link href="css/background.css" rel="stylesheet" />
    <p class="text-center">
        <br />
        <span style="font-size: xx-large"><strong>CheckOut</strong></span>
    </p>
    <br />
    <br />

    <div class="container-fluid mt-4 mb-5">
        <div class="container">
            <div class="row">
                <asp:ListView ID="lvcheckOut" runat="server" ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1">
                    <%-- Start Call all the Items --%>
                    <ItemTemplate>
                        <div class="col-12 col-md-6 mb-2">
                            <div class="row mb-3">
                                <div class="col-4 col-md-4">
                                    <img class="img-thumbnail" alt="artImg" src="<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data"))%>" />
                                </div>
                                <div class="col-8 col-md-7">
                                    <div class="row">
                                        <div class="col-10 font-style-1">
                                            <h5>Product ID:<%# Eval("productId") %></h5>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted;color">Product Name:<%# (Eval("productName"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted;color">Description: <%# (Eval("description"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted;color">Price: <%# (Eval("price"))%></p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <br />
    <br />
    <strong>
        <p style="font-size: large">Please fill in your details below :</p>
        <p style="font-size: large"><span style="font-size: x-small; color: #FF3300">**COD available only for Currently**</span></p>
    </strong>
    <br />
    Full Name :
        <asp:TextBox ID="fName" runat="server" ForeColor="Black"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" Font-Size="Small" ForeColor="#CC3300" ErrorMessage="Please enter your name">*</asp:RequiredFieldValidator>
    <br />
    <br />
    Email Address :
        <asp:TextBox ID="email" runat="server" ForeColor="Black" TextMode="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" Font-Size="Small" ForeColor="#CC3300" ErrorMessage="Please enter email address">*</asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">* Please add @ within it</asp:RegularExpressionValidator>
    <br />
    Address :
        <asp:TextBox ID="address" runat="server" ForeColor="Black" Height="22px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" Font-Size="Small" ForeColor="#CC3300" ErrorMessage="Please enter shipping address">*</asp:RequiredFieldValidator>
    <br />
    <br />
    Phone Number :
        <asp:TextBox ID="pNumber" runat="server" ForeColor="Black"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pNumber" Font-Size="Small" ForeColor="#CC3300" ErrorMessage="Please enter contact number">*</asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="pNumber" ForeColor="#CC3300" ValidationExpression="^(\+?6?01)[0|1|2|3|4|6|7|8|9]\-*[0-9]{7,8}$">* Only number available</asp:RegularExpressionValidator>
    <br />
    Payment Method :
        <asp:DropDownList ID="ddlPayment" runat="server" ForeColor="Black">
            <asp:ListItem>COD</asp:ListItem>
            <asp:ListItem Value="Card">Card</asp:ListItem>
            <asp:ListItem Value="E-Banking"></asp:ListItem>
        </asp:DropDownList>
    <br />
    <br />
    Total Amount:
    <asp:TextBox ID="tAmount" runat="server" Enabled="False" BackColor="White" ForeColor="Black"></asp:TextBox>

    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConfirmPayment" runat="server" Text="Confirm Payment" BackColor="#990099" OnClick="btnConfirmPayment_Click" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />





</asp:Content>
