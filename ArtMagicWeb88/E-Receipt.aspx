<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/e-receipt.css" rel="stylesheet" />
</head>
<body>
    <table class="body-wrap">
        <tbody>
            <tr>
                <td></td>
                <td class="container" width="600">
                    <div class="content">
                        <table class="main" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td class="content-wrap aligncenter">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <td class="content-block">
                                                        <h2>Thanks for Purchasing</h2>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="content-block">
                                                        <table class="invoice">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <h3>invoice<br>
                                                                            <span class="small">order #1082</span></h3>
                                                                        <hr>Shipping To: <br>
                                                                        {Address}<br>
                                                                        {Email}<br>
                                                                        {Date}<br><br>
                                                                        Dear {Name}, <br>
                                                                        This are the payment receipt for your order.
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table class="invoice-items" cellpadding="0" cellspacing="0">
                                                                            <tbody>
                                                                                <tr class="total">
                                                                                    <td class="alignright" width="80%">Total</td>
                                                                                    <td class="alignright">{total}</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="content-block">Copyright © 2022. ArtMagicWeb Gallery
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="footer">
                            <table width="100%">
                                <tbody>
                                    <tr>
                                        <td class="aligncenter content-block">Questions? Email <a href="mailto:">artmagicweb2022@gmail.com</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
