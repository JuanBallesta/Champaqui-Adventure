using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_ACLI_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Cliente = new GestionDB();
            bool runner = A_Cliente.Alta_Clientes(DPL_ACLI_Tipo_Doc.SelectedValue, TxBx_ACLI_Nro_Doc.Text, TxBx_ACLI_Nombre.Text, TxBx_ACLI_Apellido.Text, Date_ACLI_Fecha_Nac.Text, TxBx_ACLI_Domicilio.Text, DPL_ACLI_Localidad.SelectedValue, DPL_ACLI_Provincia.SelectedValue, TxBx_ACLI_Pais.Text, TxBx_ACLI_Email.Text, TxBx_ACLI_Telefono.Text, DPL_ACLI_Origen.SelectedValue, DPL_ACLI_Sexo.SelectedValue, ChBx_ACLI_Ficha_Med.Checked.ToString());
            if (runner)
            {
                Lb_ACLI_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_ACLI_Ready.Text = "<h4>Falla!</h4>";
            }
        }

        protected void DPL_ACLI_Provincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DPL_ACLI_Localidad.Items.Clear();
            DPL_ACLI_Localidad.DataBind();
        }
    }
}