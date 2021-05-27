using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Guias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_AGUI_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Guias = new GestionDB();
            bool runner = A_Guias.Alta_Guias(DPL_AGUI_Tipo_Doc.SelectedValue, TxBx_AGUI_Nro_doc.Text, TxBx_AGUI_Nombre.Text, TxBx_AGUI_Apellido.Text, TxBx_AGUI_Telefono.Text, TxBx_AGUI_Email.Text, DPL_AGUI_Sexo.SelectedValue);
            if (runner)
            {
                Lb_AGUI_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_AGUI_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}