<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sube.aspx.cs" Inherits="acilis_sube" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1
        {
            width: 128px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <div class="baslik">Firmaya Alt Şube Ekle</div>
            <br />

      

            <table style="height: 180px; width: 417px;">
                <tr>
                    <td>İl:</td>
                    <td>
                        <asp:DropDownList ID="dpil" runat="server" AutoPostBack="True"  Width="120px" DataSourceID="SqlDataSource6" DataTextField="sehir" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                    <td>Firmalar:</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DdlFirmalar" runat="server" Width="120px" DataSourceID="SqlDataSource1" DataTextField="AD" DataValueField="ID" >
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>İlçe:</td>
                    <td >
                        <asp:DropDownList ID="dpilce" runat="server"  Width="120px" DataSourceID="SqlDataSource5" DataTextField="ilce" DataValueField="id" >
                        </asp:DropDownList>
                    </td>
                    <td >Şube:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtsube" runat="server" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    <asp:Button ID="SubeKaydet" CssClass="buttonkayit" runat="server" Text="Kaydet" OnClick="SubeKaydet_Click"  />
                    &nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table>
                            </table>
                    </td>
                </tr>
            </table>

        <div>
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="butongec" target="frame" PostBackUrl="~/acilis/birim.aspx">Birim Ekle >></asp:LinkButton><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Firma] WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL)) AND (([Adres] = @original_Adres) OR ([Adres] IS NULL AND @original_Adres IS NULL))" InsertCommand="INSERT INTO [Firma] ([AD], [Kat], [Adres]) VALUES (@AD, @Kat, @Adres)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Firma]" UpdateCommand="UPDATE [Firma] SET [AD] = @AD, [Kat] = @Kat, [Adres] = @Adres WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL)) AND (([Adres] = @original_Adres) OR ([Adres] IS NULL AND @original_Adres IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_AD" Type="String" />
                    <asp:Parameter Name="original_Kat" Type="Int32" />
                    <asp:Parameter Name="original_Adres" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AD" Type="String" />
                    <asp:Parameter Name="Kat" Type="Int32" />
                    <asp:Parameter Name="Adres" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AD" Type="String" />
                    <asp:Parameter Name="Kat" Type="Int32" />
                    <asp:Parameter Name="Adres" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_AD" Type="String" />
                    <asp:Parameter Name="original_Kat" Type="Int32" />
                    <asp:Parameter Name="original_Adres" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [ilceler] WHERE ([sehir] = @sehir)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpil" Name="sehir" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
      
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Subeler] WHERE [SubeID] = @original_SubeID AND [KurumID] = @original_KurumID AND [AD] = @original_AD AND [IL_ID] = @original_IL_ID AND [ILCE_ID] = @original_ILCE_ID" InsertCommand="INSERT INTO [Subeler] ([KurumID], [AD], [IL_ID], [ILCE_ID]) VALUES (@KurumID, @AD, @IL_ID, @ILCE_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subeler]" UpdateCommand="UPDATE [Subeler] SET [KurumID] = @KurumID, [AD] = @AD, [IL_ID] = @IL_ID, [ILCE_ID] = @ILCE_ID WHERE [SubeID] = @original_SubeID AND [KurumID] = @original_KurumID AND [AD] = @original_AD AND [IL_ID] = @original_IL_ID AND [ILCE_ID] = @original_ILCE_ID">
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
        </div>

    </div>
    </form>
</body>
</html>
