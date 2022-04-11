<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteArtist.Master" CodeBehind="add.aspx.cs" Inherits="ArtMagicWeb88.testing1234" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    <style type="text/css">
        body
        {
            width:0%;
            background-color:whitesmoke;
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

    <div style="margin-left:500px;">
    &nbsp;&nbsp;
    <br />
    &nbsp; Artist name: <asp:TextBox ID="txtArtist" runat="server"></asp:TextBox>
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
            <asp:BoundField DataField="userid" HeaderText="UserId" />
            <asp:BoundField DataField="productId" HeaderText="productId" />
            <asp:BoundField DataField="productName" HeaderText="productName" />
            <asp:BoundField DataField="artistName" HeaderText="artistName" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="image" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Image">
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
