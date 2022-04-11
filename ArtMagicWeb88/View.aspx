<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteArtist.Master" CodeBehind="View.aspx.cs" Inherits="ArtMagicWeb88.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">
        body
        {
            width:0%;
            background: whitesmoke;
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

            &nbsp;
            
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/add.aspx">Add</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/UpdateImage.aspx">Edit Image</asp:HyperLink>
            <br />
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="productId" OnRowDataBound="OnRowDataBound" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <Columns>
                    
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    
                    <asp:BoundField DataField="productId" HeaderText="ArtID" InsertVisible="False" ReadOnly="True" SortExpression="productId" />
                    <asp:BoundField DataField="userid" HeaderText="UserId" InsertVisible="False" ReadOnly="True" SortExpression="userid" />
                    <asp:BoundField DataField="productName" HeaderText="productName" SortExpression="productName" />
                    <asp:BoundField DataField="artistName" HeaderText="artistName" InsertVisible="False" ReadOnly="True" SortExpression="artistName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="image" HeaderText="ImgName" InsertVisible="False" ReadOnly="True" SortExpression="image" />
                    <asp:BoundField DataField="ContentType" HeaderText="ContentType" InsertVisible="False" ReadOnly="True" SortExpression="ContentType" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <br />
                </EmptyDataTemplate>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <div id="dialog" style="display: none">
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([userid] = @userid)" DeleteCommand="DELETE FROM [Product] WHERE [productId] = @productId" InsertCommand="INSERT INTO [Product] ([userid], [productName], [artistName], [price], [quantity], [description], [image], [contentType], [data]) VALUES (@userid, @productName, @artistName, @price, @quantity, @description, @image, @contentType, @data)" UpdateCommand="UPDATE [Product] SET [productName] = @productName, [price] = @price, [quantity] = @quantity, [description] = @description WHERE [productId] = @productId">
                <DeleteParameters>
                    <asp:Parameter Name="productId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="artistName" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="contentType" Type="String" />
                    <asp:Parameter Name="data" Type="Object" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="userid" SessionField="Artist_id" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userid" Type="String" />
                    <asp:Parameter Name="productName" Type="String" />
                    <asp:Parameter Name="artistName" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="contentType" Type="String" />
                    <asp:Parameter Name="data" Type="Object" />
                    <asp:Parameter Name="productId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
            $("[id*=GridView1] img").click(function () {
                $('#dialog').html('');
                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
            });
        });
    </script>
    </asp:Content>
