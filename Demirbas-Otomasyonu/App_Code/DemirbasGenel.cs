using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

/// <summary>
/// Summary description for DemirbasGenel
/// </summary>
public class DemirbasGenel
{
    public DemirbasGenel()
    {

    }
    SqlConnection con;
    SqlCommand com;
    public void TreeViewList(TreeView twl, string connects, string tablename, string columname)
    {

        twl.Nodes.Clear();
        twl.CollapseImageUrl = "~/Scripts/resim/simge.png";
        twl.ExpandImageUrl = "~/Scripts/resim/simge3.png";

        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        SqlCommand com = new SqlCommand();
        com.CommandText = "select COUNT(*) from malzeme  where bolgeID= (SELECT Personel.BolgeID FROM  Personel  WHERE Ad='" + ad2 + "')";
        com.Connection = con;
        con.Open();


        int sayi = Convert.ToInt32(com.ExecuteScalar());
        TreeNode f = new TreeNode("Ürünler(" + sayi.ToString() + ")");

        twl.Nodes.Add(f);
        com.CommandText = "select  count(*) from kategoridemirbas";
        int kategoricount = Convert.ToInt32(com.ExecuteScalar());
        com.CommandText = "select  c_name, count(*) from kategoridemirbas,Malzeme where K_ID =Malzeme.KategoriID  AND Malzeme.bolgeID= (SELECT Personel.BolgeID FROM  Personel  WHERE Ad='" + ad2 + "')  group by c_name";
        SqlDataReader dr = com.ExecuteReader();

        TreeNode f1;


        while (dr.Read())
        {
            f1 = new TreeNode(dr[0].ToString() + "(" + dr[1].ToString() + ")");

            twl.Nodes[0].ChildNodes.Add(f1);
            // f1.ImageUrl = "~/Scripts/resim/simge2.png";
            // f1.ChildNodes[0].ChildNodes.Add(f1);
        }

        dr.Close();



        com.CommandText = "select  count(*) from Malzeme";

        //  int count = Convert.ToInt32(com.ExecuteScalar());


        //   dr = com.ExecuteReader();

        int count = 0;
        com.CommandText = "select c_name,Isim, K_ID,count(*)from Kategoridemirbas,Malzeme where K_ID=KategoriID group by c_name, Isim,K_ID";
        dr = com.ExecuteReader();
        while (dr.Read())
        {
            count++;
        }

        dr.Close();
        SqlDataAdapter adap = new SqlDataAdapter(com.CommandText, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        // dr = com.ExecuteReader();
        string[] dizi = TreviewNodeTextControl(twl);
        for (int c = 0; c < kategoricount; c++)
        {
            for (int j = 0; j < count; j++)
            {
                f1 = new TreeNode(ds.Tables[0].Rows[j][1].ToString() + "(" + ds.Tables[0].Rows[j][3].ToString() + ")");
                if (dizi[c] == ds.Tables[0].Rows[j][0].ToString())
                {

                    twl.Nodes[0].ChildNodes[c].ChildNodes.Add(f1);
                    f1.ImageUrl = "~/Scripts/resim/simge2.png";




                }
            }






        }
        twl.ExpandDepth = 1;
        dr.Close();

        con.Close();



    }



    public string[] TreviewNodeTextControl(TreeView twl)
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        SqlCommand com = new SqlCommand();
        com.CommandText = "select  count(*) from kategoridemirbas";
        com.Connection = con;
        con.Open();
        int sayi = Convert.ToInt32(com.ExecuteScalar());
        string[] control = new string[sayi];
        int count = 0;

        //  TreeNode koleksiyon = new TreeNode(TreeView1.Nodes[0].ChildNodes);
        foreach (TreeNode item in twl.Nodes[0].ChildNodes)
        {
            for (int i = 0; i < item.Text.Length - 1; i++)
            {

                if (item.Text[i] != '(')
                {
                    control[count] += item.Text[i];

                }

                else
                {
                    count++;
                    break;
                }
            }
            //  control[count] = item.Text;



        }
        con.Close();
        return control;

    }

