<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewArts.aspx.cs" Inherits="ArtMagicWeb88.ViewArts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:DataList ID="ListofArt" runat="server" Width="100%" RepeatDirection="Horizontal" OnItemCommand="ListofArt_OnItemCommand" RepeatColumns="3" ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="ListofArt_SelectedIndexChanged">
            <ItemTemplate>
                <td style='text-align: center; padding: 10px;'>
                    <img class="img-thumbnail" alt="artImg" style="height: 280px; width: 280px" src='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("artImg")) %>' /><br />
                    <asp:LinkButton ID="moreDetials" CommandName="ImageButtonClick" runat="server"><h6 style="color:#675A51; font-weight:bold"><%#Eval ("artName") %></h6>
                    <p style="color:black; font-size: 14px"><%#Eval ("name") %></p>
                    <p style="color:black; font-size: 14px">RM <%#Eval ("artPrice") %></p></asp:LinkButton>
                    <asp:HiddenField ID="HiddenID" runat="server" Value='<%#Eval("artID") %>' />
                </td>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>

        </asp:DataList>



</asp:Content>

