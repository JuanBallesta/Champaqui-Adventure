using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Preferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_APREF_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Preferencias = new GestionDB();
            bool runner = A_Preferencias.Alta_Preferencia(TxBx_APREF_Nombre.Text);
            if (runner)
            {
                Lb_APREF_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_APREF_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}