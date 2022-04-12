<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.Master" CodeBehind="ArtDetail.aspx.cs" Inherits="ArtMagicWeb88.ArtDetail" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="../css/ArtDetail.css" />

    <div class="container-fuild px-sm-1 py-5 mx-auto" style="background-color: #D4D8DD">
        <div class="row justify-content-center">
            <div class="d-flex">
                <div class="card card-1" style="margin-top: 10%; background-color: rgba(255,255,255,0.6);">
                    <asp:FormView ID="FormView" runat="server" Width="100%" OnItemCommand="itemCommandClick">
                        <ItemTemplate>
                            <div class="product-pic" style="text-align: center; margin-bottom: 18px">
                                <img class="img-thumbnail" alt="artImg" style="height: 280px; width: 280px;" src="<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("data")) %>" />
                            </div>
                            &nbsp;
                            <h4 class="product-name">
                                <asp:Label ID="ArtName" runat="server" Text='<%#Eval ("productName") %>'></asp:Label>
                            </h4>
                            <div class="prdDetail" style="margin-bottom: 20px; font-size: 15px">
                                <h6><b>Description : </b>
                                    <asp:Label ID="ArtDesc" runat="server" Text='<%#Eval ("description") %>'></asp:Label></h6>
                                <br />
                                <br />
                                <h6><b>Price : </b>RM
                                    <asp:Label ID="ArtPrice" runat="server" Text='<%#Eval ("price") %>'></asp:Label></h6>
                                <br />
                                <br />
                                <h6><b>Stock Available : </b>
                                    <asp:Label ID="ArtStock" runat="server" Text='<%#Eval ("quantity") %>'></asp:Label></h6>
                                <br />
                                <br />
                                <h6><b>Quantity : </b>
                                    <asp:TextBox runat="server" ID="tbQuantity" Width="100px"></asp:TextBox></h6>
                                <br />
                                <asp:RangeValidator
                                    ID="RangeValidator" runat="server"
                                    ControlToValidate="tbQuantity"
                                    Display="Dynamic"
                                    ErrorMessage="Can't Order More Than Quantity."
                                    ForeColor="Red"
                                    MaximumValue='<%#Eval ("quantity") %>'
                                    MinimumValue="0"
                                    Type="Integer" />
                                <div class="row text-center" style="margin-top: 10px">
                                    <div class="col-12">
                                        <asp:LinkButton ID="lbAddWishlist"  CssClass="btn btn-secondary" runat="server" CommandName="addToWishList">
                                        <p class="mb-0">Add to WishList</p>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbAddToCart" CssClass="btn btn-info" runat="server" CommandName="addToCart">
                                            <p class="mb-0">Add to cart</p>
                                        </asp:LinkButton>
                                        <asp:HiddenField ID="hiddenID" runat="server" Value='<%#Eval ("productId") %>'></asp:HiddenField>
                                    </div>
                                </div>
                                <div style="text-align: center; margin-top: 15px;">
                                    <asp:HyperLink ID="ArtGallery" runat="server" NavigateUrl="~/ViewArts.aspx">Back to Art Gallery</asp:HyperLink>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>