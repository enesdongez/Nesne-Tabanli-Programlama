<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lokasyonekle.aspx.cs" Inherits="ayarlarsayfalari_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <link href="Css/eklesildüzenle.css" rel="stylesheet" />
   
    <div class="menu">
        <div class="menu1">
            <div style="width:400px;  padding:20px 0px 0px 20px; font-size:16px;"> 
   &nbsp;&nbsp;&nbsp; Lokasyon Ekle
            <hr style="width:100%; border:0.5px solid gray; " />
            <table border="0" class="table2">
        <tr>
            <td>
                İsim:
            </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Boş Geçilemez!"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
            </td>
                <td>
                    İl:
            </td>
            <td>
                <asp:DropDownList ID="dpil" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="sehir" DataValueField="id"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Kat:
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Boş Geçilmez!"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
            </td>
             <td>
                İlçe:
            </td>
            <td>
                <asp:DropDownList ID="dpilce" runat="server" DataSourceID="SqlDataSource2" DataTextField="ilce" DataValueField="ilce"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT ilce FROM ilceler WHERE sehir=@a ORDER BY ilce">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dpil" DefaultValue="" Name="a" PropertyName="SelectedValue" />
                </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Daire:
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Boş Geçilmez!"></asp:RequiredFieldValidator>
                <asp:TextBox ID="TextBox3" TextMode="Password" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button ID="Button2" runat="server"  Text="Kaydet" Height="36px" Width="89px" OnClick="Button2_Click" />
      
            </td>
        </tr>
    </table>   
 </div>
    </div>
       <div class="menu2" style="margin-left:20px;">

           <br />
           <asp:GridView ID="GridView1" runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
           </asp:GridView>

       </div> 
</div>  
    </form>
</body>
</html>
