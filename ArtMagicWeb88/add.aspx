<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="ArtMagicWeb88.testing1234" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
    UserID: <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
        <br />
    Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
    Description: <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
        <br />
    Price : <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        <br />
    Quantity : <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <br />
    Image: <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
    <hr />
    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound">
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="User Id" />
            <asp:BoundField DataField="Id" HeaderText="Art Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="ImgName" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
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
    </form>
</body>
</html>
