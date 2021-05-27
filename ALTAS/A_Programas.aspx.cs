using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.ALTAS
{
    public partial class A_Programas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_APRG_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A_Programa = new GestionDB();
            bool runner = A_Programa.Alta_Programa(TxBx_APRG_Nombre.Text, TxBX_APRG_Descripcion.Text, TxBX_APRG_Cupo_Min.Text, TxBx_APRG_Cupo_Max.Text, TxBx_APRG_PrcioxPersona.Text);
            if (runner)
            {
                int ID_Programa = A_Programa.ObtenerUltimoPrograma();
                foreach (ListItem Item in CBX_APRG_Preferencia.Items)
                {
                    if (Item.Selected)
                    {
                        string ID_Preferencia = Item.Value;
                        A_Programa.CargarProgXPref(ID_Programa.ToString(), ID_Preferencia);
                    }
                }
                Lb_APROG_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_APROG_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}