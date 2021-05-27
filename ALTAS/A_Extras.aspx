<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Extras.aspx.cs" Inherits="ChampaquiAdventure_v3.ALTAS.A_Extras" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Cargar Extra</title>
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
            width: 140px;
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Cargar Extra ↓</a><ul><li><a href="../ALTAS/A_Cliente.aspx">Cliente</a></li><li><a><strike>Extra</strike></a></li><li><a href="../ALTAS/A_Guias.aspx">Guia</a></li><li><a href="../ALTAS/A_Origen.aspx">Origen</a></li><li><a href="../ALTAS/A_Preferencia.aspx">Preferencia</a></li><li><a href="../ALTAS/A_Programas.aspx">Programa</a></li><li><a href="../ALTAS/A_Salidas.aspx">Salida</a></li></ul></li></ul> 
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
                                                <asp:TextBox ID="TxBx_AEX_Nombre" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>DESCRIPCION:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBX_AEX_Descripcion" runat="server" MaxLength="150"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>PRECIO:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_AEX_Monto" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">&nbsp;</td>
                                            <td  style="border:none">
                                                <asp:Button class="art-button" ID="Bt_AEX_Guardar" runat="server" Text="Guardar" OnClick="Bt_AEX_Guardar_Click" />
                                                <asp:Label ID="Lb_AEXT_ready" runat="server"><h4></h4></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>