    public static string ad1, ad2;
    public void TreeviewFilter(TreeView twl, TextBox txtara, string connects, string tablename, string columname)
    {
        SqlDataReader dr;
        if (txtara.Text != "")
        {
            twl.Nodes.Clear();
            twl.CollapseImageUrl = "~/Scripts/resim/simge.png";
            twl.ExpandImageUrl = "~/Scripts/resim/simge3.png";

            SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
            SqlCommand com = new SqlCommand();
            com.CommandText = "select  count(*) from Malzeme where Isim like '%" + txtara.Text + "%'";
            com.Connection = con;
            con.Open();


            int sayi = Convert.ToInt32(com.ExecuteScalar());
            TreeNode f = new TreeNode("Ürünler(" + sayi.ToString() + ")");

            twl.Nodes.Add(f);
            com.CommandText = "select  count(*) from kategoridemirbas";
            int kategoricount = Convert.ToInt32(com.ExecuteScalar());
            com.CommandText = "select  c_name, count(*) from kategoridemirbas,Malzeme where K_ID =Malzeme.KategoriID and Isim like '%" + txtara.Text + "%' group by c_name";
            dr = com.ExecuteReader();

            TreeNode f1;


            while (dr.Read())
            {
                f1 = new TreeNode(dr[0].ToString() + "(" + dr[1].ToString() + ")");

                twl.Nodes[0].ChildNodes.Add(f1);
                // f1.ImageUrl = "~/Scripts/resim/simge2.png";
                // f1.ChildNodes[0].ChildNodes.Add(f1);
            }

            dr.Close();



            // com.CommandText = "select  count(*) from Malzeme";

            //  int count = Convert.ToInt32(com.ExecuteScalar());


            //   dr = com.ExecuteReader();

            int count = 0;
            com.CommandText = "  select c_name,Isim, K_ID,count(*)from Kategoridemirbas,Malzeme where K_ID=KategoriID and Isim like '%" + txtara.Text + "%' group by c_name, Isim,K_ID ";

            dr = com.ExecuteReader();
            while (dr.Read())
            {
                count++;
            }

            dr.Close();
            SqlDataAdapter adap = new SqlDataAdapter(com.CommandText, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            // dr = com.ExecuteReader();
            string[] dizi = TreviewNodeTextControl(twl);
            for (int c = 0; c < kategoricount; c++)
            {
                for (int j = 0; j < count; j++)
                {
                    f1 = new TreeNode(ds.Tables[0].Rows[j][1].ToString() + "(" + ds.Tables[0].Rows[j][3].ToString() + ")");
                    if (dizi[c] == ds.Tables[0].Rows[j][0].ToString())
                    {

                        twl.Nodes[0].ChildNodes[c].ChildNodes.Add(f1);
                        f1.ImageUrl = "~/Scripts/resim/simge2.png";




                    }
                }


            }


            twl.ExpandAll();
            dr.Close();

            con.Close();


        }
        else
        {
            TreeViewList(twl, connects, tablename, columname);


        }

    }

    public void Login(TextBox txtemail, TextBox txtsifre)
    {
        // TextWriter t;

        SqlCommand com2 = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        com = new SqlCommand();
        con.Open();
        // com.CommandText = "select PERSONEL. ad,soyad,sifre,Il_ID from personel,[Firma] where email='" + txtemail.Text + "' and sifre='" + txtsifre.Text + "'";// and personel.BolgeID=[MERKEZ KURUMLAR].IL_ID";
        com.CommandText = "select PERSONEL. ad,soyad,sifre from personel where email='enes@hot.com' and sifre='1'";
        com2.Connection = con;
        com2.CommandText = "select count(*) from personel";
        int count = Convert.ToInt32(com2.ExecuteScalar());
        com.Connection = con;


        bool durum = false;



        //int  sayi = Convert.ToInt32(com.ExecuteScalar());
        string ad = "";
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            //  ad = dr[0].ToString()+" "+dr[1].ToString()+" "+dr[3].ToString();
            ad2 = dr[0].ToString();
            durum = true;
            // isim = dr[1].ToString();
            //  id = (int)dr[0];
        }
        dr.Close();
        con.Close();

        if (durum)
        {
            //  Page r = new Page();
            // r.Response.Redirect("demirbasduzenle.aspx");
            //  ad1 = ad;

            //  HttpContext.Current.Response.Redirect("demirbasduzenle.aspx?bilgi=" + ad );
            HttpContext.Current.Response.Redirect("~/ayarlar.aspx" + ad);
        }



        if (count == 0 && txtemail.Text == "gir@perkon.com" && txtsifre.Text == "1234")
        {
            HttpContext.Current.Response.Redirect("demirbasduzenle.aspx?bilgi=" + ad + "");
        }

        // Page r = new Page();


        // HttpContext.Current.Response.Redirect("~ /");

        //return durum;
    }
    public void personelekle(TextBox txtad, TextBox txtsoyad, TextBox txtemail, TextBox txtsifre, DropDownList dp, GridView grid, SqlDataSource datasource)
    {
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Open();
        com.CommandText = "insert into Personel (ad,soyad,sifre,email,Pozisyon) values ('" + txtad.Text + "','" + txtsoyad.Text + "','" + txtemail.Text + "','" + txtsifre.Text + "','" + dp.SelectedValue.ToString() + "')";
        com.Connection = con;

        com.ExecuteNonQuery();

        grid.DataSourceID = datasource.ID;
        grid.DataBind();
        con.Close();
    }
    public static string hata;

