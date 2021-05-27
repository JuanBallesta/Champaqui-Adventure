using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Preferencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CPREF_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT * FROM [Preferencias] WHERE(Nombre LIKE '%" + TxBx_CPREF_Consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Preferencia = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Preferencia.aspx?ID_Preferencia=" + ID_Preferencia);
        }
    }
}