<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMagicWeb88._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-fluid" style="padding-top:35px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/homepage_banner.png"  />
    </div>

    

    


    <br />
       <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    Artist
    <br />
    <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatDirection="Horizontal"  RepeatColumns="3" ShowFooter="False" ShowHeader="False">
            <ItemTemplate>
                <td style='text-align: center; padding: 10px;'>
                    <img class="img-thumbnail" alt="artImg" style="height: 280px; width: 280px" src='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("artImg")) %>' /><br />
                    <asp:LinkButton ID="moreDetials" CommandName="ImageButtonClick" runat="server"><h6 style="color:#675A51; font-weight:bold"><%#Eval ("artName") %></h6>
                    <p style="color:black; font-size: 14px">introduction</p>
                    <p style="color:black; font-size: 14px">introduction</p>
                        <br />
                    </asp:LinkButton>
                
                </td>
            </ItemTemplate>

        </asp:DataList>
    

    
    
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FROM"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        

    


</asp:Content>
