<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personelduzenle.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   
    
    <style type="text/css">
    .auto-style3 {
        margin: 0px auto auto auto;
    }
</style>
    
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server"  >
    
    <link href="Css/eklesildüzenle.css" rel="stylesheet" />
   
    <div class="menu">
    <div class="menu1">
            <div style="width:400px; margin:auto; padding:20px 0px 0px 0px; font-size:16px;"> 
       &nbsp;&nbsp;&nbsp; Personel Ekle
            <hr style="width:100%; border:0.5px solid gray; " />
            <table border="0" class="table2">
        <tr>
            <td>
                Ad:
            </td>
             <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
            </td>
                <td>
                Bölüm:
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="120px">
                    <asp:ListItem>Müdür</asp:ListItem>
                    <asp:ListItem>Yazılım Uzmanı</asp:ListItem>
                    <asp:ListItem>Stajer</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Soyad:
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Şifre:
            </td>
            <td>
                <asp:TextBox ID="TextBox3" TextMode="Password" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button CssClass="perbutton" ID="Button1" runat="server" Text="Kaydet" Height="36px" Width="89px" OnClick="Button1_Click1" />
            </td>
        </tr>
    </table>   
 </div>
    </div>
       <div class="menu2">

           <br />
           <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto">
               <asp:GridView ID="GridView1" CssClass="auto-style3" runat="server" AutoGenerateColumns="False" DataKeyNames="PID" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="610px">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <Columns>
                       <asp:CommandField CancelText="İptal" DeleteText="Sil" EditText="Düzenle" SelectText="Seç" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Güncelle" />
                       <asp:BoundField DataField="PID" HeaderText="P. ID" InsertVisible="False" ReadOnly="True" SortExpression="PID" />
                       <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                       <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                       <asp:BoundField DataField="Pozisyon" HeaderText="Pozisyon" SortExpression="Pozisyon" />
                       <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                       <asp:BoundField DataField="Sifre" HeaderText="Sifre" SortExpression="Sifre" />
                   </Columns>
                   <EditRowStyle BackColor="#999999" />
                   <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Personel] WHERE [PID] = @PID" InsertCommand="INSERT INTO [Personel] ([Ad], [Soyad], [BirimID], [Pozisyon], [Sifre]) VALUES (@Ad, @Soyad, @BirimID, @Pozisyon, @Sifre)" SelectCommand="SELECT PID, Ad, Soyad, BirimID, Pozisyon, Sifre, Email FROM Personel" UpdateCommand="UPDATE [Personel] SET [Ad] = @Ad, [Soyad] = @Soyad, [BirimID] = @BirimID, [Pozisyon] = @Pozisyon, [Sifre] = @Sifre WHERE [PID] = @PID">
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
</asp:Content>

