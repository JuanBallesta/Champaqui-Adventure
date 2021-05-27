using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            info.Visible = false;
        }

        protected void Bt_CCLI_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT [ID_Cliente], [Nombre], [Apellido], [Numero_Documento] AS Documento, [Fecha_Nacimiento] AS 'Fecha de nacimiento', [Pais], [Email], [Telefono] FROM [Cliente]WHERE(Cliente.Numero_Documento LIKE '%" + TxBx_CCLI_Consulta.Text + "%') OR(Cliente.Nombre LIKE '%" + TxBx_CCLI_Consulta.Text + "%') OR(Cliente.Apellido LIKE '%" + TxBx_CCLI_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SQL2 = "SELECT Genero.Genero, Provincias.Provincia, Localidades.Localidad, Cliente.Domicilio, Origen.OrigenDeConsulta AS Origen, Cliente.Ficha_Medica AS 'Ficha Medica?', Tipo_Documento.Descripcion AS 'Tipo de documento', Cliente.ID_Cliente FROM Cliente INNER JOIN Genero ON Cliente.Sexo = Genero.ID_Sexo INNER JOIN Localidades ON Cliente.Localidad = Localidades.ID_Localidad INNER JOIN Origen ON Cliente.Origen_Consulta = Origen.ID_Origen INNER JOIN Provincias ON Cliente.Provincia = Provincias.ID_Provincia AND Localidades.ID_Provincia = Provincias.ID_Provincia INNER JOIN Tipo_Documento ON Cliente.Tipo_Documento = Tipo_Documento.ID_TipoDoc WHERE(ID_Cliente =" + GridView1.SelectedValue + ")";
            SqlDataSource2.SelectCommand = SQL2;
            SqlDataSource2.DataBind();
            info.Visible = true;
        }
    }
}