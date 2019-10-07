<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="personelislemleri.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/eklesildüzenle.css" rel="stylesheet" />
    <div class="boyutt">
     
        <div style="width:700px; margin:0px 0px 0px 0px; padding:5px 0px 5px 5px; font-size:;"> 
     &nbsp;&nbsp;&nbsp; Personel Listeleme
            <hr style="width:100%; border:0.5px solid gray; " />
          Arama Kriteri:&nbsp;
          <asp:DropDownList ID="DropDownList1" runat="server">
          </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ara:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="369px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PID" DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="PID" HeaderText="Sıra No" InsertVisible="False" ReadOnly="True" SortExpression="PID">
                <ControlStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad">
                <ControlStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad">
                <ControlStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="BirimID" HeaderText="BirimID" SortExpression="BirimID">
                <ControlStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="Pozisyon" HeaderText="Pozisyon" SortExpression="Pozisyon">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT PID AS [Sıra No], Ad AS Adı, Soyad AS Soyadı, BirimID AS Bölüm, Poziyon AS Mevkii FROM Personel"></asp:SqlDataSource>
    </p>
    </div>
</asp:Content>

