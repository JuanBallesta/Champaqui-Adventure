<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_Cliente.aspx.cs" Inherits="ChampaquiAdventure_v3.CONSULTAS.C_Cliente" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar Clientes</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="style.css" media="screen">
    <link rel="stylesheet" href="style.responsive.css" media="all">
    <script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Consultar Clientes ↓</a><ul><li><a><strike>Clientes</strike></a></li><li><a href="../CONSULTAS/C_Extras.aspx">Extras</a></li><li><a href="../CONSULTAS/C_Guias.aspx">Guias</a></li><li><a href="../CONSULTAS/C_Origen.aspx">Origenes</a></li><li><a href="../CONSULTAS/C_Preferencias.aspx">Preferencias</a></li><li><a href="../CONSULTAS/C_Programas.aspx">Programas</a></li><li><a href="../CONSULTAS/C_Salidas.aspx">Salidas</a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <table class="auto-style1">
                                        <tr style="border:none">
                                            <td class="auto-style5" style="border:none">
                                                <h4>B:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_CCLI_Consulta" runat="server"></asp:TextBox>
                                            <asp:Button class="art-button" ID="Bt_CCLI_Buscar" runat="server" Text="Buscar" OnClick="Bt_CCLI_Buscar_Click" />
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style5" style="border:none">
                                                <h4>D:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" DataKeyNames="ID_Cliente" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Cliente" HeaderText="ID_Cliente" SortExpression="ID_Cliente" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                                                    <asp:BoundField DataField="Fecha de nacimiento" HeaderText="Fecha de nacimiento" SortExpression="Fecha de nacimiento" DataFormatString="{0:d}" />
                                                    <asp:BoundField DataField="Pais" HeaderText="Pais" SortExpression="Pais" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="Bt_CCLI_Seleccionar" runat="server" CommandName="Select" Text="Info" class="art-button"/>
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
                                            </td>
                                        </tr>
                                        <div id="info" runat="server">
                                            <tr style="border:none">
                                                <td style="border:none">
                                                    <h4>I:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" GridLines="None" DataKeyNames="ID_Cliente">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
                                                                <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                                                                <asp:BoundField DataField="Localidad" HeaderText="Localidad" SortExpression="Localidad" />
                                                                <asp:BoundField DataField="Domicilio" HeaderText="Domicilio" SortExpression="Domicilio" />
                                                                <asp:BoundField DataField="Origen" HeaderText="Origen" SortExpression="Origen" />
                                                                <asp:CheckBoxField DataField="Ficha Medica?" HeaderText="Ficha Medica?" SortExpression="Ficha Medica?" />
                                                                <asp:BoundField DataField="Tipo de documento" HeaderText="Tipo de documento" SortExpression="Tipo de documento" />
                                                                <asp:BoundField DataField="ID_Cliente" HeaderText="ID_Cliente" InsertVisible="False" ReadOnly="True" SortExpression="ID_Cliente" Visible="False" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="Bt_CCLI_Eliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" Text="Borrar" CssClass="art-button"/>
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
                                                        </asp:GridView>
                                                </td>
                                            </tr>
                                        </div>
                                    </table>
                                </div>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT Genero.Genero, Provincias.Provincia, Localidades.Localidad, Cliente.Domicilio, Origen.OrigenDeConsulta AS Origen, Cliente.Ficha_Medica AS 'Ficha Medica?', Tipo_Documento.Descripcion AS 'Tipo de documento', Cliente.ID_Cliente FROM Cliente INNER JOIN Genero ON Cliente.Sexo = Genero.ID_Sexo INNER JOIN Localidades ON Cliente.Localidad = Localidades.ID_Localidad INNER JOIN Origen ON Cliente.Origen_Consulta = Origen.ID_Origen INNER JOIN Provincias ON Cliente.Provincia = Provincias.ID_Provincia AND Localidades.ID_Provincia = Provincias.ID_Provincia INNER JOIN Tipo_Documento ON Cliente.Tipo_Documento = Tipo_Documento.ID_TipoDoc" DeleteCommand="DELETE * FROM [Cliente] WHERE[ID_Cliente] = @ID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID" />
                                            </DeleteParameters>
                                </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT [ID_Cliente], [Nombre], [Apellido], [Numero_Documento] AS Documento, [Fecha_Nacimiento] AS 'Fecha de nacimiento', [Pais], [Email], [Telefono] FROM [Cliente]">
                                        </asp:SqlDataSource>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>