    public void DefineDepartment(TextBox txtDepartment, DropDownList ddlcity, DropDownList ddldistirict, Label error, DropDownList ddlfirma)
    {
        try
        {
            /*   if (txtDepartment.Text != "")
               {


                   //    con.Close();
                   com = new SqlCommand();
                   con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
                   con.Open();
                   com.Connection = con;


                   com.Connection = con;
                   bool durum = recordControl(txtDepartment, "subeler");
                   if (durum)
                   {
                       com.CommandText = "insert into subeler  (kURUMID,ad,IL_ID,ILCE_ID) values ((SELECT ID FROM firma where ad=@ad),@ekle,@city,@distrinct)";
                       com.Parameters.Add("@ad", ddlfirma.SelectedItem.Text);

                       com.Parameters.Add("@ekle", txtDepartment.Text);
                       com.Parameters.Add("@city", ddlcity.SelectedValue);
                       com.Parameters.Add("@distrinct", ddldistirict.SelectedValue);
                       com.ExecuteNonQuery();
                       error.Text = "";
                   }
                   else
                   {
                       error.Text = "Bu Kayıt zaten var";
                       txtDepartment.Text = "";
                       return;
                   }

                   */

            SqlDataReader dr;
            SqlCommand
            com1 = new SqlCommand();
            con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
            con.Open();
            com1.Connection = con;
            com1.CommandText = "select subeID,SILID,SILCEID from merkezvesubebirimleri ";
            com = new SqlCommand();
            con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
            con.Open();
            com.Connection = con;
            com.CommandText = "select subeID,SILID,SILCEID from merkezvesubebirimleri ";
            dr = com1.ExecuteReader();
            while (dr.Read())
            {
                if (dr[0].ToString() == "" && dr[1].ToString() == "" && dr[2].ToString() == "")
                {
                    com.Parameters.Clear();

                    com.CommandText = "update  merkezvesubebirimleri  set subeID=(SELECT SUBEID FROM SUBELER WHERE AD=@DEPARTMENT) , SILID=@city, SILCEID=@distrinct WHERE merkezvesubebirimleri.KurumID=(SELECT ID FROM firma where ad=@ad) ";
                    com.Parameters.Add("@city", ddlcity.SelectedValue);
                    com.Parameters.Add("@distrinct", ddldistirict.SelectedValue);
                    com.Parameters.Add("@DEPARTMENT", txtDepartment.Text);
                    com.Parameters.Add("@ad", ddlfirma.SelectedItem.Text);

                    com.ExecuteNonQuery();
                }
            }
            dr.Close();
            com.Parameters.Clear();


            // com.CommandText = "insert into SUBELER  (ad) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";

            con.Close();
            txtDepartment.Text = "";

        }

        /* catch (Exception f )
         {

             log(f.Message);
            
        
         }*/
        catch (Exception ex) //catch bloğu ise try bloğundaki herhangi bir isteğin düzgün gerçekleştirilememesi durumunda hatayı yakalıyor.
        {
            con.Close();
            con.Open();
            com.CommandText = "select count(*) from subeler";
            int sayi = Convert.ToInt32(com.ExecuteScalar());
            com.CommandText = "    DBCC CHECKIDENT (subeler, RESEED," + sayi + ")";
            com.ExecuteNonQuery();
            con.Close();
            hata = "AYNI KAYIT GİRİLEMEZ";
            // Session["hata"] = ex.ToString(); //hata.aspx sayfasında hatanın tanımını yazmak için Session değişkeni kullandık.
            // Response.Redirect("hata.aspx"); //hata oluştuğunda hata.aspx sayfasına gider. 
            HttpContext.Current.Response.Redirect("hata.aspx");

        }
finally //İster try bloğu çalışsın ister catch bloğu çalışsın sonunda mutlaka finally bloğundaki istekler gerçekleşir.
        {
            //  con.Close(); //bağlantımız kapatılıyor.

        }

        /* values((select  iller.id from iller where sehir='iSTANBUL'),
         (select ilceler.id from ilceler where ilce='Ümraniye'),(select ID from firma WHERE AD='perkon'),
         (select subeId from subeler where ad='umraniye'),(select B_ID from birim where Birim.Ad ='umraniye'))*/

    }



