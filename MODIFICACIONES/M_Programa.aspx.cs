using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Programa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB M_program = new GestionDB();
                string ID_Programa = Request.QueryString["ID_Programa"];
                DataTable DT_MPRG_Datos = M_program.BuscarDatosPrograma(ID_Programa);
                TxBx_MPRG_Nombre.Text = DT_MPRG_Datos.Rows[0]["Nombre"].ToString();
                TxBX_MPRG_Descripcion.Text = DT_MPRG_Datos.Rows[0]["Descripcion"].ToString();
                TxBX_MPRG_Cupo_Min.Text = DT_MPRG_Datos.Rows[0]["Cupo_Min"].ToString();
                TxBx_MPRG_Cupo_Max.Text = DT_MPRG_Datos.Rows[0]["Cupo_Max"].ToString();
                TxBx_MPRG_PrcioxPersona.Text = DT_MPRG_Datos.Rows[0]["PrecioDelPrograma"].ToString();
                string[] IDs_Preferenica = M_program.ObtenerIDsPrefXProgr(ID_Programa);
                MarcarCxBxSeleccionado(IDs_Preferenica);
            }
        }
        private void MarcarCxBxSeleccionado(string[] IDs)
        {
            if (IDs != null)
            {
                CBX_MPRG_Preferencia.DataBind();
                foreach (ListItem item in CBX_MPRG_Preferencia.Items)
                {
                    item.Selected = IDs.Contains(item.Value);
                }
            }
        }

        protected void Bt_MPRG_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_program = new GestionDB();
            string ID_Programa = Request.QueryString["ID_Programa"];
            bool runner = M_program.ModificarPrograma(ID_Programa, TxBx_MPRG_Nombre.Text, TxBX_MPRG_Descripcion.Text, TxBX_MPRG_Cupo_Min.Text, TxBx_MPRG_Cupo_Max.Text, TxBx_MPRG_PrcioxPersona.Text);
            if(runner)
            {
                M_program.EliminarRegistroDePreferencias(ID_Programa);
                foreach (ListItem Item in CBX_MPRG_Preferencia.Items)
                {
                    if (Item.Selected)
                    {
                        string ID_Preferencia = Item.Value;
                        M_program.CargarProgXPref(ID_Programa, ID_Preferencia);
                    }
                }
                Lb_MPRG_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MPRG_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}