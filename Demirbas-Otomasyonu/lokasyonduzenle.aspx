<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lokasyonduzenle.aspx.cs" Inherits="lokasyonduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/eklesildüzenle.css" rel="stylesheet" />
   
    <div class="menu">
        <div class="menu1">
            <div style="width:400px; margin:auto; padding:20px 0px 0px 0px; font-size:16px;"> 
   &nbsp;&nbsp;&nbsp; Lokasyon Ekle
            <hr style="width:100%; border:0.5px solid gray; " />
            <table border="0" class="table2">
        <tr>
            <td>
                İsim:
            </td>
             <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
            </td>
                <td>
                Bölge:
            </td>
            <td>
             <asp:TextBox ID="TextBox4" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Kat:
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Daire:
            </td>
            <td>
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
       <div class="menu2">

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
</asp:Content>

