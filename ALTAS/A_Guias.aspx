<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Guias.aspx.cs" Inherits="ChampaquiAdventure_v3.ALTAS.A_Guias" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Cargar Guia</title>
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
        .auto-style2 {
            width: 130px;
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Cargar Guia ↓</a><ul><li><a href="../ALTAS/A_Cliente.aspx">Cliente</a></li><li><a href="../ALTAS/A_Extras.aspx">Extra</a></li><li><a><strike>Guia</strike></a></li><li><a href="../ALTAS/A_Origen.aspx">Origen</a></li><li><a href="../ALTAS/A_Preferencia.aspx">Preferencia</a></li><li><a href="../ALTAS/A_Programas.aspx">Programa</a></li><li><a href="../ALTAS/A_Salidas.aspx">Salida</a></li></ul></li></ul> 
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
                                            <td class="auto-style2" style="border:none">
                                                <h4>NOMBRE:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_AGUI_Nombre" runat="server" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>APELLIDO:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_AGUI_Apellido" runat="server" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>DOCUMENTO:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:DropDownList ID="DPL_AGUI_Tipo_Doc" runat="server" DataSourceID="SqlDataSource1" DataTextField="Tipo" DataValueField="ID_TipoDoc" BackColor="#FFF5E1" Height="30px"></asp:DropDownList>
                                                &nbsp;<asp:TextBox ID="TxBx_AGUI_Nro_doc" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>GENERO:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:DropDownList ID="DPL_AGUI_Sexo" runat="server" DataSourceID="SqlDataSource2" DataTextField="Genero" DataValueField="ID_Sexo" BackColor="#FFF5E1" Height="30px"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>EMAIL:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_AGUI_Email" runat="server" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>TELEFONO:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_AGUI_Telefono" runat="server" MaxLength="50"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none"></td>
                                            <td  style="border:none">
                                                <asp:Button class="art-button" ID="Bt_AGUI_Guardar" runat="server" Text="Guardar" OnClick="Bt_AGUI_Guardar_Click" />
                                                <asp:Label ID="Lb_AGUI_Ready" runat="server"><h4></h4></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Tipo_Documento]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Genero]"></asp:SqlDataSource>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>