<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMagicWeb88._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-fluid" style="padding-top:35px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/homepage_banner.png"  />
    </div>

    

    


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
    <br />
    <br />

    Artist
    <br />
    <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatDirection="Horizontal"  RepeatColumns="3" ShowFooter="False" ShowHeader="False" DataKeyField="Id" DataSourceID="product">
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            productName:
            <asp:Label ID="productNameLabel" runat="server" Text='<%# Eval("productName") %>' />
            <br />
            artistName:
            <asp:Label ID="artistNameLabel" runat="server" Text='<%# Eval("artistName") %>' />
            <br />
            price:
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
            <br />
            image:
            <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
            <br />
            quantity:
            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
            <br />
<br />
        </ItemTemplate>

        </asp:DataList>
    

    
    
    <asp:SqlDataSource ID="product" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Table]"></asp:SqlDataSource>
    <br />
    

    
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="product">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
            <asp:BoundField DataField="artistName" HeaderText="artistName" SortExpression="artistName" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        

    


</asp:Content>
