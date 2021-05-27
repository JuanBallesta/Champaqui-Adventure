using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Origen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_AORG_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Origen = new GestionDB();
            bool runner = A_Origen.Alta_Origen(TxBx_AORG_Descripcion.Text);
            if (runner)
            {
                Lb_AORG_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_AORG_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}