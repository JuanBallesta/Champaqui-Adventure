<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Cliente.aspx.cs" Inherits="ChampaquiAdventure_v3.ALTAS.A_Cliente" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Cargar Cliente</title>
    <meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="style.css" media="screen">
    <link rel="stylesheet" href="style.responsive.css" media="all">

    <script src="jquery.js"></script>
    <script src="script.js"></script>
    <script src="script.responsive.js"></script>
    <script>
        function Monstrar_Datos_nacionales() {
            if (document.getElementById('ChBx_ACLI_Nac').checked) {
                document.getElementById('Pais').style.display = 'none';
                document.getElementById('Provincia').style.display = 'block';
                document.getElementById('Localidad').style.display = 'block';
                document.getElementById('Domicilio').style.display = 'block';
                document.getElementById('TxBx_ACLI_Pais').value = 'Argentina';
                document.getElementById('TxBx_ACLI_Domicilio').value = '';
                $("#DPL_ACLI_Provincia option[value='25']").hide();
            } else {
                document.getElementById('Pais').style.display = 'block';
                document.getElementById('Provincia').style.display = 'none';
                document.getElementById('Localidad').style.display = 'none';
                document.getElementById('Domicilio').style.display = 'none';
                document.getElementById('TxBx_ACLI_Pais').value = '';
                document.getElementById('DPL_ACLI_Provincia').value = 25;
                document.getElementById('DPL_ACLI_Localidad').value = 2383;
                document.getElementById('TxBx_ACLI_Domicilio').value = 'Ninguna';
                $("#DPL_ACLI_Provincia option[value='25']").hide();
            }
        }
    </script>


