<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_Extras.aspx.cs" Inherits="ChampaquiAdventure_v3.CONSULTAS.C_Extras" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar Extras</title>
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Consultar Extras ↓</a><ul><li><a href="../CONSULTAS/C_Cliente.aspx">Clientes</a></li><li><a><strike>Extras</strike></a></li><li><a href="../CONSULTAS/C_Guias.aspx">Guias</a></li><li><a href="../CONSULTAS/C_Origen.aspx">Origenes</a></li><li><a href="../CONSULTAS/C_Preferencias.aspx">Preferencias</a></li><li><a href="../CONSULTAS/C_Programas.aspx">Programas</a></li><li><a href="../CONSULTAS/C_Salidas.aspx">Salidas</a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <div style="width: 327px;">
                                        <div>
                                            <asp:TextBox ID="TxBx_CEXT_consulta" runat="server"></asp:TextBox>
                                            <asp:Button class="art-button" ID="Bt_CEXT_Buscar" runat="server" Text="Buscar" OnClick="Bt_CEXT_Buscar_Click" />
                                        </div>
                                        <br />
                                        <div>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Extra" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Extra" HeaderText="ID_Extra" SortExpression="ID_Extra" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                                    <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button CssClass="art-button" ID="Bt_CEXT_Eliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" Text="Borrar"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="Bt_CEXT_Modificar" runat="server" CommandName="Select" Text="Modificar" class="art-button"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#F6AC2C" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Extras]" DeleteCommand="DELETE FROM [Extras] WHERE [ID_Extra] = @ID_Extra" InsertCommand="INSERT INTO [Extras] ([Nombre], [Descripcion], [Monto]) VALUES (@Nombre, @Descripcion, @Monto)" UpdateCommand="UPDATE [Extras] SET [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Monto] = @Monto WHERE [ID_Extra] = @ID_Extra">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID_Extra" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Nombre" Type="String" />
                                            <asp:Parameter Name="Descripcion" Type="String" />
                                            <asp:Parameter Name="Monto" Type="Double" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Nombre" Type="String" />
                                            <asp:Parameter Name="Descripcion" Type="String" />
                                            <asp:Parameter Name="Monto" Type="Double" />
                                            <asp:Parameter Name="ID_Extra" Type="Int32" />
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