    public void DefineCompany(TextBox txCompany, DropDownList ddlcity, DropDownList ddldistirict, Label error)
    {
        try
        {



            /*  if (txCompany.Text != "")
              {


                  //    con.Close();
                  com = new SqlCommand();
                  con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
                  con.Open();
                  com.Connection = con;


                  com.Connection = con;
                  bool durum = recordControl(txCompany, "firma");
                  if (durum==false)
                  {
                      com.CommandText = "insert into Firma (ad) values (@ekle)";
                      com.Parameters.Add("@ekle", txCompany.Text);
                      com.ExecuteNonQuery();
                      error.Text = "";
                  }
                  else
                  {
                      error.Text = "Bu Kayıt zaten var";
                      txCompany.Text = "";
                      con.Close();
                      return;
                  }


              }*/


            con.Close();
            com = new SqlCommand();
            con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
            con.Open();
            com.Connection = con;




            // com.CommandText = "insert into SUBELER  (ad) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";
            com.CommandText = "insert into merkezvesubebirimleri (ILID,ILCEID,kurumID) values(@city,@distrinct,(select ID from firma WHERE AD=@ekle))";
            com.Parameters.Add("@city", ddlcity.SelectedValue);
            com.Parameters.Add("@distrinct", ddldistirict.SelectedValue);
            com.Parameters.Add("@ekle", txCompany.Text);
            com.ExecuteNonQuery();
            con.Close();
            txCompany.Text = "";


        }

        /* catch (Exception f )
         {

             log(f.Message);
            
        
         }*/
        catch (Exception ex) //catch bloğu ise try bloğundaki herhangi bir isteğin düzgün gerçekleştirilememesi durumunda hatayı yakalıyor.
        {
            hata = "AYNI KAYIT GİRİLEMEZ";
            // Session["hata"] = ex.ToString(); //hata.aspx sayfasında hatanın tanımını yazmak için Session değişkeni kullandık.
            // Response.Redirect("hata.aspx"); //hata oluştuğunda hata.aspx sayfasına gider. 
            HttpContext.Current.Response.Redirect("hata.aspx");
            con.Close();
        }
finally //İster try bloğu çalışsın ister catch bloğu çalışsın sonunda mutlaka finally bloğundaki istekler gerçekleşir.
        {
            //bağlantımız kapatılıyor.

        }

        /* values((select  iller.id from iller where sehir='iSTANBUL'),
         (select ilceler.id from ilceler where ilce='Ümraniye'),(select ID from firma WHERE AD='perkon'),
         (select subeId from subeler where ad='umraniye'),(select B_ID from birim where Birim.Ad ='umraniye'))*/

    }


