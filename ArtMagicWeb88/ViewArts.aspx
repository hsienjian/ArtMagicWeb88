<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        img{
            height:300px;
            width:300px;
        }
    </style>
    <br />
    <h1 class="text-center"><strong><em>Gallery</em></strong></h1>
    <br />
    <br />
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" GridLines="Both" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="Item_Bound" >
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <ItemStyle BackColor="White" ForeColor="#330099" />
        <ItemTemplate>
            <table>
                <tr>
                    
                    <td class="text-justify">

                        <img src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data")) %>'  />
                        <br />
                        Product Name: <%# Eval("productName") %>
                        <br />
                        Artist Name: <%# Eval("artistName") %>
                        <br />
                        Price:<strong> <%# Eval("price") %></strong>
                        <br />
                        Stock Left: <strong><%# Eval("quantity") %></strong>
                        <br />
                        <br />
                        <asp:Button ID="btnCart" runat="server" Text="Add To Cart" OnClick="btnCart_Click" CommandName="addtocart"/>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnWishList" runat="server" Text="Add To Wish List" OnClick="btnWishList_Click" CommandName="addtowishlist" />
                    </td>
                      
                </tr>
                
            </table> 
        </ItemTemplate>
        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    </asp:DataList>
     <br />
    <br />
    <br />

    

</asp:Content>

