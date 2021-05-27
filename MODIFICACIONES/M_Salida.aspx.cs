using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Salida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB M_salida = new GestionDB();
                string ID_Salida = Request.QueryString["ID_Salida"];
                DataTable DT_MSAL_Datos = M_salida.BuscarDatosSalida(ID_Salida);
                DPL_MSAL_Programa.SelectedValue = DT_MSAL_Datos.Rows[0]["ID_Programa"].ToString();
                Date_MSAL_Fecha.Text = DT_MSAL_Datos.Rows[0]["Fecha"].ToString();
                TxBx_MSAL_Cant_Conf.Text = DT_MSAL_Datos.Rows[0]["Confirmados"].ToString();
                TxBx_MSAL_PrecioxPersona.Text = DT_MSAL_Datos.Rows[0]["Precio"].ToString();

            }
        }

        protected void Bt_MSAL_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_salida = new GestionDB();
            string ID_Salida = Request.QueryString["ID_salida"];
            bool runner = M_salida.ModificarSalida(ID_Salida, Date_MSAL_Fecha.Text, TxBx_MSAL_Cant_Conf.Text, TxBx_MSAL_PrecioxPersona.Text);
            if (runner)
            {
                Lb_MSAL_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MSAL_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}