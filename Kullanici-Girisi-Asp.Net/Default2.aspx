<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
    
   
   
    
   
    
        .auto-style1 {
            font-family: Calibri;
            font-size: 16px;
            color: #808080;
        }
        .auto-style3 {
            font-size: 22px;
            color: #000000;
            font-weight: bold;
            padding-left: 18px;
            padding-right: 0px;
            padding-top: 14px;
            padding-bottom: 0px;
        }
    
   
   
    
   
    
    </style>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
    <div>
    <div class="ana">
        <div class="auto-style3">
            Giriş</div>
        <hr style="width: 100%; border:1px solid #F0F0F0;" />
        <div style="padding:8px 0px 0px 18px;">
            Ad<br />
        <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" Width="255px"></asp:TextBox>
        <br />
        <br />
        <a class="yazi">S</a>oyad<br />
        <asp:TextBox ID="TextBox2" CssClass="textbox" runat="server" Width="255px"></asp:TextBox>
        <br />
        <br />
        <a class="yazi">Ş</a>ifre<br />
        <asp:TextBox ID="TextBox3" TextMode="Password"  CssClass="textbox" runat="server" Width="255px"></asp:TextBox>
        <br />
        <div style="margin:10px 0px 10px 0px;">
        <asp:CheckBox ID="CheckBox1" CssClass="check" runat="server" Text="Beni Hatırla" />
        </div>
        
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Giriş Yap" OnClick="Button1_Click" />
        </div>
    </div>
    </div>
    </form>
</body>
</html>
