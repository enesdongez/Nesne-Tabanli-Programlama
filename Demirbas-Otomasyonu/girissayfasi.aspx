<%@ Page Language="C#" AutoEventWireup="true" CodeFile="girissayfasi.aspx.cs" Inherits="acilis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    
   
   
    
   
    
        .auto-style4 {
            width: 344px;
            height: 445px;
            background-color: white;
            border-radius: 3px;
            margin: 80px auto;
        }
    
   
   
    
   
    
    </style>
    <link href="Css/girissayfasi.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
    <div>
    <div class="auto-style4">
        <div class="auto-style3">
            Giriş</div>
        <hr style="width: 100%; border:1px solid #F0F0F0;" />
        <div style="padding:8px 0px 0px 18px;">
            E Posta&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Uygun fomata giriniz!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
        <asp:TextBox ID="TextBox1" CssClass="textbox" runat="server" Width="255px"></asp:TextBox>
        <br />
        <br />
        <a class="yazi">Ş</a>ifre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="Boş geçilmez!"></asp:RequiredFieldValidator>
            <br />
        <asp:TextBox ID="TextBox3" TextMode="Password"  CssClass="textbox" runat="server" Width="255px"></asp:TextBox>
        <br />
        <div style="margin:10px 0px 10px 0px;">
        <asp:CheckBox ID="CheckBox1" CssClass="check" runat="server" Text="Beni Hatırla" />
        </div>
        
            Güvenlik Kodu:
            <asp:Image ID="imgKod" runat="server" />
&nbsp;<br />
            <asp:Label ID="lblMesaj" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="txtKontrolKodu" runat="server" Height="30px" Width="255px"></asp:TextBox>
            <br />
            <br />
        
        <asp:Button ID="Button1" runat="server" Text="Giriş Yap" OnClick="Button1_Click" ForeColor="White" style="color:white; background-color:#5D7B9D;" />
            <br />
        </div>
    </div>
   <div>

   </div>
        
         </div>
    </form>
</body>
</html>
