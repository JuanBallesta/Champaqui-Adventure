using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Salidas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Bt_ASAL_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Salidas = new GestionDB();
            bool runner = A_Salidas.Alta_Salidas(DPL_ASAL_Programa.SelectedValue, Date_ASAL_Fecha.Text, TxBx_ASAL_Cant_Conf.Text, TxBx_ASAL_PrecioxPersona.Text);
            if (runner)
            {
                Lb_ASAL_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_ASAL_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}