<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personelekle.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/ayarlar.css" rel="stylesheet" />
  
    <style type="text/css">
        .table2
        {
            width: 782px;
        }
        .auto-style3
        {
            width: 100%;
            margin-bottom: 0px;
        }
        .auto-style6
        {
            width: 185px;
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
 
      
    <div class="menu">
    <div class="menu1">
            <div style="width:778px;  padding:20px 0px 0px 20px; font-size:16px;"> 
                &nbsp;Personel Ekle
            <hr style="width:100%; border:0.5px solid gray; " />
                <table class="auto-style3">
                    <tr>
                        <td>Ad:
            </td>
                        <td>
                            <br />
                <asp:TextBox ID="txtad" runat="server" Width="120px"></asp:TextBox>
                            <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtad" ErrorMessage="Boş Geçilmez!" Font-Size="10px"></asp:RequiredFieldValidator>
                        </td>
                        <td>E-mail</td>
                        <td>
                            <br />
                <asp:TextBox ID="txtemail" runat="server" Width="120px"></asp:TextBox>
                            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtemail" ErrorMessage="Boş Geçilmez!" Font-Size="10px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="E-mail Giriniz!" Font-Size="10px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td>Mevki</td>
                        <td>
                <asp:DropDownList ID="dp" runat="server" Width="120px">
                    <asp:ListItem>Müdür</asp:ListItem>
                    <asp:ListItem>Yazılım Uzmanı</asp:ListItem>
                    <asp:ListItem>Stajer</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td>İdare:</td>
                        <td class="auto-style6">
                 <asp:DropDownList ID="DropDownList6" runat="server" Width="120px">
                 </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Soyad:</td>
                        <td>
                            <br />
                <asp:TextBox ID="txtsoyad" runat="server" Width="120px"></asp:TextBox>
                            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtsoyad" ErrorMessage="Boş Geçilmez!" Font-Size="10px"></asp:RequiredFieldValidator>
                        </td>
                        <td>Şifre</td>
                        <td>
                            <br />
                <asp:TextBox ID="txtsifre" TextMode="Password" runat="server" Width="120px"></asp:TextBox>
                            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtsifre" ErrorMessage="Boş Geçilmez!" Font-Size="10px"></asp:RequiredFieldValidator>
                        </td>
                        <td>Birim:</td>
                        <td>
                <asp:DropDownList ID="DropDownList4" runat="server" Width="120px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Ad" DataValueField="B_ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT [B_ID], [Ad] FROM [Birim]"></asp:SqlDataSource>
                        </td>
                        <td>İl:</td>
                        <td class="auto-style6">
                               <asp:DropDownList ID="dpil" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="sehir" DataValueField="id" Width="120px"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <br />
                            Yetki:</td>
                        <td>
                            <br />
                <asp:DropDownList ID="DropDownList5" runat="server" Width="120px"></asp:DropDownList>
                        </td>
                        <td>
                            <br />
                            İlçe:</td>
                        <td class="auto-style6">
                            <br />
                 <asp:DropDownList ID="dpilce" runat="server" DataSourceID="SqlDataSource4" DataTextField="ilce" DataValueField="ilce" Width="120px"></asp:DropDownList><asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT ilce FROM ilceler WHERE sehir=@a ORDER BY ilce">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dpil" DefaultValue="" Name="a" PropertyName="SelectedValue" />
                </SelectParameters>
                </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <asp:Button ID="Button1" runat="server" Text="Kaydet" />
                        </td>
                    </tr>
                </table>
                <br />
 </div>
    </div>
       <div class="menu2">

           <br />
           <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto">
               <asp:GridView ID="grid"  runat="server" AutoGenerateColumns="False" DataSourceID="datasource" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="610px" AllowPaging="True">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <Columns>
                       <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                       <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                       <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                       <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                       <asp:BoundField DataField="Pozisyon" HeaderText="Pozisyon" SortExpression="Pozisyon" />
                   </Columns>
                   <EditRowStyle BackColor="#999999" />
                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               </asp:GridView>
               <asp:SqlDataSource ID="datasource" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Personel] WHERE [PID] = @PID" InsertCommand="INSERT INTO [Personel] ([Ad], [Soyad], [BirimID], [Pozisyon], [Sifre]) VALUES (@Ad, @Soyad, @BirimID, @Pozisyon, @Sifre)" SelectCommand="SELECT PID, Ad, Soyad, BirimID, Pozisyon, Sifre, Email FROM Personel" UpdateCommand="UPDATE [Personel] SET [Ad] = @Ad, [Soyad] = @Soyad, [BirimID] = @BirimID, [Pozisyon] = @Pozisyon, [Sifre] = @Sifre WHERE [PID] = @PID">
                   <DeleteParameters>
                       <asp:Parameter Name="PID" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="Ad" Type="String" />
                       <asp:Parameter Name="Soyad" Type="String" />
                       <asp:Parameter Name="BirimID" Type="String" />
                       <asp:Parameter Name="Pozisyon" Type="String" />
                       <asp:Parameter Name="Sifre" Type="String" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="Ad" Type="String" />
                       <asp:Parameter Name="Soyad" Type="String" />
                       <asp:Parameter Name="BirimID" Type="String" />
                       <asp:Parameter Name="Pozisyon" Type="String" />
                       <asp:Parameter Name="Sifre" Type="String" />
                       <asp:Parameter Name="PID" Type="Int32" />
                   </UpdateParameters>
               </asp:SqlDataSource>
           </asp:Panel>

       </div> 

    

</div>  
    </form>
</body>
</html>
