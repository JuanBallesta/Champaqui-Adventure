using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Salidas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CSAL_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT Salidas.ID_Salida, Programas.Nombre AS Programa, Salidas.Fecha, Salidas.Cant_Confirmados AS 'Confirmados', Salidas.PrecioDeSalida AS Precio FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa WHERE(Programas.Nombre LIKE '%" + TxBx_CSAL_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Salida = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Salida.aspx?ID_Salida=" + ID_Salida);
        }
    }
}