<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="demirbasislemleri.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <link href="Css/eklesildüzenle.css" rel="stylesheet" />
<div class="boyutt"> 
      <div style="width:700px; margin:0px 0px 0px 0px; padding:5px 0px 5px 5px; font-size:;"> 
          &nbsp;&nbsp;&nbsp; Demirbaş Listeleme
            <hr style="width:100%; border:0.5px solid gray; " />
      Arama Kriteri:&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp; Ara:&nbsp;
    <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged1" Width="369px"></asp:TextBox>
           <br />
           </div>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UrunID" DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UrunID" HeaderText="UrunID" InsertVisible="False" ReadOnly="True" SortExpression="UrunID">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Renk" HeaderText="Renk" SortExpression="Renk">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Kayit Tarihi" HeaderText="Kayit Tarihi" SortExpression="Kayit Tarihi">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Stok Durumu" HeaderText="Stok Durumu" SortExpression="Stok Durumu">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="PersonelID" HeaderText="PersonelID" SortExpression="PersonelID">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Lokasyon" HeaderText="Lokasyon" SortExpression="Lokasyon">
            <ControlStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="Durumu" HeaderText="Durumu" SortExpression="Durumu">
            <ControlStyle Width="60px" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [malzeme] WHERE [UrunID] = @UrunID" InsertCommand="INSERT INTO [malzeme] ([KategoriID], [Etiket No], [Etiket Durumu], [PersonelID], [Birimi], [Marka], [Model], [Seri No], [Resim], [Renk], [Kayit Tarihi], [Stok Durumu], [Lokasyon], [Cinsi], [Durumu]) VALUES (@KategoriID, @Etiket_No, @Etiket_Durumu, @PersonelID, @Birimi, @Marka, @Model, @Seri_No, @Resim, @Renk, @Kayit_Tarihi, @Stok_Durumu, @Lokasyon, @Cinsi, @Durumu)" SelectCommand="SELECT * FROM [malzeme]" UpdateCommand="UPDATE [malzeme] SET [KategoriID] = @KategoriID, [Etiket No] = @Etiket_No, [Etiket Durumu] = @Etiket_Durumu, [PersonelID] = @PersonelID, [Birimi] = @Birimi, [Marka] = @Marka, [Model] = @Model, [Seri No] = @Seri_No, [Resim] = @Resim, [Renk] = @Renk, [Kayit Tarihi] = @Kayit_Tarihi, [Stok Durumu] = @Stok_Durumu, [Lokasyon] = @Lokasyon, [Cinsi] = @Cinsi, [Durumu] = @Durumu WHERE [UrunID] = @UrunID">
        <DeleteParameters>
            <asp:Parameter Name="UrunID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="KategoriID" Type="Int32" />
            <asp:Parameter Name="Etiket_No" Type="String" />
            <asp:Parameter Name="Etiket_Durumu" Type="String" />
            <asp:Parameter Name="PersonelID" Type="Int32" />
            <asp:Parameter Name="Birimi" Type="String" />
            <asp:Parameter Name="Marka" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Seri_No" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="Renk" Type="String" />
            <asp:Parameter Name="Kayit_Tarihi" Type="DateTime" />
            <asp:Parameter Name="Stok_Durumu" Type="String" />
            <asp:Parameter Name="Lokasyon" Type="String" />
            <asp:Parameter Name="Cinsi" Type="String" />
            <asp:Parameter Name="Durumu" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="KategoriID" Type="Int32" />
            <asp:Parameter Name="Etiket_No" Type="String" />
            <asp:Parameter Name="Etiket_Durumu" Type="String" />
            <asp:Parameter Name="PersonelID" Type="Int32" />
            <asp:Parameter Name="Birimi" Type="String" />
            <asp:Parameter Name="Marka" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Seri_No" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="Renk" Type="String" />
            <asp:Parameter Name="Kayit_Tarihi" Type="DateTime" />
            <asp:Parameter Name="Stok_Durumu" Type="String" />
            <asp:Parameter Name="Lokasyon" Type="String" />
            <asp:Parameter Name="Cinsi" Type="String" />
            <asp:Parameter Name="Durumu" Type="String" />
            <asp:Parameter Name="UrunID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    </div>
    </asp:Content>

