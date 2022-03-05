﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateImage.aspx.cs" Inherits="ArtMagicWeb88.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.min.css"/>
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
        <!--Inverted Navbar Start Here-->  
    <!--<nav> tag  start with classes .navbar and .navbar-inverse -->  
    <nav class="navbar navbar-inverse">  
        <div class="container-fluid">  
            <!--Navbar Header Start Here-->  
            <div class="navbar-header">  
                <a class="navbar-brand" href="view.aspx">ArtMagicWeb</a>  
            </div>  
            <!--Navbar Header End Here-->  
            <!--Menu Start Here-->  
            <ul class="nav navbar-nav">  
                <li><a href="view.aspx">Home</a></li>  
                <li><a href="add.aspx">Add</a></li>  
                <li class="active"><a href="UpdateImage.aspx">Edit Image</a></li>  
            </ul>  
            <!--Menu End Here-->  
        </div>  
    </nav>  
    <!--<nav> tag end-->  
    <!--Inverted Navbar End Here-->  
    <script src="js/jquery-2.1.4.min.js"></script>  
    <script src="js/bootstrap.min.js"></script> 
<form id="form1" runat="server">  
    <div>      
        <h2 style="text-decoration: underline;">Edit Image</h2>
    Image:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <small><mark>(Click the edit button before insert image)</mark></small><br />
    <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" CellPadding="6" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ArtID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Id")%>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>                  
                <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ImgName">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ImgName" runat="server" Text='<%#Eval("ImgName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Image">  
                    <ItemTemplate>  
                        <asp:Image ID="Image1" runat="server" />
                    </ItemTemplate>    
                </asp:TemplateField> 
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView> 
            <div id="dialog" style="display: none">
    </div>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
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
      
    </div>  
</form>  
</body>
</html>