    public void DefineCompany(TextBox txCompany, DropDownList ddlcity, DropDownList ddldistirict, TextBox Department, TextBox unit, Label error)
    {
        try
        {
            //    con.Close();
            com = new SqlCommand();
            con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
            con.Open();
            com.Connection = con;
            com.CommandText = "insert into Firma (ad) values (@ekle)";
            com.Parameters.Add("@ekle", txCompany.Text);

            com.Connection = con;
            bool durum = recordControl(txCompany, "firma");
            if (durum)
            {
                com.ExecuteNonQuery();
                error.Text = "";
            }
            else
            {
                error.Text = "Bu Kayıt zaten var";
                return;
            }
            com.CommandText = "insert into birim (ad) values (@birimekle)";

            com.Parameters.Add("@birimekle", unit.Text);

            durum = recordControl(unit, "birim");
            if (durum)
            {
                com.ExecuteNonQuery();
                error.Text = "";
            }
            else
            {
                error.Text = "Bu Kayıt zaten var";

                return;
            }


            // com.CommandText = "insert into SUBELER  (ad) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";
            com.CommandText = "insert into merkezvesubebirimleri (ILID,ILCEID,kurumID,SUBEID,BirimID) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";
            com.Parameters.Add("@city", ddlcity.SelectedValue);
            com.Parameters.Add("@distrinct", ddldistirict.SelectedValue);
            com.Parameters.Add("@unit", unit.Text);
            com.ExecuteNonQuery();
            con.Close();
            txCompany.Text = "";
            Department.Text = "";
            unit.Text = "";

        }
        /* catch (Exception f )
         {

             log(f.Message);
            
        
         }*/
        catch (Exception ex) //catch bloğu ise try bloğundaki herhangi bir isteğin düzgün gerçekleştirilememesi durumunda hatayı yakalıyor.
        {
            con.Close();
            con.Open();
            com.CommandText = "select count(*) from Firma";
            int sayi = Convert.ToInt32(com.ExecuteScalar());
            com.CommandText = "    DBCC CHECKIDENT (firma, RESEED," + sayi + ")";
            com.ExecuteNonQuery();
            con.Close();
            con.Close();
            hata = "AYNI KAYIT GİRİLEMEZ";
            // Session["hata"] = ex.ToString(); //hata.aspx sayfasında hatanın tanımını yazmak için Session değişkeni kullandık.
            // Response.Redirect("hata.aspx"); //hata oluştuğunda hata.aspx sayfasına gider. 
            HttpContext.Current.Response.Redirect("hata.aspx");

        }
finally //İster try bloğu çalışsın ister catch bloğu çalışsın sonunda mutlaka finally bloğundaki istekler gerçekleşir.
        {
            //  con.Close(); //bağlantımız kapatılıyor.

        }

        /* values((select  iller.id from iller where sehir='iSTANBUL'),
         (select ilceler.id from ilceler where ilce='Ümraniye'),(select ID from firma WHERE AD='perkon'),
         (select subeId from subeler where ad='umraniye'),(select B_ID from birim where Birim.Ad ='umraniye'))*/

    }


    public void log(string hata)
    {
        // FileStream fs = new FileStream("log.txt", FileMode.OpenOrCreate, FileAccess.Write, FileShare.None);
        StreamWriter sw = new StreamWriter("log.txt", true);
        //   sw = new StreamWriter(fs, true);
        sw.WriteLine(DateTime.Now.ToString() + " : " + hata);

        sw.Close();
        sw.Dispose();

        //  fs.Close();


        /* 
     
     
     
               catch ( Exception ex)
                {
                }
           
            }

            public void log(string hata)
            {
                   
            }*/



    }



