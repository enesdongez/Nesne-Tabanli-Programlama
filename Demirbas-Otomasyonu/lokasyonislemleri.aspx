<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lokasyonislemleri.aspx.cs" Inherits="lokasyonzimmet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/eklesildüzenle.css" rel="stylesheet" />
    <div class="boyutt">
     <div style="margin:00px 0px 0px 00px; padding:5px 0px 5px 5px; font-size:; width:700px;" > 
       &nbsp;&nbsp;&nbsp; Lokasyon Listeleme
            <hr style="width:100%; border:0.5px solid gray; " />
         Arama Kriteri:&nbsp; 
       <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="92px">
    </asp:DropDownList>
         &nbsp;&nbsp;&nbsp;&nbsp; Ara:&nbsp;
    <asp:textbox runat="server" width="369px"></asp:textbox>
           <br />
     </div>



        <br />
        <br />
        <br />

        <asp:gridview runat="server" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:gridview>

        </div>
</asp:Content>

