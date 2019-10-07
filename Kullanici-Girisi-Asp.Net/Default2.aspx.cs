using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com2 = new SqlCommand();
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=Deneme;Integrated Security=True");
        com = new SqlCommand();
        con.Open();
        com.CommandText = "select  adi,soyadi,sifre from kisiler where adi='" + TextBox1.Text + "'and soyadi='" + TextBox2.Text + "'  and sifre='" + TextBox3.Text + "'";
        com2.Connection = con;
        com2.CommandText = "select count(*) from kisiler";
        int count = Convert.ToInt32(com2.ExecuteScalar());
        com.Connection = con;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            HttpContext.Current.Response.Redirect("Default.aspx");
        }
        if (count == 0 && TextBox1.Text == "gir@admin.com" && TextBox2.Text == "1234")
        {
            HttpContext.Current.Response.Redirect("Default.aspx");
        }
        dr.Close();
        con.Close();
    }
}