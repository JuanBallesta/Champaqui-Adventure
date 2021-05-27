using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Extras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_AEX_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Extra = new GestionDB();
            bool runner = A_Extra.Alta_Extras(TxBx_AEX_Nombre.Text, TxBX_AEX_Descripcion.Text, TxBx_AEX_Monto.Text);
            if (runner)
            {
                Lb_AEXT_ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_AEXT_ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}