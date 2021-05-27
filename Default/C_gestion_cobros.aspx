<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_gestion_cobros.aspx.cs" Inherits="ChampaquiAdventure_v3.Default.C_gestion_cobros" %>

<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Consultar cobros</title>
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
    <ul class="art-hmenu"><li><a href="index.aspx" class="">Inicio</a></li><li><a href="A_gestion_cobros.aspx">Cargar cobros</a></li><li><a class="active">Consultar cobros</a></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <div style="height: 1214px">
                                        <table class="auto-style1" style="border:none">
                                            <tr style="border:none">
                                                <td style="border:none"><h4>BUSCAR:</h4></td>
                                                <td style="border:none">
                                        <asp:TextBox ID="txt_Fecha" runat="server" Width="158px" placeholder="Fecha/Programa"></asp:TextBox>
                                        <asp:Button ID="Button_Buscar" runat="server" Height="31px" OnClick="Button_Buscar_Click" Text="Buscar" Width="100px" />
                                                </td>
                                            </tr>
                                            
                                        </table>
                                        <div id="Salida" runat="server">
                                            <table style="border:none">
                                            <tr style="border:none">
                                                <td style="border:none"><h4>SALIDAS</h4></td>
                                                <td style="border:none"><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Salida" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." Width="769px" CellPadding="4" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ID_Salida" HeaderText="ID_Salida" InsertVisible="False" ReadOnly="True" SortExpression="ID_Salida" Visible="False" />
                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha"   HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:d}">
                                                
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Cant_Confirmados" HeaderText="Confirmados" SortExpression="Cant_Confirmados"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                                
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                
                                                </asp:BoundField>
                                                <asp:BoundField DataField="PrecioDeSalida" HeaderText="Precio de salida" SortExpression="PrecioDeSalida" />
                                                <asp:BoundField DataField="Nombre" HeaderText="Programa" SortExpression="Nombre" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID ="Bt_Seleccionar" runat="server" CommandName="Select" Text="Seleccionar" />
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

                                            </table>
                                        </div>
                                        <div id="Cliente" runat="server">
                                            <table style="border:none">
                                                <tr style="border:none">
                                                <td style="border:none"><h4>CLIENTES:</h4></td>
                                                <td style="border:none">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_CliXSal" DataSourceID="SqlDataSource2" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="710px" CellPadding="4" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
