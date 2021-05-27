using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.CONSULTAS
{
    public partial class C_Extras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_CEXT_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT * FROM Extras WHERE(Descripcion LIKE '%" + TxBx_CEXT_consulta.Text + "%') OR(Nombre LIKE '%" + TxBx_CEXT_consulta.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Extra = GridView1.SelectedValue.ToString();
            Response.Redirect("../MODIFICACIONES/M_Extra.aspx?ID_Extra=" + ID_Extra);
        }
    }
}