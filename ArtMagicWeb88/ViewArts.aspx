<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1 class="text-center"><strong><em>Gallery</em></strong></h1>
    <br />
    <br />
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" GridLines="Both" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnRowDataBound="OnRowDataBound">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <ItemTemplate>
            <table>
                <tr>
                    
                    <td class="text-justify">
                        <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" ImageUrl='<%# Eval("imgPath") %>' ></asp:Image>
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
                        <asp:Button ID="btnCart" runat="server" Text="Add To Cart" OnClick="btnCart_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnWishList" runat="server" Text="Add To Wish List" OnClick="btnWishList_Click" />
                    </td>
                      
                </tr>
                
            </table> 
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
     <br />
    <br />
    <br />

    

</asp:Content>

