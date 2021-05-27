<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarPrograma.aspx.cs" Inherits="ChampaquiAdventure_V3.ModificarPrograma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Nombre del programa&nbsp;&nbsp;
        <br />
        <asp:TextBox ID="Txt_Nombre" runat="server"></asp:TextBox>
        <br />
        <br />
        Descripción&nbsp;&nbsp;&nbsp;
        <br />
        <asp:TextBox ID="Txt_Desc" runat="server"></asp:TextBox>
        <br />
        <br />
        Cupo mínimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cupo máximo<br />
        <asp:TextBox ID="Txt_CupMin" runat="server" Width="85px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="Txt_CupMax" runat="server" Width="85px"></asp:TextBox>
        <br />
        <br />
        Precio&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Txt_Precio" runat="server"></asp:TextBox>
        <br />
        <br />
        Preferencia<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="ID_Preferencia" Height="36px" Width="122px">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Preferencias]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Bt_Agregar" runat="server" Text="Guardar" OnClick="Bt_Guardar_Click" />
        <br />
        <br />
        <asp:Label ID="Label_Msg" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
