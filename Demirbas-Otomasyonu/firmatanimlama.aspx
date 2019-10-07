<%@ Page Language="C#" AutoEventWireup="true" CodeFile="firmatanimlama.aspx.cs" Inherits="firmatanımlama" MasterPageFile="~/MasterPage.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   
    
    <style type="text/css">
    .auto-style3 {
        margin: 0px auto auto auto;
    }
        .buttonkayit
        {
            width:82px;
            height:30px;
            background-color:white;
            background-image:url('Scripts/resim/iconlar/demirbaskayıtbuttonn.png');
            background-repeat:no-repeat;
            background-position:left;
            text-align:right;
            margin:0px 0px 0px 20px;
        }
        .baslik
        {
            background-color: #627A96; 
            color: #FFFFFF;
            width:805px;
            padding:0px 0px 0px 8px;
           

        }
     
     
     
        .auto-style5
        {
            width: 453px;
        }
        .auto-style6
        {
            width: 354px;
        }
        .auto-style7
        {
            width: 349px;
        }
        .auto-style8
        {
            width: 345px;
        }
        .auto-style9
        {
            width: 342px;
        }
        .auto-style11
        {
        }
        .auto-style12
        {
            width: 332px;
        }
             
     
     
        .auto-style14
        {            width: 400px;
        }
        .auto-style15
        {
            height: 23px;
        }
     
     
     
        .auto-style16
        {
            width: 120px;
        }
     
     
     
        .auto-style18
        {
            width: 8px;
            height: 42px;
        }
        .auto-style19
        {
            width: 342px;
            height: 42px;
        }
     
     
     
        .auto-style20
        {
            height: 42px;
        }
        .auto-style21
        {
            width: 315px;
        }
        .auto-style22
        {
            width: 314px;
        }
        .auto-style23
        {
        }
        .auto-style24
        {
            width: 315px;
            height: 42px;
        }
        .auto-style25
        {
            width: 314px;
            height: 42px;
        }
        .auto-style26
        {
            height: 42px;
        }
     
     
     
        .auto-style27
        {
            width: 360px;
            height: 42px;
        }
        .auto-style1
        {
            width: 392px;
        }
        #Panel1
        {
            
        }
     
     
        .auto-style28
        {
            height: 26px;
        }
        .auto-style29
        {
            width: 342px;
            height: 26px;
        }
     
     
    </style>
    
   
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="server"  >
    <asp:Panel ID="Panel1" ScrollBars="Auto" Width="820px" Height="712px" runat="server">
    <div>
    <div class="baslik">Firma Ve Genel Müdürlük & Bilgileri</div>
        <br />
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style23">İl:</td>
                <td class="auto-style9">
                <asp:DropDownList ID="dpil" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="sehir" DataValueField="id" Width="120px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style28">İlçe:</td>
                <td class="auto-style29">
                <asp:DropDownList ID="dpilce" runat="server" DataSourceID="SqlDataSource2" DataTextField="ilce" DataValueField="id" Width="120px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style20">Firma Adı:</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtfirma" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:Button ID="kaydet" runat="server" CssClass="buttonkayit" OnClick="kaydet_Click" Text="Kaydet" />
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSourcefirma" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Firma] WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL))" InsertCommand="INSERT INTO [Firma] ([AD])  VALUES (@AD)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Firma]" UpdateCommand="UPDATE [Firma] SET [AD] = @AD WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL))" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_AD" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtfirma" Name="AD" PropertyName="Text" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AD" Type="String" />
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_AD" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <br />
    <div>

      
        <div class="baslik">Firmaya Alt Şube Ekle</div>
            <br />

      

            <table class="auto-style5">
                <tr>
                    <td class="auto-style12">İl:</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="sehir" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ValidationGroup="GR" Width="120px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">Firmalar:</td>
                    <td class="auto-style27">
                        <asp:DropDownList ID="DdlFirmalar" runat="server" DataSourceID="SqlDataSource3" DataTextField="AD" DataValueField="ID" Width="120px" OnSelectedIndexChanged="DdlFirmalar_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">İlçe:</td>
                    <td class="auto-style21">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource5" DataTextField="ilce" DataValueField="id" ValidationGroup="GR" Width="120px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style22">Şube:</td>
                    <td class="auto-style28">
                        <asp:TextBox ID="txtsube" runat="server" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">&nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style25"></td>
                    <td class="auto-style26"></td>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="4">
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [ilceler] WHERE ([sehir] = @sehir)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="sehir" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [Firma]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourcesube" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Subeler] WHERE [SubeID] = @original_SubeID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([IL_ID] = @original_IL_ID) OR ([IL_ID] IS NULL AND @original_IL_ID IS NULL)) AND (([ILCE_ID] = @original_ILCE_ID) OR ([ILCE_ID] IS NULL AND @original_ILCE_ID IS NULL))" InsertCommand="INSERT INTO [Subeler] ([KurumID], [AD], [IL_ID], [ILCE_ID]) VALUES (@KurumID, @AD, @IL_ID, @ILCE_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subeler]" UpdateCommand="UPDATE [Subeler] SET [KurumID] = @KurumID, [AD] = @AD, [IL_ID] = @IL_ID, [ILCE_ID] = @ILCE_ID WHERE [SubeID] = @original_SubeID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([IL_ID] = @original_IL_ID) OR ([IL_ID] IS NULL AND @original_IL_ID IS NULL)) AND (([ILCE_ID] = @original_ILCE_ID) OR ([ILCE_ID] IS NULL AND @original_ILCE_ID IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_SubeID" Type="Int32" />
                                <asp:Parameter Name="original_KurumID" Type="Int32" />
                                <asp:Parameter Name="original_AD" Type="String" />
                                <asp:Parameter Name="original_IL_ID" Type="Int32" />
                                <asp:Parameter Name="original_ILCE_ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="DdlFirmalar" Name="KurumID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtsube" Name="AD" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="dpil" Name="IL_ID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="dpilce" Name="ILCE_ID" PropertyName="SelectedValue" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="KurumID" Type="Int32" />
                                <asp:Parameter Name="AD" Type="String" />
                                <asp:Parameter Name="IL_ID" Type="Int32" />
                                <asp:Parameter Name="ILCE_ID" Type="Int32" />
                                <asp:Parameter Name="original_SubeID" Type="Int32" />
                                <asp:Parameter Name="original_KurumID" Type="Int32" />
                                <asp:Parameter Name="original_AD" Type="String" />
                                <asp:Parameter Name="original_IL_ID" Type="Int32" />
                                <asp:Parameter Name="original_ILCE_ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="4">
                    <asp:Button ID="SubeKaydet" CssClass="buttonkayit" runat="server" OnClick="SubeKaydet_Click" Text="Kaydet" />
                    &nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="4">
                        <table class="auto-style5">
                            </table>
                    </td>
                </tr>
            </table>

      

    </div>
   
        
         </div>
      
      <br />
      <div class="baslik">Departman Bilgileri</div>
    <br />
    <table class="auto-style14">
        <tr>
            <td>Birim Adı:</td>
            <td>
                    <asp:TextBox ID="txtbirim" runat="server" style="margin-left: 0px" Width="120px"></asp:TextBox>
                                </td>
            <td>Firmalar:</td>
            <td class="auto-style16">
                        <asp:DropDownList ID="DdlFirmalar0" runat="server" DataSourceID="SqlDataSource3" DataTextField="AD" DataValueField="ID" style="margin-left: 0px" Width="120px" AutoPostBack="True">
                        </asp:DropDownList>
                                </td>
        </tr>
        <tr>
            <td>Kat Seç:</td>
            <td>
                <asp:TextBox ID="txtbirim0" runat="server" style="margin-left: 0px" Width="120px"></asp:TextBox>
            </td>
            <td>Şubeler:</td>
            <td class="auto-style16">
                        <asp:DropDownList ID="DdlSubeler" runat="server" DataSourceID="SqlDataSource4" DataTextField="AD" DataValueField="SubeID" Width="120px">
                        </asp:DropDownList>
                                </td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="4">
                                    <asp:Button ID="Button9" CssClass="buttonkayit" runat="server" Text="Kaydet" OnClick="Button9_Click" />
                                    <asp:SqlDataSource ID="SqlDataSourceBirim" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Birim] WHERE [B_ID] = @original_B_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL))" InsertCommand="INSERT INTO [Birim] ([Ad], [Kat]) VALUES (@Ad, @Kat)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Birim]" UpdateCommand="UPDATE [Birim] SET [Ad] = @Ad, [Kat] = @Kat WHERE [B_ID] = @original_B_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_B_ID" Type="Int32" />
                                            <asp:Parameter Name="original_Ad" Type="String" />
                                            <asp:Parameter Name="original_Kat" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="txtbirim" Name="Ad" PropertyName="Text" Type="String" />
                                            <asp:Parameter Name="Kat" Type="Int32" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Ad" Type="String" />
                                            <asp:Parameter Name="Kat" Type="Int32" />
                                            <asp:Parameter Name="original_B_ID" Type="Int32" />
                                            <asp:Parameter Name="original_Ad" Type="String" />
                                            <asp:Parameter Name="original_Kat" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSourceGenel" runat="server"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT SubeID, KurumID, AD, IL_ID, ILCE_ID FROM Subeler  WHERE ([KurumID] = @KurumID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DdlFirmalar0" Name="KurumID" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
      
                                    <asp:Label ID="Label4" runat="server"></asp:Label>
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [ilceler] WHERE ([sehir] = @sehir)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dpil" Name="sehir" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                </asp:SqlDataSource>
      
        <asp:SqlDataSource ID="sqldatasourcemerkez" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Merkezvesubebirimleri] WHERE [ID] = @original_ID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([SubeID] = @original_SubeID) OR ([SubeID] IS NULL AND @original_SubeID IS NULL)) AND (([BirimID] = @original_BirimID) OR ([BirimID] IS NULL AND @original_BirimID IS NULL)) AND (([ILID] = @original_ILID) OR ([ILID] IS NULL AND @original_ILID IS NULL)) AND (([ILCEID] = @original_ILCEID) OR ([ILCEID] IS NULL AND @original_ILCEID IS NULL)) AND (([SILID] = @original_SILID) OR ([SILID] IS NULL AND @original_SILID IS NULL)) AND (([SILCEID] = @original_SILCEID) OR ([SILCEID] IS NULL AND @original_SILCEID IS NULL))" InsertCommand="INSERT INTO [Merkezvesubebirimleri] ([KurumID], [SubeID], [BirimID], [ILID], [ILCEID], [SILID], [SILCEID]) VALUES (@KurumID, @SubeID,@BirimID, @ILID, @ILCEID, @SILID, @SILCEID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Merkezvesubebirimleri]" UpdateCommand="UPDATE [Merkezvesubebirimleri] SET [KurumID] = @KurumID, [SubeID] = @SubeID, [BirimID] = @BirimID, [ILID] = @ILID, [ILCEID] = @ILCEID, [SILID] = @SILID, [SILCEID] = @SILCEID WHERE [ID] = @original_ID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([SubeID] = @original_SubeID) OR ([SubeID] IS NULL AND @original_SubeID IS NULL)) AND (([BirimID] = @original_BirimID) OR ([BirimID] IS NULL AND @original_BirimID IS NULL)) AND (([ILID] = @original_ILID) OR ([ILID] IS NULL AND @original_ILID IS NULL)) AND (([ILCEID] = @original_ILCEID) OR ([ILCEID] IS NULL AND @original_ILCEID IS NULL)) AND (([SILID] = @original_SILID) OR ([SILID] IS NULL AND @original_SILID IS NULL)) AND (([SILCEID] = @original_SILCEID) OR ([SILCEID] IS NULL AND @original_SILCEID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_KurumID" Type="Int32" />
                <asp:Parameter Name="original_SubeID" Type="Int32" />
                <asp:Parameter Name="original_BirimID" Type="Int32" />
                <asp:Parameter Name="original_ILID" Type="Int32" />
                <asp:Parameter Name="original_ILCEID" Type="Int32" />
                <asp:Parameter Name="original_SILID" Type="Int32" />
                <asp:Parameter Name="original_SILCEID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DdlFirmalar0" Name="KurumID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DdlSubeler" Name="SubeID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtbirim" DefaultValue="1" Name="BirimID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="dpil" Name="ILID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="dpilce" Name="ILCEID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="SILID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="SILCEID" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="KurumID" Type="Int32" />
                <asp:Parameter Name="SubeID" Type="Int32" />
                <asp:Parameter Name="BirimID" Type="Int32" />
                <asp:Parameter Name="ILID" Type="Int32" />
                <asp:Parameter Name="ILCEID" Type="Int32" />
                <asp:Parameter Name="SILID" Type="Int32" />
                <asp:Parameter Name="SILCEID" Type="Int32" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_KurumID" Type="Int32" />
                <asp:Parameter Name="original_SubeID" Type="Int32" />
                <asp:Parameter Name="original_BirimID" Type="Int32" />
                <asp:Parameter Name="original_ILID" Type="Int32" />
                <asp:Parameter Name="original_ILCEID" Type="Int32" />
                <asp:Parameter Name="original_SILID" Type="Int32" />
                <asp:Parameter Name="original_SILCEID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
      
            </td>
        </tr>
    </table>
    <div style="text-align:right; bottom: 5px;">
        --&gt;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/personelduzenle.aspx">Personel Ekle</asp:HyperLink></div>
      </asp:Panel>
        </asp:Content>
