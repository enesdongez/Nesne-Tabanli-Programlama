using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class MasterPage : System.Web.UI.MasterPage
{
    DemirbasGenel genel = new DemirbasGenel();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
            string s = SqlDataSource1.SelectCommand;
            
            genel.TreeViewList(TreeView1, SqlDataSource1.ConnectionString, "malzeme", "Isim");
        }
        Label1.Text = DemirbasGenel.ad1;

       

     
    }
               
    protected void demirbaskat1(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel3.Visible = false;
     
        
    }

    protected void lokasyonkat1(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel2.Visible = false;
      
        
    }

    protected void TreeView1_TreeNodeExpanded(object sender, TreeNodeEventArgs e)
    {

       // TreeView1.ExpandImageUrl = "~/Scripts/resim/simge3.png";
    }

    protected void TreeView1_TreeNodeCollapsed(object sender, TreeNodeEventArgs e)
    {
       // TreeView1.CollapseImageUrl = "~/Scripts/resim/simge.png";
    }



    protected void Button7_Click(object sender, EventArgs e)
    {
        genel.TreeViewList(TreeView1, SqlDataSource1.ConnectionString, "malzeme", "Isim");
    }
    protected void Button7_Click1(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        genel.TreeviewFilter(TreeView1, TextBox1, SqlDataSource1.ConnectionString, "malzeme", "Isim");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {

    }
}
