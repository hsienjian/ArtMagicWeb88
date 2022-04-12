<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="css/viewArtPage.css" rel="stylesheet" />
    <br />
    <h1 class="text-center"><strong><em>Gallery</em></strong></h1>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:DataList ID="ListofArt" runat="server" Width="100%" RepeatDirection="Horizontal" OnItemCommand="ListofArt_OnItemCommand" RepeatColumns="3" ShowFooter="False" ShowHeader="False">
            <ItemTemplate>
                <td style='text-align: center; padding: 10px;'>
                    <img class="img-thumbnail" alt="artImg" style="height: 280px; width: 280px" src='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("data")) %>' /><br />
                    <asp:LinkButton ID="moreDetials" CommandName="ImageButtonClick" runat="server">
                        <h6 style="color:#FFFFFF; font-weight:bold">Product Name: <%#Eval ("productName") %></h6>
                        <p style="color:#FFFFFF; font-size: 14px">Price: RM<%#Eval ("price") %></p>
                        <p style="color:#FFFFFF; font-size: 14px">Quantity :<%#Eval ("quantity") %></p>
                        <p style="color:#FFFFFF; font-size: 14px">Description: <%#Eval ("description") %></p>

                    </asp:LinkButton>
                    <asp:HiddenField ID="HiddenID" runat="server" Value='<%#Eval("productId") %>' />
                </td>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>

        </asp:DataList>
     <br />
    <br />
    <br />

    

</asp:Content>

