using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand com;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Open();
        com.CommandText = "insert into Personel (ad,soyad,sifre,Pozisyon) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList1.SelectedValue.ToString() + "')";
        com.Connection = con;

        com.ExecuteNonQuery();
        
        GridView1.DataSourceID = SqlDataSource1.ID;
        GridView1.DataBind();
        con.Close();
    }
}