<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_Programas.aspx.cs" Inherits="ChampaquiAdventure_v3.CONSULTAS.C_Programas" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar Programas</title>
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Consultar Programas ↓</a><ul><li><a href="../CONSULTAS/C_Cliente.aspx">Clientes</a></li><li><a href="../CONSULTAS/C_Extras.aspx">Extras</a></li><li><a href="../CONSULTAS/C_Guias.aspx">Guias</a></li><li><a href="../CONSULTAS/C_Origen.aspx">Origenes</a></li><li><a href="../CONSULTAS/C_Preferencias.aspx">Preferencias</a></li><li><a><strike>Programas</strike></a></li><li><a href="../CONSULTAS/C_Salidas.aspx">Salidas</a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <div style="width: 472px;">
                                        <div>
                                            <asp:TextBox ID="TxBx_CPROG_Consulta" runat="server"></asp:TextBox>
                                            <asp:Button class="art-button" ID="Bt_CPROG_Buscar" runat="server" Text="Buscar" OnClick="Bt_CPROG_Buscar_Click" />
                                        </div>
                                        <br />
                                        <div>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Programa" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Programa" HeaderText="ID_Programa" ReadOnly="True" SortExpression="ID_Programa" InsertVisible="False" Visible="False" />
                                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                                    <asp:BoundField DataField="Cupo_Min" HeaderText="Cupo Minimo" SortExpression="Cupo_Min" />
                                                    <asp:BoundField DataField="Cupo_Max" HeaderText="Cupo Maximo" SortExpression="Cupo_Max" />
                                                    <asp:BoundField DataField="PrecioDelPrograma" HeaderText="Precio" SortExpression="PrecioDelPrograma" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button CssClass="art-button" ID="Bt_CPROG_Eliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" Text="Borrar"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button CssClass="art-button" ID="Bt_CPROG_Modificar" runat="server" CommandName="Select" text="Modificar" />
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
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Programas]" DeleteCommand="DELETE FROM [Programas] WHERE [ID_Programa] = @ID_Programa" InsertCommand="INSERT INTO [Programas] ([Nombre], [Descripcion], [Cupo_Min], [Cupo_Max], [PrecioDelPrograma]) VALUES (@Nombre, @Descripcion, @Cupo_Min, @Cupo_Max, @PrecioDelPrograma)" UpdateCommand="UPDATE [Programas] SET [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Cupo_Min] = @Cupo_Min, [Cupo_Max] = @Cupo_Max, [PrecioDelPrograma] = @PrecioDelPrograma WHERE [ID_Programa] = @ID_Programa">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="ID_Programa" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Nombre" Type="String" />
                                                    <asp:Parameter Name="Descripcion" Type="String" />
                                                    <asp:Parameter Name="Cupo_Min" Type="Int32" />
                                                    <asp:Parameter Name="Cupo_Max" Type="Int32" />
                                                    <asp:Parameter Name="PrecioDelPrograma" Type="Double" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Nombre" Type="String" />
                                                    <asp:Parameter Name="Descripcion" Type="String" />
                                                    <asp:Parameter Name="Cupo_Min" Type="Int32" />
                                                    <asp:Parameter Name="Cupo_Max" Type="Int32" />
                                                    <asp:Parameter Name="PrecioDelPrograma" Type="Double" />
                                                    <asp:Parameter Name="ID_Programa" Type="Int32" />
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