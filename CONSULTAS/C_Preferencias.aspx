<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_Preferencias.aspx.cs" Inherits="ChampaquiAdventure_v3.CONSULTAS.C_Preferencias" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar Preferencias</title>
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Consultar Preferencias ↓</a><ul><li><a href="../CONSULTAS/C_Cliente.aspx">Clientes</a></li><li><a href="../CONSULTAS/C_Extras.aspx">Extras</a></li><li><a href="../CONSULTAS/C_Guias.aspx">Guias</a></li><li><a href="../CONSULTAS/C_Origen.aspx">Origenes</a></li><li><a><strike>Preferencias</strike></a></li><li><a href="../CONSULTAS/C_Programas.aspx">Programas</a></li><li><a href="../CONSULTAS/C_Salidas.aspx">Salidas</a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <div style="width: 346px;">
                                        <div>
                                            <asp:TextBox ID="TxBx_CPREF_Consulta" runat="server"></asp:TextBox>
                                            <asp:Button class="art-button" ID="Bt_CPREF_Buscar" runat="server" Text="Buscar" OnClick="Bt_CPREF_Buscar_Click" />
                                        </div>
                                        <br />
                                        <div>

                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Preferencia" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_Preferencia" HeaderText="ID_Preferencia" ReadOnly="True" SortExpression="ID_Preferencia" InsertVisible="False" Visible="False" />
                                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button CssClass="art-button" ID="Bt_CPREF_Eliminar" runat="server" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" Text="Borrar"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button CssClass="art-button" ID="Bt_CPREF_Modificar" runat="server" CommandName="Select" Text="Modificar" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Preferencias]" DeleteCommand="DELETE FROM [Preferencias] WHERE [ID_Preferencia] = @ID_Preferencia" InsertCommand="INSERT INTO [Preferencias] ([Nombre]) VALUES (@Nombre)" UpdateCommand="UPDATE [Preferencias] SET [Nombre] = @Nombre WHERE [ID_Preferencia] = @ID_Preferencia">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID_Preferencia" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Nombre" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Nombre" Type="String" />
                                            <asp:Parameter Name="ID_Preferencia" Type="Int32" />
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