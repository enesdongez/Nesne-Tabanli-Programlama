using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class acilis_sube : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton2.Enabled = false;
    }


    protected void SubeKaydet_Click(object sender, EventArgs e)
    {
        LinkButton2.Enabled = true;
        DemirbasGenel control = new DemirbasGenel();
        bool kayitvarmi = control.recordControl(txtsube, "subeler");

        if (!kayitvarmi)
        {
            SqlDataSource7.Insert();
            
            Label3.Text = "";
        }
        else
        {
            Label3.Text = txtsube.Text + " isminde şube zaten tanımlı";
        }
     
        
        
        
       
       
    }
}