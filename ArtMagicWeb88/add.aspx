
﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteArtist.Master" CodeBehind="add.aspx.cs" Inherits="ArtMagicWeb88.testing1234" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table img
        {
            height: 150px;
            width: 150px;
            cursor: pointer;
        }
        #dialog img
        {
            height: 550px;
            width: 575px;
            cursor: pointer;
        }
    </style>

    &nbsp;&nbsp;
    <br />
&nbsp; UserID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtUserId" runat="server" Width="165px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
    Price :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <br />
        <br />
    &nbsp;
    Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtName" runat="server" style="margin-left: 0px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
    Quantity : <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <br />
        <br />
    &nbsp;
    Description: <asp:TextBox ID="txtDesc" runat="server" Height="92px" Width="371px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    &nbsp;
    Image:<asp:FileUpload ID="FileUpload1" runat="server" />
        &nbsp;<br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <hr />
    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="User Id" />
            <asp:BoundField DataField="Id" HeaderText="Art Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="ImgName" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Image">
</head>
<body>
    <form id="form1" runat="server">
    Product Name: <asp:TextBox ID="productName" runat="server"></asp:TextBox>
        <br />
        Artist Name :
        <asp:TextBox ID="artistName" runat="server"></asp:TextBox>
        <br />
    Price : <asp:TextBox ID="price" runat="server"></asp:TextBox>
        <br />
    Quantity :
        <asp:TextBox ID="quantity" runat="server"></asp:TextBox>
        <br />
    Description: <asp:TextBox ID="desc" runat="server"></asp:TextBox>
        <br />
    Image: <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
    <hr />
    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound">
        <Columns>
            <asp:BoundField DataField="productId" HeaderText="Product ID" />
            <asp:BoundField DataField="productName" HeaderText="Product Name" />
            <asp:BoundField DataField="artistName" HeaderText="Artist Name" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="image" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <div id="dialog" style="display: none">
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
                height: 600,
                width: 600,
                title: "Zoomed Image"
            });
            $("[id*=gvImages] img").click(function () {
                $('#dialog').html('');
                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
            });
        });
    </script>

    </asp:Content>
