<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMagicWeb88._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="jumbotron">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/welcome.jpg" />
        <%--<h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    

    


    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/best2016.jpg" />
        </ItemTemplate>
    </asp:DataList>
    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/best2017.jpg" />
    <br />
    <br />
    <br />

    

    


</asp:Content>
