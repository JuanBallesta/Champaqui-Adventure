using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Guias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CGUI_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT Guias.ID_Guia, Guias.Nombre, Guias.Apellido, Tipo_Documento.Descripcion AS 'Tipo de documento', Guias.Numero_Documento AS Documento, Genero.Genero, Guias.Telefono, Guias.Email FROM Guias INNER JOIN Genero ON Guias.Sexo = Genero.ID_Sexo INNER JOIN Tipo_Documento ON Guias.Tipo_Documento = Tipo_Documento.ID_TipoDoc WHERE(Guias.Nombre LIKE '%" + TxBx_CGUI_Consulta.Text + "%') OR(Guias.Apellido LIKE '%" + TxBx_CGUI_Consulta.Text + "%') OR(Guias.Numero_Documento LIKE '%" + TxBx_CGUI_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Guia = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Guia.aspx?ID_Guia=" + ID_Guia);
        }
    }
}