    public void DefineUnit(DropDownList ddlcompany, DropDownList ddlDepartment, TextBox unit, Label error)
    {


        try
        {






            if (unit.Text != "")
            {


                //    con.Close();
                com = new SqlCommand();
                con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");


                com.Connection = con;


                bool durum = recordControl(unit, "birim");
                if (durum)
                {

                    com.CommandText = "insert into birim (ad) values (@birimekle)";

                    com.Parameters.Add("@birimekle", unit.Text);
                    com.ExecuteNonQuery();
                    error.Text = "";
                }
                else
                {
                    error.Text = "Bu Kayıt zaten var";
                    unit.Text = "";
                    return;
                }

                com.Parameters.Clear();
                // com.CommandText = "insert into SUBELER  (ad) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";
                com.CommandText = "update  merkezvesubebirimleri  set BirimID = (SELECT b_ID FROM birim where ad= @birimekle) where  KurumID=@kID and SubeID=@sID";
                com.Parameters.Add("@birimekle", unit.Text);
                com.Parameters.Add("@kID", ddlcompany.SelectedValue);//, DropDownList 
                com.Parameters.Add("@sID", ddlDepartment.SelectedValue);
                com.ExecuteNonQuery();
                con.Close();

                unit.Text = "";
            }

        }


        catch (Exception ex) //catch bloğu ise try bloğundaki herhangi bir isteğin düzgün gerçekleştirilememesi durumunda hatayı yakalıyor.
        {
            con.Close();
            con.Open();
            com.CommandText = "select count(*) from birim";
            int sayi = Convert.ToInt32(com.ExecuteScalar());
            com.CommandText = "    DBCC CHECKIDENT (birim, RESEED," + sayi + ")";
            com.ExecuteNonQuery();
            con.Close();
            con.Close();
            hata = "AYNI KAYIT GİRİLEMEZ";
            // Session["hata"] = ex.ToString(); //hata.aspx sayfasında hatanın tanımını yazmak için Session değişkeni kullandık.
            // Response.Redirect("hata.aspx"); //hata oluştuğunda hata.aspx sayfasına gider. 
            HttpContext.Current.Response.Redirect("hata.aspx");

        }
finally //İster try bloğu çalışsın ister catch bloğu çalışsın sonunda mutlaka finally bloğundaki istekler gerçekleşir.
        {
            //  con.Close(); //bağlantımız kapatılıyor.

        }

        /* values((select  iller.id from iller where sehir='iSTANBUL'),
         (select ilceler.id from ilceler where ilce='Ümraniye'),(select ID from firma WHERE AD='perkon'),
         (select subeId from subeler where ad='umraniye'),(select B_ID from birim where Birim.Ad ='umraniye'))*/



    }
    public bool recordControl(TextBox txtvalue, string tableName)
    {
        //   con.Close();
        bool durum = true;
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Open();
        com.Connection = con;
        com.CommandText = "select COUNT(*) from " + tableName + " where ad=@control";
        com.Parameters.Add("@control", txtvalue.Text);
        //SqlDataReader dr = com.ExecuteReader(;)
        com.Connection = con;
        int sayi = Convert.ToInt32(com.ExecuteScalar());
        if (sayi == 0)
        {
            durum = false;
            // con.Open();
        }
        con.Close();
        return durum;
    }
    public void firmatanimlamakontrol(Button btn, Button btn1, DropDownList dp)
    {
        if (dp.Items.Count != 0)
        {
            btn.Enabled = true;
            btn1.Enabled = true;
            return;
        }
        btn.Enabled = false;
        btn1.Enabled = false;

    }

