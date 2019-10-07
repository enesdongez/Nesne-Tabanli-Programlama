<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="demirbasduzenle.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">



    <style type="text/css">
        .butonkayit
        {
            text-align: right;
            font-size: 14px;
            background-color: white;
            background-image: url('Scripts/resim/iconlar/demirbaskayıtbuttonn.png');
            background-repeat: no-repeat;
            background-position-y: center;
            box-shadow:2px 2px 2px #5D7B9D;
            border-radius:10px;
            
          
        }
            .butonkayit:hover
            {
                 background-color:ButtonHighlight;
                
            }
    </style>



</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <link href="Css/eklesildüzenle.css" rel="stylesheet" />
    <link href="Css/StyleSheet.css" rel="stylesheet" />
    <div class="menu">
        <div class="menu1">
           
            <div style="font-family:Calibri; width: 800px; margin: auto; padding: 5px 0px 5px 5px; font-size: 16px;">
              &nbsp;&nbsp;&nbsp;<a style=""> Demirbaş Ekle</a>
            <hr style="width:100%; border:0.5px solid gray; " />
                <table border="0" class="table1">
                    <tr>
                        <td>İsim:
                        </td>
                        <td>
                            <asp:TextBox ID="txtisim" runat="server" Width="120px">tahta masa</asp:TextBox>
                        </td>
                        <td>Stok Durumu:
                        </td>
                        <td>
                            <asp:DropDownList ID="dpstokdurum" runat="server" Width="120px"></asp:DropDownList>
                        </td>
                        <td>Renk:
                        </td>
                        <td>
                            <asp:DropDownList ID="dprenk" runat="server" Width="120px"></asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>Seri No:
                        </td>

                        <td>
                            <asp:TextBox ID="txtserino" runat="server" Width="120px">654654321</asp:TextBox>
                        </td>
                        <td>Sorumlu Kişi:
                        </td>
                        <td>
                            <asp:DropDownList ID="dpsorumlukisi" runat="server" Width="120px" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="PID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="select PID,ad+' '+soyad  from personel"></asp:SqlDataSource>
                        </td>
                        <td>Lokasyon:
                        </td>
                        <td>
                            <asp:DropDownList ID="dplok" runat="server" Width="120px"></asp:DropDownList>
                        </td>



                    </tr>
                    <tr>
                        <td>Bölüm:
                        </td>
                        <td>
                            <asp:DropDownList ID="dpbölüm" runat="server" Width="120px"></asp:DropDownList>
                        </td>
                        <td>Marka:
                        </td>
                        <td>
                            <asp:TextBox ID="txtmarka" runat="server" Width="120px">meşe</asp:TextBox>
                        </td>
                        <td>Durum:
                        </td>
                        <td>
                            <asp:DropDownList ID="dpdurum" runat="server" Width="120px"></asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <td>Adet:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" Width="120px"></asp:TextBox>
                        </td>
                        <td>Model:
                        </td>
                        <td>
                            <asp:TextBox ID="txtmodel" runat="server" Width="120px"></asp:TextBox>
                        </td>
                        <td>Kategori:
                        </td>
                        <td>
                            <asp:DropDownList ID="dpkategori" runat="server" Width="120px" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="C_Name" DataValueField="K_ID">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT [C_Name], [K_ID] FROM [Kategoridemirbas]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:Button CssClass="butonkayit" ID="Button1"  runat="server" Text="Kaydet" Height="36px" Width="89px" OnClick="Button1_Click1" />
                          
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Scripts/resim/simge.png" />
                        </td>
                    </tr>

                </table>

            </div>
        </div>
        <div class="menu2">
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
            <br />

            <asp:GridView ID="GridView1" CssClass="grid" runat="server" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="UrunID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." EnableModelValidation="True" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="800px">
                <AlternatingRowStyle ForeColor="#284775" />
                <Columns>
                    <asp:CommandField CancelText="İptal" DeleteText="Sil" EditText="Düzenle" SelectText="Seç" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Güncelle">
                    <ControlStyle Width="60px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="UrunID" HeaderText="Sıra No" InsertVisible="False" ReadOnly="True" SortExpression="UrunID" >
                    <ControlStyle Width="40px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="kategoriismi" HeaderText="Kategorisi" SortExpression="kategoriismi" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Isim" HeaderText="Isim" SortExpression="Isim" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Seri_No" HeaderText="Seri_No" SortExpression="Seri_No" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Renk" HeaderText="Renk" SortExpression="Renk" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Stok_Durumu" HeaderText="Stok_Durumu" SortExpression="Stok_Durumu" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Lokasyon" HeaderText="Lokasyon" SortExpression="Lokasyon" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Durumu" HeaderText="Durumu" SortExpression="Durumu" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Expr1" HeaderText="Sorumlu Personel" SortExpression="Expr1" >
                    <ControlStyle Width="60px" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Malzeme] WHERE [UrunID] = @UrunID" InsertCommand="INSERT INTO [Malzeme] ([KategoriID], [Isim], [PersonelID], [Marka], [Model], [Seri No], [Renk], [Stok Durumu], [Lokasyon], [Durumu]) VALUES (@KategoriID, @Isim, @PersonelID, @Marka, @Model, @Seri_No, @Renk, @Stok_Durumu, @Lokasyon, @Durumu)" SelectCommand="SELECT Malzeme.UrunID, Kategoridemirbas.C_Name AS kategoriismi, Malzeme.Isim, Personel.Ad + ' ' + Personel.Soyad AS Expr1, Malzeme.Marka, Malzeme.Model, Malzeme.[Seri No] AS Seri_No, Malzeme.Renk, Malzeme.[Stok Durumu] AS Stok_Durumu, Malzeme.Lokasyon, Malzeme.Durumu FROM Malzeme INNER JOIN Kategoridemirbas ON Malzeme.KategoriID = Kategoridemirbas.K_ID INNER JOIN Personel ON Malzeme.PersonelID = Personel.PID" UpdateCommand="UPDATE [Malzeme] SET [KategoriID] = @KategoriID, [Isim] = @Isim, [PersonelID] = @PersonelID, [Marka] = @Marka, [Model] = @Model, [Seri No] = @Seri_No, [Renk] = @Renk, [Stok Durumu] = @Stok_Durumu, [Lokasyon] = @Lokasyon, [Durumu] = @Durumu WHERE [UrunID] = @UrunID">
                <DeleteParameters>
                    <asp:Parameter Name="UrunID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="dpkategori" Name="KategoriID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="txtisim" Name="Isim" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="PersonelID" Type="Int32" />
                    <asp:Parameter Name="Marka" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="Seri_No" Type="String" />
                    <asp:Parameter Name="Renk" Type="String" />
                    <asp:Parameter Name="Stok_Durumu" Type="String" />
                    <asp:Parameter Name="Lokasyon" Type="String" />
                    <asp:Parameter Name="Durumu" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="KategoriID" Type="String" />
                    <asp:Parameter Name="Isim" Type="String" />
                    <asp:Parameter Name="PersonelID" Type="Int32" />
                    <asp:Parameter Name="Marka" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="Seri_No" Type="String" />
                    <asp:Parameter Name="Renk" Type="String" />
                    <asp:Parameter Name="Stok_Durumu" Type="String" />
                    <asp:Parameter Name="Lokasyon" Type="String" />
                    <asp:Parameter Name="Durumu" Type="String" />
                    <asp:Parameter Name="UrunID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </div>

</asp:Content>


