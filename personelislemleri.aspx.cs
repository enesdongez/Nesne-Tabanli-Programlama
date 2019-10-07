using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
            if (TextBox2.Text == "")
                SqlDataSource1.SelectCommand = "select * from personel";

            SqlDataAdapter adap = new SqlDataAdapter(SqlDataSource1.SelectCommand, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Columns.Count - 1; i++)
            {
                DropDownList1.Items.Add(ds.Tables[0].Columns[i].ColumnName);
            }
        }
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "select * from personel where " + DropDownList1.Text.ToString() + " like '%" + TextBox2.Text + "%'";
    }
}