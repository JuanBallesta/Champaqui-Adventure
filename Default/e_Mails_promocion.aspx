<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="e_Mails_promocion.aspx.cs" Inherits="ChampaquiAdventure_v3.Default.e_Mails_promocion1" %>

<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Envio de e-Mails - Promocion</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" media="screen">
    <link rel="stylesheet" href="style.responsive.css" media="all">
    <script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 77px;
        }
    </style>

</head>
<body>
<div id="art-main">
<header class="art-header">
    <div class="art-shapes">    
            </div>

<h1 class="art-headline">
    <a href="/">Champaqui</a>
</h1>
<h2 class="art-slogan">adventure</h2>
<nav class="art-nav">
    <ul class="art-hmenu"><li><a href="index.aspx" class="">Inicio</a></li><li><a class="active">Envio de promociones</a></li><li><a href="e_Mails_recordatorio.aspx">Envio de recordatorios</a></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div>
                                    <table style="width: 100%; border:0px">
                                        <div id="Prog_Sal" runat="server">
                                            <tr style="border:0px">
                                            <td class="auto-style1" style="border:0px"><h4>PROGRAMAS:</h4></td>
                                            <td style="border:0px"><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDataSource1" DataTextField="Nombre" 
                                        DataValueField="ID_Programa" BackColor="#FFF5E1" CssClass="arrow" Height="30px">
                                    </asp:DropDownList></td>
                                        </tr>
                                        <tr style="border:0px">
                                            <td class="auto-style1" style="border:0px"><h4>SALIDAS:</h4></td>
                                            <td style="border:0px"><asp:GridView ID="GridView1" 
                                        runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="SqlDataSource2" 
                                        EmptyDataText="No hay registros de datos para mostrar." 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" DataKeyNames="ID_Salida,ID_Programa" CellPadding="4" GridLines="None" 
                                        >
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Nombre" HeaderText="Programa" 
                                                SortExpression="Nombre" />
                                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:d}" />
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                                                SortExpression="Nombre" Visible="False" InsertVisible="False" ReadOnly="True" />
                                            <asp:BoundField DataField="ID1" HeaderText="ID1" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="ID1" Visible="False" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button CssClass="art-button" runat="server" CommandName="Select" Text="Preparar envio" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#F6AC2C" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView></td>
                                        </tr>
                                        </div>
                                        <div id="Email_Bt" runat="server">
                                            <tr style="border:0px">
                                            <td class="auto-style1" style="border:0px"><h4>EMAIL</h4></td>
                                            <td style="border:0px">
                                                <asp:DropDownList ID="DPL_Emails" runat="server" DataSourceID="SqlDataSource3" DataTextField="Email" DataValueField="ID_email" Height="30px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="border:0px">
                                            <td class="auto-style1" style="border:0px"><h4>ENVIAR</h4></td>
                                            <td style="border:0px">
                                                <asp:Button ID="Bt_Enviar" runat="server" Text="Enviar" OnClick="Bt_Enviar_Click" />
                                                
                                            </td>
                                        </tr>
                                        </div>
                                    </table>
                                    <asp:Label ID="Label1" runat="server" Text="<h4></h4>"></asp:Label>
                                    <img id="Loader" runat="server" src="images/customloader.gif" style="height: 128px; width: 128px;" aling="center"/>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" 
                                        SelectCommand="SELECT [ID_Programa], [Nombre] FROM [Programas]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT Salidas.ID_Salida, Programas.ID_Programa, Programas.Nombre, Salidas.Fecha FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa WHERE (Programas.ID_Programa = @ID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="ID" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Emails]"></asp:SqlDataSource>
                                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Enabled="False" Interval="7000">
                                </asp:Timer>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                <br />
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>

</body></html>
