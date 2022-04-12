<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="cart.aspx.cs" Inherits="ArtMagicWeb88.cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p class="text-center">
        <br />
        <span style="font-size: xx-large"><strong>Your Cart</strong></span></p>
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-12 col-md-12">
                <asp:Label ID="lblNumOfCart" CssClass="font-style-1 text-black-50 pl-1 font-size-2" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div class="container-fluid mt-4 mb-5">
        <div class="container">
            <div class="row">
                <asp:ListView ID="lvCart" runat="server"  ItemPlaceholderID="itemPlaceHolder1" GroupPlaceholderID="groupPlaceHolder1">
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
                                            <h5>Product ID:<%# Eval("productId") %></h5>
                                        </div>
                                        <div class="col-2">
                                            <asp:LinkButton ID="lbDeleteWishListItem" CommandName="cmdDelete" CommandArgument='<%#Eval("productId")%>' OnCommand="lbDelete_Command" runat="server">
                                                <svg t="1628105900669" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="12307" width="23" height="23"><path d="M761.1 782.4c-6.4 0-12.8-2.4-17.7-7.3L253.2 284.8c-9.8-9.8-9.8-25.6 0-35.4 9.8-9.8 25.6-9.8 35.4 0l490.2 490.2c9.8 9.8 9.8 25.6 0 35.4-4.9 4.9-11.3 7.4-17.7 7.4z" p-id="12308"></path><path d="M270.9 782.4c-6.4 0-12.8-2.4-17.7-7.3-9.8-9.8-9.8-25.6 0-35.4l490.2-490.2c9.8-9.8 25.6-9.8 35.4 0 9.8 9.8 9.8 25.6 0 35.4L288.6 775c-4.9 4.9-11.3 7.4-17.7 7.4z" p-id="12309"></path></svg>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted">Product Name:<%# (Eval("productName"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted">Description: <%# (Eval("description"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 font-style-2">
                                            <p class="text-muted">Price: <%# (Eval("price"))%></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3 col-md-2 mr-2 font-style-2">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-secondary" runat="server">
                                                <svg t="1628105431911" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8465" width="19" height="19">
                                                    <path d="M875.136 327.936h-124.928c4.608-27.776 0-55.552-9.216-87.936C703.872 110.336 569.6 36.352 439.936 68.736c-60.16 23.168-111.104 64.768-143.488 120.32-23.168 41.728-32.384 92.544-32.384 138.88h-120.32C125.184 327.936 111.36 341.76 111.36 364.928v365.696c0 124.928 101.888 231.424 231.424 231.424h217.6c18.56 0 36.992-13.824 36.992-36.992 0-23.168-13.824-36.992-36.992-36.992H338.176c-87.936 0-162.048-74.112-162.048-162.048V397.44h657.28v189.824c0 18.56 13.824 36.992 36.992 36.992 23.168 0 36.992-13.952 36.992-36.992V364.928c0.128-23.04-13.696-36.992-32.256-36.992z m-194.432 0H338.176c-4.608-36.992 0-74.112 18.56-106.496 23.168-41.6 60.16-69.376 106.496-83.328 92.544-27.776 189.824 27.776 212.992 120.32 4.48 23.168 9.088 46.336 4.48 69.504z m0 0" p-id="8466" fill="#ffffff"></path><path d="M875.136 712.192H731.648V568.704c0-18.56-13.824-32.384-36.992-32.384-18.56 0-32.384 13.952-32.384 36.992V716.8H518.656c-18.56 0-32.384 13.824-32.384 36.992 0 18.56 13.824 32.384 36.992 32.384H666.88v143.488c0 18.56 13.824 32.384 36.992 32.384 18.56 0 32.384-13.824 32.384-36.992V781.568h143.488c18.56 0 32.384-13.824 32.384-36.992-4.608-18.56-18.432-32.384-36.992-32.384z m0 0" p-id="8467" fill="#ffffff"></path></svg>
                                            </asp:LinkButton>
                                        </div>
                                        <div class="col-2 col-md-2 font-style-2">

                                            <asp:LinkButton ID="LinkButton2" CssClass="btn btn-primary" runat="server">
                                                Check Out
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <%-- End Call all the Items --%>

                    <%-- Start group called items --%>
                   <%-- <GroupTemplate>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </GroupTemplate>--%>
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
                                <p style="color: #cdcdcd;">Your Cart is empty, back to gallery add item to cart.</p>
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
