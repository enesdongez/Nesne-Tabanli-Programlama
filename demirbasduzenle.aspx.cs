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
        /* if (!Page.IsPostBack)
         {
             SqlConnection con = new SqlConnection(SqlDataSource1.ConnectionString);
          
     

             SqlDataAdapter adap = new SqlDataAdapter("select Bilisim,Ofis,Arac,Diger from Kategoridemirbas", con);
             DataSet ds = new DataSet();
             adap.Fill(ds);
             for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
             {
                 dpkategori.Items.Add(ds.Tables[0].Columns[i].ColumnName);
             }
         }*/
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        // Label2.Text = dpkategori.SelectedValue.ToString();
        SqlDataSource2.Insert();
       
        
    }
    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {

    }
    protected void TreeView2_TreeNodeCollapsed(object sender, TreeNodeEventArgs e)
    {
       
    }
}