<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="css/viewArtPage.css" rel="stylesheet" />
    <br />
    <h1 class="text-center"><strong><em>Gallery</em></strong></h1>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="3" BackColor="White" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="Item_Bound" >
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <ItemStyle  ForeColor="white" />
        <ItemTemplate>
            <table>
                <tr>
                    
                    <td class="text-justify">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("productId") %>' Visible="False"></asp:Label>
                        <img src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data")) %>'  />
                        <br />
                        Product Name: <asp:Label ID="Label3" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                        <br />
                        Artist Name: <asp:Label ID="Label4" runat="server" Text='<%# Eval("artistName") %>'></asp:Label>
                        <br />
                        Price:<strong> <asp:Label ID="Label5" runat="server" Text='<%# Eval("price") %>'></asp:Label></strong>
                        <br />
                        Stock Left: <strong><asp:Label ID="Label6" runat="server" Text='<%# Eval("quantity") %>'></asp:Label></strong>
                        <br />
                        <br />
                        <asp:Button ID="btnCart" runat="server" Text="Add To Cart" CommandName="addtocart"  />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnWishList" runat="server" Text="Add To Wish List" CommandName="addtowishlist" />
                        <asp:HiddenField ID="hiddenID" runat="server" Value='<%#Eval ("productId") %>'></asp:HiddenField>
                    </td>
                      
                </tr>
                
            </table> 
        </ItemTemplate>
        <SelectedItemStyle  Font-Bold="True" ForeColor="#663399" />
    
    </asp:DataList>
     <br />
    <br />
    <br />

    

</asp:Content>

