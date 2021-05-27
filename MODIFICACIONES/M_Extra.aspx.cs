using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Extra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB M_Extra = new GestionDB();
                string ID_Extra = Request.QueryString["ID_Extra"];
                DataTable DT_MEXT_Datos = M_Extra.BuscarDatosExtra(ID_Extra);
                TxBx_MEXT_Nombre.Text = DT_MEXT_Datos.Rows[0]["Nombre"].ToString();
                TxBX_MEXT_Descripcion.Text = DT_MEXT_Datos.Rows[0]["Descripcion"].ToString();
                TxBx_MEXT_Monto.Text = DT_MEXT_Datos.Rows[0]["Monto"].ToString();
            }
        }

        protected void Bt_MEXT_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_Extra = new GestionDB();
            string ID_Extra = Request.QueryString["ID_Extra"];
            bool Runner = M_Extra.Modificar_Extra(ID_Extra, TxBx_MEXT_Nombre.Text, TxBX_MEXT_Descripcion.Text, TxBx_MEXT_Monto.Text);
            if (Runner)
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