    public void merkez(DropDownList ddlcompany, DropDownList ddlDepartment, TextBox unit, Label error, DropDownList ddlcity, DropDownList ddldistirict, DropDownList sddlcity, DropDownList sddldistirict)
    {
        try
        {








            if (unit.Text != "")
            {

                bool durum = recordControl(unit, "birim");
                // if (durum)
                {


                    con.Close();
                    con.Open();
                    com.Parameters.Clear();
                    // com.CommandText = "insert into SUBELER  (ad) values(@city,(select ilceler.id from ilceler where ilce=@distrinct),(select ID from firma WHERE AD=@ekle),(select subeId from subeler where ad=@unit),(select B_ID from birim where Birim.Ad =@birimekle))";
                    //com.CommandText = "INSERT INTO [Merkezvesubebirimleri] ([KurumID], [SubeID], [BirimID], [ILID], [ILCEID], [SILID], [SILCEID]) VALUES (@KurumID, @SubeID,(select B_ID from birim where ad=@BirimID), (select iller.id from iller  where iller.id=  @ILID),(select ilceler.id from ilceler where ilceler.id= @ILCEID),(select iller.id from  iller  where iller. id= @SILID), (select ilceler.id from  ilceler where ilceler.id= @SILCEID))";
                    com.CommandText = "update [Merkezvesubebirimleri] set  BirimID=(select B_ID from birim where ad=@BirimID)";
                    com.Parameters.Add("@BirimID", unit.Text);
                    /* com.Parameters.Add("@KurumID", ddlcompany.SelectedValue);
                     com.Parameters.Add("@SubeID", ddlDepartment.SelectedValue);//, DropDownList 
                     com.Parameters.Add("@BirimID", unit.Text);

                     com.Parameters.Add("@ILID", ddlcity.SelectedValue);
                     com.Parameters.Add("@ILCEID", ddldistirict.SelectedValue);
                     com.Parameters.Add("@SILID", sddlcity.SelectedValue);
                     com.Parameters.Add("@SILCEID", sddldistirict.SelectedValue);
                
                             if (ddlDepartment.Items.Count == 0)
                     { com.Parameters["@SILID"].Value=0;
                         com.Parameters["@SILceID"].Value=0;
           

                     }
                             */

                    com.ExecuteNonQuery();
                    con.Close();

                }
            }
        }
        catch (Exception e)
        {

            error.Text = "bu kayıt zaten var";
            con.Close();
        }



    }

    public bool esitdegilse(TextBox firma, DropDownList sehir, DropDownList ilce)
    {
        bool durum = false;
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Close();
        con.Open();
       com.CommandText = "select AD,ILID,ILCEID FROM Firma,Merkezvesubebirimleri where Firma.AD=@ad";
       // com.CommandText = " select  distinct  (select ILID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID),(select ILCEID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID) ,SILID,SILCEID, subeler.ad FROM firma,subeler,Merkezvesubebirimleri where subeler.AD=@ad and Merkezvesubebirimleri.KurumID=@KURUMID";
        com.Parameters.Add("@ad", firma.Text);
        com.Connection = con;
        SqlDataReader dr;
        dr = com.ExecuteReader();
        //int sayi =  Convert.ToInt32( com.ExecuteScalar());
        while (dr.Read())
        {
            if (dr[0].ToString() == com.Parameters[0].Value.ToString() && dr[1].ToString() == sehir.SelectedValue && dr[2].ToString() == ilce.SelectedValue)
            {
                durum = true;
            }
            firma.Text = dr[0].ToString();

        }
        con.Close();
        dr.Close();
        return durum;
    }


    public bool esitdegilse(DropDownList firma, DropDownList sehir, DropDownList ilce, TextBox sube)
    {
        bool durum = false;
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Close();
        con.Open();
        com.CommandText = " select  distinct  (select ILID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID),(select ILCEID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID) ,SILID,SILCEID, subeler.ad FROM firma,subeler,Merkezvesubebirimleri where subeler.AD=@ad and Merkezvesubebirimleri.KurumID=@KURUMID";

        // com.CommandText = "select firma.ID,  (select ILID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID),(select ILCEID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID) ,SILID,SILCEID,subeler.ad FROM firma,subeler,Merkezvesubebirimleri where subeler.AD=@ad  and Merkezvesubebirimleri.KurumID=@KURUMID";
        com.Parameters.Add("@ad", sube.Text);
        com.Parameters.Add("@KURUMID", firma.SelectedValue);

        com.Connection = con;
        SqlDataReader dr;
        dr = com.ExecuteReader();
        //int sayi =  Convert.ToInt32( com.ExecuteScalar());
        int sayi = 0;
        while (dr.Read())
        {//firma.SelectedValue
            if (dr[0].ToString() == firma.SelectedValue && dr[1].ToString() == firma.SelectedValue && dr[2].ToString() == firma.SelectedValue && dr[3].ToString() == sehir.SelectedValue && dr[4].ToString() == ilce.SelectedValue && dr[5].ToString() == sube.Text)
            {
                durum = true;
                con.Close();
                dr.Close();
               
                
                return durum;
            }
            sayi++;

        }
        //  sube.Text = sayi.ToString();

        con.Close();
        dr.Close();
      /*  if (dr[3].ToString() != "" || dr[4].ToString() != "")
        {

        }*/
        return durum;
    }

