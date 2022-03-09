<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WishList.aspx.cs" Inherits="ArtMagicWeb88.WishList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




    <p class="text-center">
        <br />
        <span style="font-size: xx-large"><strong>Your WishList</strong></span></p>
     <asp:GridView ID="WishList1" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4" OnRowDataBound="OnRowDataBound">   
        <Columns>
        <asp:BoundField DataField="productName" HeaderText="Product Name" />
        <asp:BoundField DataField="image" HeaderText="ImgName" />
            <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="price" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField HeaderText="Action">            
            <ItemTemplate>
                <asp:Button ID="btnRemove" runat="server" Text="Delete" />
            </ItemTemplate>
        </asp:TemplateField>    
        
         
        </Columns>    
    </asp:GridView>
    <br />
    <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    <br />




</asp:Content>