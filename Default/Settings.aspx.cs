using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.Default
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_SET_Email_Click(object sender, EventArgs e)
        {
            GestionDB S_Email = new GestionDB();
            bool runner = S_Email.Settings_Emails(TxBx_SET_Email.Text, TxBX_SET_Pass.Text);
            if (runner)
            {
                Lb_SET_Email.Text = "<h4>Guardado!</h4>";
            }
            else
            {
                Lb_SET_Email.Text = "<h4>Falla!</h4>";
            }
        }

        protected void Bt_SET_CEMAIL_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT * FROM [Emails] WHERE(Email LIKE '%" + TxBx_SET_CEMAIL.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
        }
    }
}