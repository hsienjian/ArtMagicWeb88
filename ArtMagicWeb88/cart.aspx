<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtMagicWeb88.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1 class="text-center">Shopping Cart</h1></div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4">   
        <Columns>
        <asp:BoundField DataField="productId" HeaderText="Product ID" />        
        <asp:BoundField DataField="productName" HeaderText="Product Name" />        
        <asp:BoundField DataField="price" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField   HeaderText="Quantity">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" ></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Item Total">            
                <ItemTemplate>
                    <%--<%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>--%>
                </ItemTemplate>        
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Remove Item">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong> 
    </div>
    <asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCheckOut" runat="server" Text="Checkout" />
    <br />
</asp:Content>
