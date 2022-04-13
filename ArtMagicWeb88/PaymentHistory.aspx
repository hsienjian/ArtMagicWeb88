<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="PaymentHistory.aspx.cs" Inherits="ArtMagicWeb88.PaymentHistory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        body {
            background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            color: white;
            padding-top: 100px;
            padding-bottom: 800px;
        }
        
    </style>

    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="auto-style9" HorizontalAlign="Center" DataKeyNames="Payment_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="1" Width="1200px">
            <Columns>
                <asp:BoundField DataField="Payment_id" HeaderText="Payment_id" InsertVisible="False" ReadOnly="True" SortExpression="Payment_id" />
                <asp:BoundField DataField="ReceiverName" HeaderText="ReceiverName" SortExpression="ReceiverName" />
                <asp:BoundField DataField="ReceiverAddress" HeaderText="ReceiverAddress" SortExpression="ReceiverAddress" />
                <asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" ForeColor="White" Font-Bold="true" HorizontalAlign="left" Font-Size="Large"  />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="left" />
            <RowStyle ForeColor="#000066" HorizontalAlign="left" Font-Size="Large" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Payment_id], [ReceiverName], [ReceiverAddress], [PaymentMethod], [Status], [Date] FROM [Payment] WHERE ([Cus_id] = @Cus_id)">
            <SelectParameters>
                <asp:SessionParameter Name="Cus_id" SessionField="Cus_id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

