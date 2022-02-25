<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="artist.aspx.cs" Inherits="ArtMagicWeb88.artist" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <link href="../content/artist.css" rel="stylesheet" />

         <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1">
            <ItemTemplate>
                <div class="artContainer">
                    <div class="artImg">
                        <img class="img-thumbnail figure-img" src='<%#"data:image/jpeg;base64," + Convert.ToBase64String((byte[])Eval("artImg"))  %>' alt="Artwork Image" />
                    </div>
                    <div class="artDetails">
                        <table style="width: 100%;">
                            <tr>
                                <td class="col-lg-3">Artwork ID</td>
                                <td class="col-lg-9">: <%# Eval("artID") %></td>
                            </tr>
                            <tr>
                                <td class="col-lg-3">Name</td>
                                <td class="col-lg-9">: <%# Eval("artName") %></td>
                            </tr>
                            <tr>
                                <td class="col-lg-3">Description</td>
                                <td class="col-lg-9">: <%# Eval("artDesc") %></td>
                            </tr>
                            <tr>
                                <td class="col-lg-3">Price</td>
                                <td class="col-lg-9">: <%# Eval("artPrice") %></td>
                            </tr>
                            <tr>
                                <td class="col-lg-3">Available Stock</td>
                                <td class="col-lg-9">: <%# Eval("stock") %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="actionBtn">

                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
</asp:Content>