<style>.art-content .art-postcontent-0 .layout-item-old-0 {  border-collapse: separate;  }
.art-content .art-postcontent-0 .layout-item-old-1 { color: #B2B2B2; background: #D78C09; padding: 0px;  }
.art-content .art-postcontent-0 .layout-item-old-2 { padding: 15px;  }
.art-content .art-postcontent-0 .layout-item-old-3 { color: #B2B2B2; background: #1C3F5A; padding: 15px;  }
.ie7 .art-post .art-layout-cell {border:none !important; padding:0 !important; }
.ie6 .art-post .art-layout-cell {border:none !important; padding:0 !important; }

    .auto-style1 {
        width: 117%;
    }

    .auto-style2 {
        width: 117%;
    }

    .auto-style5 {
        width: 200px;
    }

</style></head>
<body onload="Monstrar_Datos_nacionales()">
<div id="art-main">
<header class="art-header">
    <div class="art-shapes">    
            </div>

<h1 class="art-headline">
    <a href="/">Champaqui</a>
</h1>
<h2 class="art-slogan">adventure</h2>
<nav class="art-nav">
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">↓ Cargar Cliente ↓</a><ul><li><a><strike>Cliente</strike></a></li><li><a href="../ALTAS/A_Extras.aspx">Extra</a></li><li><a href="../ALTAS/A_Guias.aspx">Guia</a></li><li><a href="../ALTAS/A_Origen.aspx">Origen</a></li><li><a href="../ALTAS/A_Preferencia.aspx">Preferencia</a></li><li><a href="../ALTAS/A_Programas.aspx">Programa</a></li><li><a href="../ALTAS/A_Salidas.aspx">Salida</a></li></ul></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div style="width: 452px;">
                                    <table class="auto-style1">
                                            <tr style="border:none">
                                                <td class="auto-style5" style="border:none">
                                                    <h4>NOMBRE:</h4>
                                                </td>
                                                <td  style="border:none">
                                            <asp:TextBox ID="TxBx_ACLI_Nombre" runat="server" MaxLength="50"></asp:TextBox>
                                        </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>APELLIDO:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:TextBox ID="TxBx_ACLI_Apellido" runat="server" MaxLength="50"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>DOCUMENTO:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:DropDownList ID="DPL_ACLI_Tipo_Doc" runat="server" DataSourceID="SqlDataSource1" DataTextField="Tipo" DataValueField="ID_TipoDoc" BackColor="#FFF5E1" Height="30px">
                                                    </asp:DropDownList>
                                                    &nbsp;<asp:TextBox ID="TxBx_ACLI_Nro_Doc" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>FECHA DE NACIENTO:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:TextBox ID="Date_ACLI_Fecha_Nac" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>GENERO:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:DropDownList ID="DPL_ACLI_Sexo" runat="server" DataSourceID="SqlDataSource2" DataTextField="Genero" DataValueField="ID_Sexo" BackColor="#FFF5E1" Height="30px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>ARGENTINO?</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:CheckBox class="art-checkbox" ID="ChBx_ACLI_Nac" runat="server" onclick="Monstrar_Datos_nacionales()" />
                                                </td>
                                            </tr>
                                        </table>
                                    <div id="Pais">
                                            <table class="auto-style2">
                                                <tr style="border:none">
                                                    <td class="auto-style5" style="border:none"> <h4>PAIS:</h4></td>
                                                    <td style="border:none"><asp:TextBox ID="TxBx_ACLI_Pais" runat="server" MaxLength="30"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                    <div id="Provincia">
                                            <table class="auto-style2">
                                                <tr style="border:none">
                                                    <td class="auto-style5" style="border:none"> <h4>PROVINCIA:</h4></td>
                                                    <td style="border:none"><asp:DropDownList ID="DPL_ACLI_Provincia" runat="server" DataSourceID="SqlDataSource3" DataTextField="Provincia" DataValueField="ID_Provincia" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DPL_ACLI_Provincia_SelectedIndexChanged" BackColor="#FFF5E1" Height="30px">
                                                            <asp:ListItem Value="0">Provincia</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    <div id="Localidad">
                                            <table class="auto-style2">
                                                <tr style="border:none">
                                                    <td class="auto-style5" style="border:none"> <h4>LOCALIDAD:</h4></td>
                                                    <td style="border:none"><asp:DropDownList ID="DPL_ACLI_Localidad" runat="server" DataSourceID="SqlDataSource4" DataTextField="Localidad" DataValueField="ID_Localidad" AppendDataBoundItems="True" BackColor="#FFF5E1" Height="30px">
                                                            <asp:ListItem Value="0">Localidad</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    <div id="Domicilio">
                                            <table class="auto-style2">
                                                <tr style="border:none">
                                                    <td class="auto-style5" style="border:none"> <h4>DOMICILIO:</h4></td>
                                                    <td style="border:none"><asp:TextBox ID="TxBx_ACLI_Domicilio" runat="server" MaxLength="50"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </div>
                                    <table class="auto-style2">
                                            <tr style="border:none">
                                                <td class="auto-style5" style="border:none">
                                                    <h4>EMAIL:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:TextBox ID="TxBx_ACLI_Email" runat="server" MaxLength="50"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>TELEFONO:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:TextBox ID="TxBx_ACLI_Telefono" runat="server" MaxLength="50"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>FICHA MEDICA?</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:CheckBox class="art-checkbox" ID="ChBx_ACLI_Ficha_Med" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">
                                                    <h4>ORIGEN:</h4>
                                                </td>
                                                <td style="border:none">
                                                    <asp:DropDownList ID="DPL_ACLI_Origen" runat="server" DataSourceID="SqlDataSource5" DataTextField="OrigenDeConsulta" DataValueField="ID_Origen" BackColor="#FFF5E1" Height="30px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style5" style="border:none">

                                                </td>
                                                <td style="border:none">
                                                    <asp:Button class="art-button" ID="Bt_ACLI_Guardar" runat="server" Text="Guardar" OnClick="Bt_ACLI_Guardar_Click" />
                                                    <asp:Label ID="Lb_ACLI_Ready" runat="server"><h4></h4></asp:Label>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                    <br />
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Tipo_Documento]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Genero]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Provincias]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Localidades] WHERE ([ID_Provincia] = @ID_Provincia)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DPL_ACLI_Provincia" Name="ID_Provincia" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" SelectCommand="SELECT * FROM [Origen]"></asp:SqlDataSource>
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body></html>