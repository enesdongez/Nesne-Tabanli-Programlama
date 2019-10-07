<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ayarlar.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .tablo1
        {
            width: 100px;
           
            margin:auto;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/ayarlar.css" rel="stylesheet" />
    <div class="ustmenuarac">
        <div class="div1">

            <table class="tablo1">
                <tr>
                    <td>

                        <a href="ayarlarsayfalari/personelekle.aspx" target="acilir">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Scripts/resim/menuicon/buttonperdevir.png" Width="25px" />
                        </a></td>
                    <td>

                       <a href="ayarlarsayfalari/personelekle.aspx" target="acilir">
                        <input type="button" id="Button9"  value="Personel" width="25px"/></a></td>
                </tr>
                </table>
            

        </div>
          <div class="div2">

              <table class="tablo1">
                  <tr>
                      <td><asp:Image ID="Image2" runat="server" ImageUrl="~/Scripts/resim/menuicon/buttonduzelt.png" Width="25px" />

                      </td>
                      <td>

          <a href="ayarlarsayfalari/lokasyonekle.aspx" target="acilir"><input type="button" id="Button6"  value="Lokasyon" /></a></td>
                  </tr>
              </table>
        </div>
          <div class="div3">

            <table class="tablo1">
                  <tr>
                      <td>

              <a href="ayarlarsayfalari/yekiver.aspx" target="acilir">
              <asp:Image ID="Image3" runat="server" ImageUrl="~/Scripts/resim/menuicon/buttonekle.png" Width="25px" />
                      </td>
                      <td>
              <a href="ayarlarsayfalari/demirbasekle.aspx" target="acilir"> <input type="button" id="Button2"  value="Demirbaş" /></a></td>
                  </tr>
              </table>

        </div>
          <div class="div4">

              <table class="tablo1">
                  <tr>
                     
                      <td>

              <a href="ayarlarsayfalari/yekiver.aspx" target="acilir">
              <asp:Image ID="Image4" runat="server" ImageUrl="~/Scripts/resim/menuicon/buttonekle.png" Width="25px" />
                      </td>
                     
                      <td>

                          <a href="ayarlarsayfalari/bölgeekle.aspx" target="acilir"><input type="button" id="Button3"  value="Genel Ayarlar" /></a></td>
                  </tr>
              </table>

        </div>
        <div class="div5">
          <table class="tablo1">
                <tr>
                  
                    <td>
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Scripts/resim/menuicon/buttonduzelt.png" Width="25px" />

                      </td>
                  
                    <td>
          <a href="ayarlarsayfalari/guncelle.aspx" target="acilir"><input type="button" id="Button4"  value="Güncelle" /></a></td>
                </tr>
            </table>
       </div>
    </div>
    <div class="altmenuarac">
        <iframe src="ayarlarsayfalari/personelekle.aspx" runat="server" name="acilir" id="acilir" width="99.5%" height="626px" style="border:0px; background-color:none;" onscroll="no">

        </iframe>
            
            
    </div>


</asp:Content>

