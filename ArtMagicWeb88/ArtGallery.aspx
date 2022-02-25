<%@ Page Title="" Language="C#" MasterPageFile="../Main.Master" AutoEventWireup="true" CodeBehind="ArtGallery.aspx.cs" Inherits="ArtworkWebSite2021.Customer.ArtGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Kanit:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
    <style>
        .welcomeMsg {
            position: relative;
            text-align: center;
            color: white;
            margin-bottom: 80px;
        }

        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 75px;
            font-family: Garamond;
        }

        .auto-style1 {
            float: right;
            width: 425px;
        }
    </style>

    <div style="background-color: #E7E4E2">
        <div class="welcomeMsg">
            <asp:Image ID="HomeImage" runat="server" Width="100%" Height="565px" />
            <div class="centered">
                <asp:Label ID="welcomeMsg" runat="server"></asp:Label>
            </div>
        </div>
        <div style="text-align: center; margin-right: 40px; margin-bottom: 30px; font-size: 15px; font-family: Garamond" class="auto-style1">
            Search Gallery&nbsp;&nbsp;
            <asp:TextBox ID="txtSearch" runat="server" Font-Size="18px" placeholder="Art Name / Artist"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="SearchArt" runat="server" Text="Search" Font-Size="15px" Width="5pc" OnClick="SearchArt_Click" />
        </div>
        <div style="margin-left: 40px; margin-bottom: 20px; font-size: 15px; font-family: Garamond;">
            <asp:DropDownList ID="SearchFeature" runat="server" AutoPostBack="True" Width="20%" OnSelectedIndexChanged="SearchFeature_SelectedIndexChanged">
                <asp:ListItem>Searching Features</asp:ListItem>
                <asp:ListItem>All Arts</asp:ListItem>
                <asp:ListItem>High to Low Price</asp:ListItem>
                <asp:ListItem>Low to High Price</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:DataList ID="ListofArt" runat="server" Width="100%" RepeatDirection="Horizontal" OnItemCommand="ListofArt_OnItemCommand" RepeatColumns="3" ShowFooter="False" ShowHeader="False">
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
    </div>
</asp:Content>
