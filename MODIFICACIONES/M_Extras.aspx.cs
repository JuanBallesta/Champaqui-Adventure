using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Extras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB MExtra = new GestionDB();
                string ID_Extra = Request.QueryString["ID_Extra"];
                DataTable Tb_MEXT = MExtra.Buscar_Extras(ID_Extra);
                TxBx_MEXT_Nombre.Text = Tb_MEXT.Rows[0]["Nombre"].ToString();
                TxBX_MEXT_Descripcion.Text = Tb_MEXT.Rows[0]["Descripcion"].ToString();
                TxBx_MEXT_Monto.Text = Tb_MEXT.Rows[0]["Monto"].ToString();
            }
        }

        protected void Bt_MEXT_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_Extra = new GestionDB();
            string M_ID_Extra = Request.QueryString["ID_Extra"];
            bool runner = M_Extra.Modificar_Extra(M_ID_Extra,TxBx_MEXT_Nombre.Text, TxBX_MEXT_Descripcion.Text, TxBx_MEXT_Monto.Text);
            if (runner)
            {
                Lb_MEXT_ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MEXT_ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}