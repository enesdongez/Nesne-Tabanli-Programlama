<%@ Page Language="C#" AutoEventWireup="true" CodeFile="guncelle.aspx.cs" Inherits="ayarlarsayfalari_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .tablo
        {
            width: 340px;
            
        }
        fieldset
        {
           
            float:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <fieldset style="margin:0px 10px 10px 10px;">
        <legend>Firma İsim Güncelle</legend>
        <table class="tablo">
            <tr>
                <td>Seç:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100px" DataSourceID="SqlDataSource1" DataTextField="AD" DataValueField="ID">
                    </asp:DropDownList>
                </td>
                <td>Yeni İsim:</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Boş geçilemez!"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Kaydet" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </fieldset>&nbsp;<br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <fieldset style="margin:0px 0px 10px 0px;" >
        <legend>Şube İsim Güncelle</legend>
        <table class="tablo">
            <tr>
                <td>Seç:</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="100px">
                    </asp:DropDownList>
                </td>
                <td>Yeni İsim:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Kaydet" />
                </td>
            </tr>
        </table>
    </fieldset><br />
        <br />
&nbsp;<br />
        <fieldset style="margin:0px 10px 10px 10px;" >
        <legend>Birim İsim Güncelle</legend>
        <table class="tablo">
            <tr>
                <td>Seç:</td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="100px">
                    </asp:DropDownList>
                </td>
                <td>Yeni İsim:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Kaydet" />
                </td>
            </tr>
        </table>
    </fieldset>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <fieldset style="margin:0px 0px 10px 0px;" >
        <legend>Bölüm İsim Güncelle</legend>
        <table class="tablo">
            <tr>
                <td>Seç:</td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" Width="100px">
                    </asp:DropDownList>
                </td>
                <td>Yeni İsim:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" Text="Kaydet" />
                </td>
            </tr>
        </table>
    </fieldset>
    
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [Firma]"></asp:SqlDataSource>
    </form>
</body>
</html>
