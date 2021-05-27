<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="ChampaquiAdventure_v3.Default.Settings" %>

<!DOCTYPE html>
<html dir="ltr" lang="en-US"><head>
    <meta charset="utf-8">
    <title>Configuraciones</title>
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
    <ul class="art-hmenu"><li><a href="../Default/index.aspx" class="">Inicio</a></li><li><a class="active">Configuraciones</a></li></ul> 
    </nav>               
</header>
<div class="art-sheet clearfix">
            <div class="art-layout-wrapper">
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-content"><article class="art-post art-article">
                            <form id="form1" runat="server">
                                <div align="left">
                                    <h2>EMAILS:</h2>
                                    <table class="auto-style1">
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>EMAIL:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBx_SET_Email" runat="server" Placeholder="Email"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">
                                                <h4>CONTRASEÑA:</h4>
                                            </td>
                                            <td  style="border:none">
                                                <asp:TextBox ID="TxBX_SET_Pass" runat="server" placeholder="Password"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td class="auto-style2" style="border:none">&nbsp;</td>
                                            <td  style="border:none">
                                                <asp:Button class="art-button" ID="Bt_SET_Email" runat="server" Text="Guardar" OnClick="Bt_SET_Email_Click"/>
                                                <asp:Label ID="Lb_SET_Email" runat="server"><h4></h4></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="border:none">
                                            <td style="border:none">
                                                <h4>INFO</h4>
                                            </td>
                                            <td style="border:none">
                                                <asp:TextBox ID="TxBx_SET_CEMAIL" runat="server"></asp:TextBox>
                                                <asp:Button class="art-button" ID="Bt_SET_CEMAIL" runat="server" Text="Buscar" placeholder="Email" OnClick="Bt_SET_CEMAIL_Click" />
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_email" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." GridLines="None">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="ID_email" HeaderText="ID_email" ReadOnly="True" SortExpression="ID_email" Visible="False" />
                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                        <asp:BoundField DataField="Password" HeaderText="Contraseña" SortExpression="Password" />
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button id="Bt_SET_BEMAIL" class="art-button" Text="Borrar" CommandName="Delete" OnClientClick="return confirm('Eliminar?')" runat="server" />
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
                            </form>
</article></div>
                    </div>
                </div>
            </div>
    </div>
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChampaquiAdventureConnectionString1 %>" DeleteCommand="DELETE FROM [Emails] WHERE [ID_email] = @ID_email" InsertCommand="INSERT INTO [Emails] ([Email], [Password]) VALUES (@Email, @Password)" SelectCommand="SELECT * FROM [Emails]" UpdateCommand="UPDATE [Emails] SET [Email] = @Email, [Password] = @Password WHERE [ID_email] = @ID_email">
        <DeleteParameters>
            <asp:Parameter Name="ID_email" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="ID_email" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</body></html>