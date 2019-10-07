<%@ Page Language="C#" AutoEventWireup="true" CodeFile="firma.aspx.cs" Inherits="acilis_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="baslik">Firma Ve Genel Müdürlük & Bilgileri</div>
            <table style="height: 184px; width: 522px; margin:20px 0px 0px 20px;">
            <tr>
                <td>İl:</td>
                <td>
                <asp:DropDownList ID="dpil" runat="server" AutoPostBack="True"  Width="120px" DataSourceID="SqlDataSource1" DataTextField="sehir" DataValueField="id" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td>İlçe:</td>
                <td>
                <asp:DropDownList ID="dpilce" runat="server"  Width="120px" DataSourceID="SqlDataSource5" DataTextField="ilce" DataValueField="id" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style1">Firma Adı:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtfirma" runat="server" Width="120px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfirma" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp; </td>
                <td>
                   &nbsp; &nbsp; &nbsp;  <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                   
                
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="Şimdi Şube Tanımlamak İstemiyorum" OnCheckedChanged="CheckBox1_CheckedChanged" Visible="False" />
                   
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="kaydet" CssClass="buttonkayit" runat="server" Text="Kaydet" OnClick="kaydet_Click"/>
                   
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
            <div><asp:LinkButton ID="LinkButton2" runat="server" CssClass="butongec" PostBackUrl="~/acilis/sube.aspx" OnClick="LinkButton2_Click">Şube Ekle >></asp:LinkButton><asp:SqlDataSource ID="SqlDataSourcefirma" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Firma] WHERE [ID] = @original_ID AND [AD] = @original_AD AND [ILID] = @original_ILID AND [ILCEID] = @original_ILCEID" InsertCommand="INSERT INTO [Firma] ([AD], [ILID], [ILCEID]) VALUES (@AD, @ILID, @ILCEID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Firma]" UpdateCommand="UPDATE [Firma] SET [AD] = @AD, [ILID] = @ILID, [ILCEID] = @ILCEID WHERE [ID] = @original_ID AND [AD] = @original_AD AND [ILID] = @original_ILID AND [ILCEID] = @original_ILCEID">
                
                
                  <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_AD" Type="String" />
                    <asp:Parameter Name="original_ILID" Type="Int32" />
                    <asp:Parameter Name="original_ILCEID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtfirma" Name="AD" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="dpil" Name="ILID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="dpilce" Name="ILCEID" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AD" Type="String" />
                    <asp:Parameter Name="ILID" Type="Int32" />
                    <asp:Parameter Name="ILCEID" Type="Int32" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_AD" Type="String" />
                    <asp:Parameter Name="original_ILID" Type="Int32" />
                    <asp:Parameter Name="original_ILCEID" Type="Int32" />
                </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" DeleteCommand="DELETE FROM [Merkezvesubebirimleri] WHERE [ID] = @original_ID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([SubeID] = @original_SubeID) OR ([SubeID] IS NULL AND @original_SubeID IS NULL)) AND (([BirimID] = @original_BirimID) OR ([BirimID] IS NULL AND @original_BirimID IS NULL)) AND (([ILID] = @original_ILID) OR ([ILID] IS NULL AND @original_ILID IS NULL)) AND (([ILCEID] = @original_ILCEID) OR ([ILCEID] IS NULL AND @original_ILCEID IS NULL)) AND (([SILID] = @original_SILID) OR ([SILID] IS NULL AND @original_SILID IS NULL)) AND (([SILCEID] = @original_SILCEID) OR ([SILCEID] IS NULL AND @original_SILCEID IS NULL)) AND (([KATID] = @original_KATID) OR ([KATID] IS NULL AND @original_KATID IS NULL)) AND (([SKATID] = @original_SKATID) OR ([SKATID] IS NULL AND @original_SKATID IS NULL))" InsertCommand="INSERT INTO [Merkezvesubebirimleri] ([KurumID], [SubeID], [BirimID], [ILID], [ILCEID], [SILID], [SILCEID], [KATID], [SKATID]) VALUES (@KurumID, @SubeID, @BirimID, @ILID, @ILCEID, @SILID, @SILCEID, @KATID, @SKATID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Merkezvesubebirimleri]" UpdateCommand="UPDATE [Merkezvesubebirimleri] SET [KurumID] = @KurumID, [SubeID] = @SubeID, [BirimID] = @BirimID, [ILID] = @ILID, [ILCEID] = @ILCEID, [SILID] = @SILID, [SILCEID] = @SILCEID, [KATID] = @KATID, [SKATID] = @SKATID WHERE [ID] = @original_ID AND (([KurumID] = @original_KurumID) OR ([KurumID] IS NULL AND @original_KurumID IS NULL)) AND (([SubeID] = @original_SubeID) OR ([SubeID] IS NULL AND @original_SubeID IS NULL)) AND (([BirimID] = @original_BirimID) OR ([BirimID] IS NULL AND @original_BirimID IS NULL)) AND (([ILID] = @original_ILID) OR ([ILID] IS NULL AND @original_ILID IS NULL)) AND (([ILCEID] = @original_ILCEID) OR ([ILCEID] IS NULL AND @original_ILCEID IS NULL)) AND (([SILID] = @original_SILID) OR ([SILID] IS NULL AND @original_SILID IS NULL)) AND (([SILCEID] = @original_SILCEID) OR ([SILCEID] IS NULL AND @original_SILCEID IS NULL)) AND (([KATID] = @original_KATID) OR ([KATID] IS NULL AND @original_KATID IS NULL)) AND (([SKATID] = @original_SKATID) OR ([SKATID] IS NULL AND @original_SKATID IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_KurumID" Type="Int32" />
                        <asp:Parameter Name="original_SubeID" Type="Int32" />
                        <asp:Parameter Name="original_BirimID" Type="Int32" />
                        <asp:Parameter Name="original_ILID" Type="Int32" />
                        <asp:Parameter Name="original_ILCEID" Type="Int32" />
                        <asp:Parameter Name="original_SILID" Type="Int32" />
                        <asp:Parameter Name="original_SILCEID" Type="Int32" />
                        <asp:Parameter Name="original_KATID" Type="Int32" />
                        <asp:Parameter Name="original_SKATID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="KurumID" Type="Int32" />
                        <asp:Parameter Name="SubeID" Type="Int32" />
                        <asp:Parameter Name="BirimID" Type="Int32" />
                        <asp:ControlParameter ControlID="dpil" Name="ILID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="dpilce" Name="ILCEID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="SILID" Type="Int32" />
                        <asp:Parameter Name="SILCEID" Type="Int32" />
                        <asp:Parameter Name="KATID" Type="Int32" />
                        <asp:Parameter Name="SKATID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="KurumID" Type="Int32" />
                        <asp:Parameter Name="SubeID" Type="Int32" />
                        <asp:Parameter Name="BirimID" Type="Int32" />
                        <asp:Parameter Name="ILID" Type="Int32" />
                        <asp:Parameter Name="ILCEID" Type="Int32" />
                        <asp:Parameter Name="SILID" Type="Int32" />
                        <asp:Parameter Name="SILCEID" Type="Int32" />
                        <asp:Parameter Name="KATID" Type="Int32" />
                        <asp:Parameter Name="SKATID" Type="Int32" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_KurumID" Type="Int32" />
                        <asp:Parameter Name="original_SubeID" Type="Int32" />
                        <asp:Parameter Name="original_BirimID" Type="Int32" />
                        <asp:Parameter Name="original_ILID" Type="Int32" />
                        <asp:Parameter Name="original_ILCEID" Type="Int32" />
                        <asp:Parameter Name="original_SILID" Type="Int32" />
                        <asp:Parameter Name="original_SILCEID" Type="Int32" />
                        <asp:Parameter Name="original_KATID" Type="Int32" />
                        <asp:Parameter Name="original_SKATID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [ilceler]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [ilceler] WHERE ([sehir] = @sehir)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dpil" Name="sehir" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemirbasYonetimSistemleriConnectionString %>" SelectCommand="SELECT * FROM [iller]"></asp:SqlDataSource>
            </div>
    </div>
    </form>
</body>
</html>
