<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WishList.aspx.cs" Inherits="ArtMagicWeb88.WishList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <p class="text-center">
        <br />
        <span style="font-size: xx-large"><strong>Your WishList</strong></span></p>
     <asp:GridView ID="WishList1" runat="server" AutoGenerateColumns="False" ShowFooter="True" CellPadding="4" OnRowDataBound="OnRowDataBound" OnRowDeleting="WishList1_RowDeleting" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">   
        <Columns>
        <asp:BoundField DataField="productName" HeaderText="Product Name" />
        <asp:BoundField DataField="image" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="150" Width="150" />
                </ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="price" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField HeaderText="Action">            
            <ItemTemplate>
                <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirmDelete(this);"/>
            </ItemTemplate>
        </asp:TemplateField>    
        
         
        </Columns>    
         <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
         <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
         <RowStyle BackColor="White" ForeColor="#330099" />
         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
         <SortedAscendingCellStyle BackColor="#FEFCEB" />
         <SortedAscendingHeaderStyle BackColor="#AF0101" />
         <SortedDescendingCellStyle BackColor="#F6F0C0" />
         <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <br />
    <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    <br />




</asp:Content>