<asp:BoundField DataField="Nombre" HeaderText="Nombre del Cliente" ReadOnly="True" SortExpression="Nombre"></asp:BoundField>
                                                <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                                                <asp:BoundField DataField="Documento" HeaderText="Documento" ReadOnly="True" SortExpression="Documento" />
                                                <asp:BoundField DataField="OrigenDeConsulta" HeaderText="Origen de la Consulta" SortExpression="OrigenDeConsulta" />
                                                <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" Visible="False" />
                                                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" Visible="False" />
                                                <asp:CheckBoxField DataField="Ficha_Medica" HeaderText="Ficha_Medica" SortExpression="Ficha_Medica" Text="Ficha Medica" />
                                                <asp:BoundField DataField="ID_CliXSal" HeaderText="ID_CliXSal" InsertVisible="False" ReadOnly="True" SortExpression="ID_CliXSal" Visible="False" />
                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" Visible="False" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID ="Bt_Seleccionar" runat="server" CommandName="Select" Text="Seleccionar" />
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
                                            </table>
                                        </div>
                                        <div id="Resto" runat="server">
                                            <table style="border:none">
                                                
                                            <tr style="border:none">
                                                <td style="border:none"><h4>EXTRAS:</h4></td>
                                                <td style="border:none">
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_ExtXCliXSal" DataSourceID="SqlDataSource3" EmptyDataText="No hay registros de datos para mostrar." Width="502px" CellPadding="4" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ID_ExtXCliXSal" HeaderText="ID_ExtXCliXSal" InsertVisible="False" ReadOnly="True" SortExpression="ID_ExtXCliXSal" Visible="False" />
                                                <asp:BoundField DataField="ID_CliXSal" HeaderText="ID_CliXSal" SortExpression="ID_CliXSal" Visible="False" />
                                                <asp:BoundField DataField="Monto" HeaderText="Monto" SortExpression="Monto" />
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre del Extra" SortExpression="Nombre" />
                                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
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
                                            <tr style="border:none">
                                                <td style="border:none"><h4>PAGOS:</h4></td>
                                                <td style="border:none">
                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Pagos" DataSourceID="SqlDataSource4" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ID_Pagos" HeaderText="ID_Pagos" InsertVisible="False" ReadOnly="True" SortExpression="ID_Pagos" Visible="False" />
                                                <asp:BoundField DataField="ID_CliXSal" HeaderText="ID_CliXSal" SortExpression="ID_CliXSal" Visible="False" />
                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                                <asp:BoundField DataField="Monto" HeaderText="Monto " SortExpression="Monto" />
                                                <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" SortExpression="Observaciones" />
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
                                            <tr style="border:none">
                                                <td style="border:none"><h4>MONTO TOTAL DE LA SALIDA:</h4></td>
                                                <td style="border:none">
                                        <asp:Label ID="Label_txt" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="border:none">
                                                <td style="border:none"><h4>PRECIO DE LA SALIDA:</h4></td>
                                                <td style="border:none"><asp:Label ID="Label5_txt" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr style="border:none">
                                                <td style="border:none"><h4>MONTO TOTAL DE EXTRAS:</h4></td>
                                                <td style="border:none"><asp:Label ID="Label2_txt" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr style="border:none">
                                                <td style="border:none"><h4>MONTO PAGADO:</h4></td>
                                                <td style="border:none"><asp:Label ID="Label3_txt" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr style="border:none">
                                                <td style="border:none"><h4>SALDO RESTANTE:</h4></td>
                                                <td style="border:none"><asp:Label ID="Label4_txt" runat="server"></asp:Label></td>
                                            </tr>
                                            </table>
                                        </div>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [Salidas] WHERE [ID_Salida] = @ID_Salida" InsertCommand="INSERT INTO [Salidas] ([ID_Programa], [Fecha], [Cant_Confirmados], [PrecioDeSalida]) VALUES (@ID_Programa, @Fecha, @Cant_Confirmados, @PrecioDeSalida)" SelectCommand="SELECT Salidas.ID_Salida, Salidas.Fecha, Salidas.Cant_Confirmados, Salidas.PrecioDeSalida, Programas.Nombre FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa" UpdateCommand="UPDATE [Salidas] SET [ID_Programa] = @ID_Programa, [Fecha] = @Fecha, [Cant_Confirmados] = @Cant_Confirmados, [PrecioDeSalida] = @PrecioDeSalida WHERE [ID_Salida] = @ID_Salida">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID_Salida" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ID_Programa" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="Fecha" />
                                                <asp:Parameter Name="Cant_Confirmados" Type="Int32" />
                                                <asp:Parameter Name="PrecioDeSalida" Type="Double" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ID_Programa" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="Fecha" />
                                                <asp:Parameter Name="Cant_Confirmados" Type="Int32" />
                                                <asp:Parameter Name="PrecioDeSalida" Type="Double" />
                                                <asp:Parameter Name="ID_Salida" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [Cliente] WHERE [ID_Cliente] = @ID_Cliente" InsertCommand="INSERT INTO [Cliente] ([Nombre], [Apellido], [Tipo_Documento], [Numero_Documento], [Fecha_Nacimiento], [Sexo], [Domicilio], [Localidad], [Provincia], [Pais], [Email], [Telefono], [Origen_Consulta], [Ficha_Medica]) VALUES (@Nombre, @Apellido, @Tipo_Documento, @Numero_Documento, @Fecha_Nacimiento, @Sexo, @Domicilio, @Localidad, @Provincia, @Pais, @Email, @Telefono, @Origen_Consulta, @Ficha_Medica)" SelectCommand="SELECT Cliente.Nombre + ' ' + Cliente.Apellido AS Nombre, ClienteXSalida.Monto, Tipo_Documento.Tipo + ' ' + Cliente.Numero_Documento AS Documento, Origen.OrigenDeConsulta, Provincias.Provincia, Genero.Genero, Cliente.Ficha_Medica, ClienteXSalida.ID_CliXSal, ClienteXSalida.Fecha FROM ClienteXSalida INNER JOIN Cliente ON ClienteXSalida.ID_Cliente = Cliente.ID_Cliente INNER JOIN Genero ON Cliente.Sexo = Genero.ID_Sexo INNER JOIN Provincias ON Cliente.Provincia = Provincias.ID_Provincia INNER JOIN Tipo_Documento ON Cliente.Tipo_Documento = Tipo_Documento.ID_TipoDoc INNER JOIN Origen ON Cliente.Origen_Consulta = Origen.ID_Origen WHERE (ClienteXSalida.ID_Salida = @ID)" UpdateCommand="UPDATE [Cliente] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Tipo_Documento] = @Tipo_Documento, [Numero_Documento] = @Numero_Documento, [Fecha_Nacimiento] = @Fecha_Nacimiento, [Sexo] = @Sexo, [Domicilio] = @Domicilio, [Localidad] = @Localidad, [Provincia] = @Provincia, [Pais] = @Pais, [Email] = @Email, [Telefono] = @Telefono, [Origen_Consulta] = @Origen_Consulta, [Ficha_Medica] = @Ficha_Medica WHERE [ID_Cliente] = @ID_Cliente">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID_Cliente" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Nombre" Type="String" />
                                                <asp:Parameter Name="Apellido" Type="String" />
                                                <asp:Parameter Name="Tipo_Documento" Type="Int32" />
                                                <asp:Parameter Name="Numero_Documento" Type="String" />
                                                <asp:Parameter Name="Fecha_Nacimiento" Type="DateTime" />
                                                <asp:Parameter Name="Sexo" Type="Int32" />
                                                <asp:Parameter Name="Domicilio" Type="String" />
                                                <asp:Parameter Name="Localidad" Type="Int32" />
                                                <asp:Parameter Name="Provincia" Type="Int32" />
                                                <asp:Parameter Name="Pais" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Telefono" Type="String" />
                                                <asp:Parameter Name="Origen_Consulta" Type="Int32" />
                                                <asp:Parameter Name="Ficha_Medica" Type="Boolean" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Nombre" Type="String" />
                                                <asp:Parameter Name="Apellido" Type="String" />
                                                <asp:Parameter Name="Tipo_Documento" Type="Int32" />
                                                <asp:Parameter Name="Numero_Documento" Type="String" />
                                                <asp:Parameter Name="Fecha_Nacimiento" Type="DateTime" />
                                                <asp:Parameter Name="Sexo" Type="Int32" />
                                                <asp:Parameter Name="Domicilio" Type="String" />
                                                <asp:Parameter Name="Localidad" Type="Int32" />
                                                <asp:Parameter Name="Provincia" Type="Int32" />
                                                <asp:Parameter Name="Pais" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Telefono" Type="String" />
                                                <asp:Parameter Name="Origen_Consulta" Type="Int32" />
                                                <asp:Parameter Name="Ficha_Medica" Type="Boolean" />
                                                <asp:Parameter Name="ID_Cliente" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [ExtraXClienteXSalida] WHERE [ID_ExtXCliXSal] = @ID_ExtXCliXSal" InsertCommand="INSERT INTO [ExtraXClienteXSalida] ([ID_CliXSal], [ID_Extra]) VALUES (@ID_CliXSal, @ID_Extra)" SelectCommand="SELECT ExtraXClienteXSalida.ID_ExtXCliXSal, ExtraXClienteXSalida.ID_CliXSal, ExtraXClienteXSalida.Monto, Extras.Nombre, ExtraXClienteXSalida.Cantidad FROM ExtraXClienteXSalida INNER JOIN Extras ON ExtraXClienteXSalida.ID_Extra = Extras.ID_Extra WHERE (ExtraXClienteXSalida.ID_CliXSal = @ID)" UpdateCommand="UPDATE [ExtraXClienteXSalida] SET [ID_CliXSal] = @ID_CliXSal, [ID_Extra] = @ID_Extra WHERE [ID_ExtXCliXSal] = @ID_ExtXCliXSal">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID_ExtXCliXSal" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ID_CliXSal" Type="Int32" />
                                                <asp:Parameter Name="ID_Extra" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView2" Name="ID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ID_CliXSal" Type="Int32" />
                                                <asp:Parameter Name="ID_Extra" Type="Int32" />
                                                <asp:Parameter Name="ID_ExtXCliXSal" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [PagosXSalidasXCliente] WHERE [ID_Pagos] = @ID_Pagos" InsertCommand="INSERT INTO [PagosXSalidasXCliente] ([ID_Cliente], [ID_Salida], [Fecha], [Monto], [Observaciones]) VALUES (@ID_Cliente, @ID_Salida, @Fecha, @Monto, @Observaciones)" SelectCommand="SELECT ID_Pagos, ID_CliXSal, Fecha, Monto, Observaciones FROM PagosXSalidasXCliente WHERE (ID_CliXSal = @ID)" UpdateCommand="UPDATE [PagosXSalidasXCliente] SET [ID_Cliente] = @ID_Cliente, [ID_Salida] = @ID_Salida, [Fecha] = @Fecha, [Monto] = @Monto, [Observaciones] = @Observaciones WHERE [ID_Pagos] = @ID_Pagos">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID_Pagos" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ID_Cliente" Type="Int32" />
                                                <asp:Parameter Name="ID_Salida" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="Fecha" />
                                                <asp:Parameter Name="Monto" Type="Int32" />
                                                <asp:Parameter Name="Observaciones" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView2" Name="ID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ID_Cliente" Type="Int32" />
                                                <asp:Parameter Name="ID_Salida" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="Fecha" />
                                                <asp:Parameter Name="Monto" Type="Int32" />
                                                <asp:Parameter Name="Observaciones" Type="String" />
                                                <asp:Parameter Name="ID_Pagos" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                        
                                        
                                    </div>
                                </div>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>