<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="WishList.aspx.cs" Inherits="ArtMagicWeb88.WishList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href ="css/background.css" rel="stylesheet" />



    <p class="text-center">
        <br />
        <span style="font-size: xx-large"><strong>Your WishList</strong></span></p>
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12">
                <asp:Label ID="lblNumOfArtwork" CssClass="font-style-1 text-black-50 pl-1 font-size-2" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div class="container-fluid mt-4 mb-5">
        <div class="container">
            <div class="row">
                <asp:ListView ID="lvWishList" runat="server" OnPagePropertiesChanging="lvWishList_PagePropertiesChanging" ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1">
                    <%-- Start Call all the Items --%>
                    <ItemTemplate>
                        <div class="col-12 col-md-6 mb-2">
                            <div class="row mb-3">
                                <div class="col-4 col-md-4">
                                    <img class="img-thumbnail" alt="artImg" src="<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data"))%>" />
                                </div>
                                <div class="col-8 col-md-7">
                                    <div class="row">
                                        <div class="col-10 font-style-1">
                                            <h5>Product Name: <%# Eval("productName") %></h5>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted;color">Description: <%# (Eval("description"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted;color">Price: <%# (Eval("price"))%></p>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                            <asp:LinkButton ID="lbDeleteWishListItem" CommandName="cmdDelete" CommandArgument='<%#Eval("productId")%>' OnCommand="lbDelete_Command" runat="server">
                                                <svg t="1628105900669" class="icon;color" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="12307" width="23" height="23"><path d="M761.1 782.4c-6.4 0-12.8-2.4-17.7-7.3L253.2 284.8c-9.8-9.8-9.8-25.6 0-35.4 9.8-9.8 25.6-9.8 35.4 0l490.2 490.2c9.8 9.8 9.8 25.6 0 35.4-4.9 4.9-11.3 7.4-17.7 7.4z" p-id="12308"></path><path d="M270.9 782.4c-6.4 0-12.8-2.4-17.7-7.3-9.8-9.8-9.8-25.6 0-35.4l490.2-490.2c9.8-9.8 25.6-9.8 35.4 0 9.8 9.8 9.8 25.6 0 35.4L288.6 775c-4.9 4.9-11.3 7.4-17.7 7.4z" p-id="12309"></path></svg>
                                            </asp:LinkButton>
                                        </div>
                                    
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <%-- End Call all the Items --%>

                    <%-- Start group called items --%>
                    <GroupTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </GroupTemplate>
                    <%-- End group called items --%>

                    <%-- Start Display grouped items and panging --%>
                    <%--<LayoutTemplate>
                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                        <div class="container">
                            <hr />
                            <div class="row">
                                <div class="col-12">
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvWishList" PageSize="4" class="btn-group pager-buttons font-style-1">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="button" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                ShowNextPageButton="false" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                            <asp:NumericPagerField ButtonType="Link" RenderNonBreakingSpacesBetweenControls="false" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" />
                                            <asp:NextPreviousPagerField ButtonType="button" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn" RenderNonBreakingSpacesBetweenControls="false" />
                                        </Fields>
                                    </asp:DataPager>
                                </div>
                            </div>
                        </div>
                    </LayoutTemplate>--%>
                    <%-- End Display grouped items and panging --%>

                    <%-- Start show empty msg --%>
                    <EmptyDataTemplate>
                        <div class="container">
                            <div class="text-center">
                                <svg t="1627927896276" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8928" width="200" height="200">
                                    <path d="M831.7 369.4H193.6L64 602v290.3h897.2V602L831.7 369.4zM626.6 604.6c0 62.9-51 113.9-114 113.9s-114-51-114-113.9H117.5l103.8-198h582.5l103.8 198h-281zM502.2 131h39.1v140.6h-39.1zM236.855 200.802l27.647-27.647 99.419 99.418-27.648 27.648zM667.547 272.637l99.418-99.419 27.648 27.648-99.418 99.418z" p-id="8929" fill="#cdcdcd"></path></svg>
                                <p style="color: #cdcdcd;">Your wishlist is empty, back to gallery add your favourite art.</p>
                                <asp:Button ID="btnContinue" CssClass="btn btn-dark mt-2" runat="server" Text="Back to Gallery" PostBackUrl="~/ViewArts.aspx" />
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <%-- End show empty msg --%>
                </asp:ListView>
            </div>
        </div>
    </div>

    <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    <br />




</asp:Content>