    public void merkezsubeupdate(TextBox sube, DropDownList dpil, DropDownList dpilce, DropDownList firma)
    {
        SqlCommand com3 = new SqlCommand();
        con.Close();
        con.Open();
        com3.CommandText = "select count(*) from subeler";
        com3.Connection = con;
        int sayi = Convert.ToInt32(com3.ExecuteScalar());
        SqlCommand com2 = new SqlCommand();

        com2.Connection = con;
       // com2.CommandText = "select firma.ID,  (select ILID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID),(select ILCEID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID) ,SILID,SILCEID,subeler.ad FROM firma,subeler,Merkezvesubebirimleri where subeler.AD=@ad and Merkezvesubebirimleri.KurumID=@KURUMID";
      com2.CommandText=" select  distinct  (select ILID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID),(select ILCEID  from Merkezvesubebirimleri WHERE KurumID= @KURUMID) ,SILID,SILCEID, subeler.ad FROM firma,subeler,Merkezvesubebirimleri where subeler.AD=@ad and Merkezvesubebirimleri.KurumID=@KURUMID";

        com2.Parameters.Add("@ad", sube.Text);
        com2.Parameters.Add("@KURUMID", firma.SelectedValue);
        SqlDataReader dr;
        bool durum = false;
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");

        com.Connection = con;
        com.CommandText = "update  merkezvesubebirimleri  set subeID=(SELECT SUBEID FROM SUBELER WHERE AD=@ad) , SILID=@city, SILCEID=@distrinct WHERE merkezvesubebirimleri.KurumID=(SELECT ID FROM firma where firma.ID=@ID) ";



        com.Parameters.Add("@ad", sube.Text);
        com.Parameters.Add("@ID", firma.SelectedValue);
        com.Parameters.Add("@city", dpil.SelectedValue);
        com.Parameters.Add("@distrinct", dpilce.SelectedValue);

        dr = com2.ExecuteReader();
        con.Open();
        while (dr.Read())
        {
            if ((dr[3].ToString() == "" || dr[4].ToString() == ""))
            {
                com.ExecuteNonQuery();
            }
            else
            {
                // con.Open();
                com.CommandText = "insert into merkezvesubebirimleri (KurumID,SubeID,ILID,ILCEID,SILID ,sILCEID )values(" + com.Parameters[1].Value + ",(SELECT SUBEID FROM SUBELER WHERE AD=@ad) ,(select ILID from merkezvesubebirimleri where IlID=" + com.Parameters[1].Value + "),(SELECT ILCEID from merkezvesubebirimleri where ILCEID=" + com.Parameters[1].Value + ")," + com.Parameters[2].Value + "," + com.Parameters[1].Value + ")";
                //  merkezsubeinsert(sube, dpil, dpilce, firma);
                com.ExecuteNonQuery();
            }

        }


        con.Close();
    }


    public void merkezsubeinsert(TextBox sube, DropDownList dpil, DropDownList dpilce, DropDownList firma)
    {
        bool durum = false;
        com = new SqlCommand();
        con = new SqlConnection("Data Source=.;Initial Catalog=DemirbasYonetimSistemleri;Integrated Security=True");
        con.Close();
        con.Open();
        com.Connection = con;
        com.CommandText = "update  merkezvesubebirimleri  set subeID=(SELECT SUBEID FROM SUBELER WHERE AD=@ad) , SILID=@city, SILCEID=@distrinct WHERE merkezvesubebirimleri.KurumID=(SELECT ID FROM firma where firma.ID=@ID) ";
        com.Parameters.Add("@ad", sube.Text);
        com.Parameters.Add("@ID", firma.SelectedValue);
        com.Parameters.Add("@city", dpil.SelectedValue);
        com.Parameters.Add("@distrinct", dpilce.SelectedValue);
        com.ExecuteNonQuery();
        con.Close();
    }

}