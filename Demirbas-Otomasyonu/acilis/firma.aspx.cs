using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class acilis_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkButton2.Enabled = false;
       
    
    }

   

    protected void kaydet_Click(object sender, EventArgs e)
    {
      
        DemirbasGenel control = new DemirbasGenel();
     bool kayitvarmi=   control.recordControl(txtfirma, "firma");

     if (!kayitvarmi)
     {
         SqlDataSourcefirma.Insert();
       
         Label2.Text = "";
         LinkButton2.Enabled = true;
         CheckBox1.Visible = true;

         kaydet.Enabled = false;
     }
     else
     {
         Label2.Text = txtfirma.Text + " isminde firma zaten tanımlı";
     }
     
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            LinkButton2.PostBackUrl = "~/acilis/birim.aspx";
        }

        LinkButton2.PostBackUrl = "~/acilis/sube.aspx";
    }
   
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
            LinkButton2.Enabled = true;
        if (CheckBox1.Checked)
        {
            LinkButton2.Text = "> > Departman Ekle";
            LinkButton2.PostBackUrl = "~/acilis/birim.aspx";
        }
        else
        {
            LinkButton2.Text = "> > Şube Ekle";

            LinkButton2.PostBackUrl = "~/acilis/sube.aspx";
        }

       
    }
    }  