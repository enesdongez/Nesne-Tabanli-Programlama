using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DemirbasGenel genel = new DemirbasGenel();
        genel.personelekle(txtad, txtsoyad, txtemail, txtsifre, dp, grid, datasource);
    }
}