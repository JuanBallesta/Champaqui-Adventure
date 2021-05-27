using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Preferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB M_Preferencia = new GestionDB();
                string ID_Preferencia = Request.QueryString["ID_Preferencia"];
                DataTable DT_MPREF_Datos = M_Preferencia.BuscarDatosPreferencia(ID_Preferencia);
                TxBx_MPREF_Nombre.Text = DT_MPREF_Datos.Rows[0]["Nombre"].ToString();
            }
        }

        protected void Bt_MPREF_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_Preferencia = new GestionDB();
            string ID_Preferencia = Request.QueryString["ID_Preferencia"];
            bool runner = M_Preferencia.ModificarPreferencia(ID_Preferencia, TxBx_MPREF_Nombre.Text);
            if (runner)
            {
                Lb_MPREF_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MPREF_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}