<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Preferencia.aspx.cs" Inherits="ChampaquiAdventure_v3.ALTAS.A_Preferencia" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Cargar Preferencia</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Cargar Preferencia ↓</a><ul><li><a href="../ALTAS/A_Cliente.aspx">Cliente</a></li><li><a href="../ALTAS/A_Extras.aspx">Extra</a></li><li><a href="../ALTAS/A_Guias.aspx">Guia</a></li><li><a href="../ALTAS/A_Origen.aspx">Origen</a></li><li><a><strike>Preferencia</strike></a></li><li><a href="../ALTAS/A_Programas.aspx">Programa</a></li><li><a href="../ALTAS/A_Salidas.aspx">Salida</a></li></ul></li></ul> 
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
                                                <h4>PREFERENCIA:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_APREF_Nombre" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none"></td>
                                            <td  style="border:none">
                                                <asp:Button class="art-button" ID="Bt_APREF_Guardar" runat="server" Text="Guardar" OnClick="Bt_APREF_Guardar_Click" />
                                                <asp:Label ID="Lb_APREF_Ready" runat="server"><h4></h4></asp:Label>
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