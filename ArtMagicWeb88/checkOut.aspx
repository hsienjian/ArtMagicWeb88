<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ArtMagicWeb88.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <br />
    





        <p class="text-center" style="font-size: xx-large"><strong>Check Out</strong></p>
        <br />
        <strong><p style="font-size: large">Please fill in your details below :</p>
        <p style="font-size: large"><span style="font-size: x-small; color: #FF3300">**COD available only for 2022**</span></p></strong><br />
        Full Name :
        <asp:TextBox ID="fName" runat="server"></asp:TextBox>
        <br />
        <br />
        Email Address :
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <br />
        <br />
        Address :
        <asp:TextBox ID="address" runat="server"></asp:TextBox>
        <br />
        <br />
        Phone Number :
        <asp:TextBox ID="pNumber" runat="server"></asp:TextBox>
        <br />
        <br />
        Payment Method :
        <asp:DropDownList ID="ddlPayment" runat="server">
            <asp:ListItem>COD</asp:ListItem>
            <asp:ListItem Value="Card">Card</asp:ListItem>
            <asp:ListItem Value="E-Banking"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Do you want to save this address as default?&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Yes" />
&nbsp;<asp:CheckBox ID="CheckBox2" runat="server" Text="No" />
        <br />
        




</asp:Content>