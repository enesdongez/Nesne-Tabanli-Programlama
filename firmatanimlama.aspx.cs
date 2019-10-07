using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class firmatanımlama : System.Web.UI.Page
{
    DemirbasGenel GENEL = new DemirbasGenel();


    protected void Page_Load(object sender, EventArgs e)
    {




    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        DdlFirmalar.DataBind();
        GENEL.firmatanimlamakontrol(SubeKaydet, Button9, DdlFirmalar);

    }

    protected void kaydet_Click(object sender, EventArgs e)
    {
    // bool durum = GENEL.recordControl(txtfirma, "firma");
        bool durum = GENEL.esitdegilse(txtfirma, dpil, dpilce);
        
        if (durum==false)
        {
            if (txtfirma.Text != "")
            {
                SqlDataSourcefirma.Insert();
                Label2.Text = "";
                GENEL.DefineCompany(txtfirma, dpil, dpilce, Label2);
              
            }
            else
            {
                Label2.Text = "Firma ismi  boş olamaz";       
            }
           
        }


        else
        {
            Label2.Text = "Bu Kayıt zaten var";
            txtfirma.Text = "";
            return;
        }
  
        DdlFirmalar.DataSourceID = SqlDataSource3.ID;
        DdlFirmalar.DataBind();

        DdlFirmalar0.DataSourceID = SqlDataSource3.ID;
        DdlSubeler.DataSourceID = SqlDataSource4.ID;

        DdlFirmalar0.DataBind();
        // txtbirim.Text = dpil.SelectedItem.ToString();
        Label3.Text = "";
        Label4.Text = "";
        //  SubeKaydet.Enabled = true;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        /*  Panel4.Visible = false;
          if (CheckBox1.Checked)
          {
              Panel4.Visible = true;
          }*/
    }
    protected void SubeKaydet_Click(object sender, EventArgs e)
    {
       // bool durum = GENEL.recordControl(txtsube, "subeler");
        if (txtsube.Text == "")
        {
            Label3.Text = "Şube ismi boş olamaz";
        }
        
        bool durum2 = GENEL.recordControl(txtsube, "subeler");
        bool durum = GENEL.esitdegilse(DdlFirmalar, DropDownList1, DropDownList2, txtsube);
        if (durum2  )
        {
            if ( durum==false)
            {
                SqlDataSourcesube.Insert();
                Label3.Text = "";

                GENEL.merkezsubeupdate(txtsube, DropDownList1, DropDownList2,DdlFirmalar);
                // GENEL.DefineDepartment(txtsube, DropDownList1, DropDownList2, Label3, DdlFirmalar0);  
            }
           
          
        
        }


        else if (durum==false)
        {
            Label3.Text = "Bu Kayıt zaten var";
          GENEL.merkezsubeupdate(txtsube, DropDownList1, DropDownList2, DdlFirmalar);
            txtsube.Text = "";
            return;
        }
        else
      
        {
            Label3.Text = "Bu Kayıt zaten var";
        }
        
        
      
      
        DdlSubeler.DataSourceID = SqlDataSource4.ID;
        Label2.Text = "";
        Label4.Text = "";
        //  Button9.Enabled = true;

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        bool durum = GENEL.recordControl(txtbirim, "birim");
        if (durum)
        { if (txtbirim.Text!="")
            {
            SqlDataSourceBirim.Insert();
            Label4.Text = "";
        }
      
        }


        else
        {
          //  Label4.Text = "Bu Kayıt zaten var";
           // txtbirim.Text = "";
            //return;
           
        
        }
        GENEL.merkez(DdlFirmalar0, DdlSubeler, txtbirim, Label4, DdlFirmalar0, DdlSubeler, DdlFirmalar0, DdlSubeler);
        //  GENEL.DefineUnit(DdlFirmalar0, DdlSubeler, txtbirim, Label4);
        Label2.Text = "";
        Label3.Text = "";

       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    

    }
   
    protected void txtzemin_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DdlFirmalar_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}