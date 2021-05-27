<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_Salidas.aspx.cs" Inherits="ChampaquiAdventure_v3.CONSULTAS.C_Salidas" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar Salidas</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" media="screen">
    <link rel="stylesheet" href="style.responsive.css" media="all">
    <script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>

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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Consultar Salidas ↓</a><ul><li><a href="../CONSULTAS/C_Cliente.aspx">Clientes</a></li><li><a href="../CONSULTAS/C_Extras.aspx">Extras</a></li><li><a href="../CONSULTAS/C_Guias.aspx">Guias</a></li><li><a href="../CONSULTAS/C_Origen.aspx">Origenes</a></li><li><a href="../CONSULTAS/C_Preferencias.aspx">Preferencias</a></li><li><a href="../CONSULTAS/C_Programas.aspx">Programas</a></li><li><a><strike>Salidas</strike></a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <div style="width: 423px;">
                                        <div>
                                            <asp:TextBox ID="TxBx_CSAL_Consulta" runat="server"></asp:TextBox>
                                            <asp:Button class="art-button" ID="Bt_CSAL_Buscar" runat="server" Text="Buscar" OnClick="Bt_CSAL_Buscar_Click" />
                                        </div>
                                        <br />
                                        <div>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Salida" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Salida" HeaderText="ID_Salida" ReadOnly="True" SortExpression="ID_Salida" InsertVisible="False" Visible="False" />
                                                    <asp:BoundField DataField="Programa" HeaderText="Programa" SortExpression="Programa" />
                                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:d}" />
                                                    <asp:BoundField DataField="Confirmados" HeaderText="Confirmados" SortExpression="Confirmados" />
                                                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="Bt_CSAL_Eliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" Text="Borrar" CssClass="art-button"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="Bt_CSAL_Modificar" runat="server" CommandName="Select" Text="Modificar" CssClass="art-button" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#F6AC2C" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                                                <RowStyle BackColor="#E3EAEB" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            </asp:GridView>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [Salidas] WHERE [Id_Salida] = @Id" InsertCommand="INSERT INTO [Salidas] ([Id_Programas], [Fecha], [Cant_Confirmados], [PrecioXPersona]) VALUES (@Id_Programas, @Fecha, @Cant_Confirmados, @PrecioXPersona)" SelectCommand="SELECT Salidas.ID_Salida, Programas.Nombre AS Programa, Salidas.Fecha, Salidas.Cant_Confirmados AS 'Confirmados', Salidas.PrecioDeSalida AS Precio FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa" UpdateCommand="UPDATE [Salidas] SET [Id_Programas] = @Id_Programas, [Fecha] = @Fecha, [Cant_Confirmados] = @Cant_Confirmados, [PrecioXPersona] = @PrecioXPersona WHERE [Id] = @Id">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Id" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Id_Programas" Type="Int32" />
                                                    <asp:Parameter DbType="Date" Name="Fecha" />
                                                    <asp:Parameter Name="Cant_Confirmados" Type="Int32" />
                                                    <asp:Parameter Name="PrecioXPersona" Type="Double" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Id_Programas" Type="Int32" />
                                                    <asp:Parameter DbType="Date" Name="Fecha" />
                                                    <asp:Parameter Name="Cant_Confirmados" Type="Int32" />
                                                    <asp:Parameter Name="PrecioXPersona" Type="Double" />
                                                    <asp:Parameter Name="Id" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>