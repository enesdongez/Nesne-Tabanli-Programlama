<%@ Page Language="C#" AutoEventWireup="true" CodeFile="birim.aspx.cs" Inherits="acilis_birim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1
        {
            width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="baslik">Departman Bilgileri</div>
    <br />
    <table style="height:160px; width:400px;">
        <tr>
            <td>Birim Adı:</td>
            <td>
                    <asp:TextBox ID="txtbirim" runat="server" style="margin-left: 0px" Width="120px"></asp:TextBox>
                                </td>
            <td>Firmalar:</td>
            <td class="auto-style1" >
                        <asp:DropDownList ID="DdlFirmalar0" runat="server"  style="margin-left: 0px" Width="120px" AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="AD" DataValueField="ID">
                        </asp:DropDownList>
                                </td>
        </tr>
        <tr>
            <td>Kat Seç:</td>
            <td>
                <asp:TextBox ID="txtbirim0" runat="server" style="margin-left: 0px" Width="120px"></asp:TextBox>
            </td>
            <td>Şubeler:</td>
            <td class="auto-style1" >
                        <asp:DropDownList ID="DdlSubeler" runat="server"  Width="120px" DataSourceID="SqlDataSource8" DataTextField="AD" DataValueField="SubeID">
                        </asp:DropDownList>
                                </td>
        </tr>
        <tr>
            <td colspan="4">
                                    <asp:Button ID="Button9" CssClass="buttonkayit" runat="server" Text="Kaydet" OnClick="Button9_Click"  />
                                   
      
                                    <asp:Label ID="Label4" runat="server"></asp:Label>
      
   
      
            </td>
        </tr>
    </table>

        <br />
        <a href="../demirbasislemleri.aspx" target="_top" class="butongec">Bitir >></a>
      <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Birim] WHERE [B_ID] = @original_B_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL))" InsertCommand="INSERT INTO [Birim] ([Ad], [Kat]) VALUES (@Ad, @Kat)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Birim]" UpdateCommand="UPDATE [Birim] SET [Ad] = @Ad, [Kat] = @Kat WHERE [B_ID] = @original_B_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL))">
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
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Firma] WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL)) AND (([Adres] = @original_Adres) OR ([Adres] IS NULL AND @original_Adres IS NULL))" InsertCommand="INSERT INTO [Firma] ([AD], [Kat], [Adres]) VALUES (@AD, @Kat, @Adres)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Firma]" UpdateCommand="UPDATE [Firma] SET [AD] = @AD, [Kat] = @Kat, [Adres] = @Adres WHERE [ID] = @original_ID AND (([AD] = @original_AD) OR ([AD] IS NULL AND @original_AD IS NULL)) AND (([Kat] = @original_Kat) OR ([Kat] IS NULL AND @original_Kat IS NULL)) AND (([Adres] = @original_Adres) OR ([Adres] IS NULL AND @original_Adres IS NULL))">
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
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subeler] WHERE ([KurumID] = @KurumID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DdlFirmalar0" Name="KurumID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
