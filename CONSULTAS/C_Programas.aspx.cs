using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Programas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CPROG_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT [ID_Programa], [Nombre], [Descripcion], [Cupo_Min]AS 'Cupo minimo', [Cupo_Max]AS 'Cupo maximo', [PrecioDelPrograma]AS 'Precio' FROM [Programas] WHERE( Nombre LIKE '%" + TxBx_CPROG_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Programa = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Programa.aspx?ID_Programa=" + ID_Programa);
        }
    }
}