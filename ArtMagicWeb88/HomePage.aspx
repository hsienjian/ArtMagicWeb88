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
    <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatDirection="Horizontal"  RepeatColumns="3" ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">

        </asp:DataList>
    

    
    
    <br />
    

    
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        

    


</asp:Content>
