<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteArtist.Master" CodeBehind="OrderRecord.aspx.cs" Inherits="ArtMagicWeb88.WebForm3" %>

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
<div>

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ForeColor="Black">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="orderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="orderID" />
            <asp:BoundField DataField="pName" HeaderText="Product Name"  ReadOnly="True" SortExpression="pName" />
            <asp:BoundField DataField="pPrice" HeaderText="Product Price"   ReadOnly="True" SortExpression="pPrice" />
            <asp:BoundField DataField="CustomerId" HeaderText="Customer Id"  ReadOnly="True" SortExpression="CustomerId" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity"  ReadOnly="True" SortExpression="quantity" />
            <asp:BoundField DataField="artistId" HeaderText="Artist Id"  ReadOnly="True" SortExpression="artistId" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [orderID] = @orderID" InsertCommand="INSERT INTO [OrderDetails] ([pName], [pPrice], [CustomerId], [quantity], [artistId], [status]) VALUES (@pName, @pPrice, @CustomerId, @quantity, @artistId, @status)" SelectCommand="SELECT [orderID], [pName], [pPrice], [CustomerId], [quantity], [artistId], [status] FROM [OrderDetails] WHERE ([artistId] = @artistId)" UpdateCommand="UPDATE [OrderDetails] SET  [status] = @status WHERE [orderID] = @orderID">
        <DeleteParameters>
            <asp:Parameter Name="orderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pName" Type="String" />
            <asp:Parameter Name="pPrice" Type="Decimal" />
            <asp:Parameter Name="CustomerId" Type="Int32" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="artistId" Type="Int32" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="artistId" SessionField="Artist_id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="pName" Type="String" />
            <asp:Parameter Name="pPrice" Type="Decimal" />
            <asp:Parameter Name="CustomerId" Type="Int32" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="artistId" Type="Int32" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="orderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</div>


</asp:Content>
