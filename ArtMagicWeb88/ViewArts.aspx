<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1 class="text-center"><strong><em>Gallery</em></strong></h1>
    <br />
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="3" >
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
                        Price: <%# Eval("price") %>
                        <br />
                        Stock Left: <%# Eval("quantity") %>
                        
                        
                    </td>
                      
                </tr>
                
            </table> 
        </ItemTemplate>
    </asp:DataList>
     <br />
    <br />
    <br />

    

</asp:Content>

