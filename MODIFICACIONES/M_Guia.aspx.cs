using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_v3.MODIFICACIONES
{
    public partial class M_Guia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                GestionDB MGuia = new GestionDB();
                string ID_Guia = Request.QueryString["ID_Guia"];
                DataTable Tb_MGUI = MGuia.BuscarDatosGuia(ID_Guia);
                TxBx_MGUI_Email.Text = Tb_MGUI.Rows[0]["Email"].ToString();
                TxBx_MGUI_Nombre.Text = Tb_MGUI.Rows[0]["Nombre"].ToString();
                TxBx_MGUI_Nro_doc.Text = Tb_MGUI.Rows[0]["Numero_Documento"].ToString();
                TxBx_MGUI_Telefono.Text = Tb_MGUI.Rows[0]["Telefono"].ToString();
                TxBx_MGUI_Apellido.Text = Tb_MGUI.Rows[0]["Apellido"].ToString();
                DPL_MGUI_Sexo.SelectedValue = Tb_MGUI.Rows[0]["Sexo"].ToString();
                DPL_MGUI_Tipo_Doc.SelectedValue = Tb_MGUI.Rows[0]["Tipo_Documento"].ToString();
            }
        }

        protected void Bt_MGUI_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB M_Guias = new GestionDB();
            string M_ID_Guia = Request.QueryString["ID_Guia"];
            bool runner = M_Guias.Modificar_Guia(M_ID_Guia,DPL_MGUI_Tipo_Doc.SelectedValue, TxBx_MGUI_Nro_doc.Text, TxBx_MGUI_Nombre.Text, TxBx_MGUI_Apellido.Text, TxBx_MGUI_Telefono.Text, TxBx_MGUI_Email.Text, DPL_MGUI_Sexo.SelectedValue);
            if (runner)
            {
                Lb_MGUI_Ready.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_MGUI_Ready.Text = "<h4>Falla!</h4>";
            }
        }
    }
}