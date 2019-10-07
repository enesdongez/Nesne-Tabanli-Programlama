using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ayarlarsayfalari_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
    SqlCommand com = new SqlCommand();
    protected void Button1_Click(object sender, EventArgs e)
    {

        con.Open();
        com.CommandText = ("update firma SET ad='"+TextBox1.Text+"' WHERE ad='"+ DropDownList1.SelectedItem.ToString()+ "'");
       
        com.Connection = con;

        com.ExecuteNonQuery();

       
        con.Close();
    }
}