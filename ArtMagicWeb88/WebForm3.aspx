<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ArtMagicWeb88.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        img{
            height:75px;
            width:75px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">  
    <div>      
<asp:DataList ID="dlCustomers" runat="server" RepeatColumns="6" CellSpacing="0" RepeatLayout="Table">
    <ItemTemplate>
        <table class="table">
            <tr>
                <th colspan="2">
                    <b>
                        <%# Eval("Name") %></b>
                </th>
            </tr>
            <tr>
                <td colspan="2">
                    <%# Eval("Id") %>,
                    <%# Eval("ContentType") %>
                </td>
            </tr>
            <tr>
                <td>
                    Image:
                </td>
                <td>
                    <img src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Data")) %>' />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Name:
                    <%# Eval("Name")%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    ContentType:
                    <%# Eval("ContentType")%>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
      
    </div>  
</form> 
</body>
</html>
