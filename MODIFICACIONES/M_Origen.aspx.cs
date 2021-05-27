using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Origen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB MOrigen = new GestionDB();
                string ID_Origen = Request.QueryString["ID_Origen"];
                DataTable Tb_MORG = MOrigen.BuscarDatosOrigen(ID_Origen);
                TxBx_MORG_Descripcion.Text = Tb_MORG.Rows[0]["OrigenDeConsulta"].ToString();
            }
        }

        protected void Bt_MORG_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_Origen = new GestionDB();
            string M_ID_Origen = Request.QueryString["ID_Origen"];
            bool runner = M_Origen.Modificar_Origen(M_ID_Origen,TxBx_MORG_Descripcion.Text);
            if (runner)
            {
                Lb_MORG_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MORG_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}