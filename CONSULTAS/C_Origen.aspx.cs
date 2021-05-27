using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Origen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CORG_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT [ID_Origen], [OrigenDeConsulta] AS Origen FROM [Origen] WHERE(OrigenDeConsulta LIKE '%" + TxBx_CORG_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Origen = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Origen.aspx?ID_Origen=" + ID_Origen);
        }
    }
}