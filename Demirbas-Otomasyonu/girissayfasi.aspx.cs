using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class acilis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ResimOlustur();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    
        DemirbasGenel genel = new DemirbasGenel();

        string a = txtKontrolKodu.Text,son="";

        for (int i = 0; i < a.Length; i++)
        {
            char b = Convert.ToChar(a[i]);
            int c = Convert.ToInt32(b);
            if (c >= 97 && c <= 122)
            {
                c -= 32;
            }
            b = Convert.ToChar(c);
            son += Convert.ToString(b);
        }
        if (son == Session["kod"].ToString())
        {
            genel.Login(TextBox1, TextBox3);
        }
        else
        {
         
            lblMesaj.Text = "Doğrulama Kodu Yanlış!";
          
            ResimOlustur();
        }
      

    }
    public void ResimOlustur()
    {
        string kod = "";
        kod = RastgeleVeriUret();
        //Üretilen kodu Session nesnesine aktarır.
        Session.Add("kod", kod);
        //Rastgele üretilen metini alıp resme dönüştürelim.
        //boş bir resim dosyası oluştur.
        Bitmap bmp = new Bitmap(100, 21);
        //Graphics sınıfı ile resmin kontrolunu alır.
        Graphics g = Graphics.FromImage(bmp);
        //DrawString 20‘ye 0 kordinatına kodu‘u yazdırır.
        g.DrawString(kod, new Font("Comic Sanns MS", 13), new SolidBrush(Color.Black), 20, 0);
        //Resmi binary olarak alıp sayfaya yazdırmak ıcın MemoryStream kullandık.
        MemoryStream ms = new MemoryStream();
        bmp.Save(ms, ImageFormat.Png);
        var base64Data = Convert.ToBase64String(ms.ToArray());
        imgKod.ImageUrl = "data:image/png;base64," + base64Data;
        g.Dispose();
        bmp.Dispose();
        ms.Close();
        ms.Dispose();
    }

    public string RastgeleVeriUret()
    {
        string deger = "";
        //Türkçe karakterleri kullanmaktan vazgeçtim.
        string dizi = "ABCDEFGHIJKLMNOPRSTUVYZ0123456789";
        Random r = new Random();
        //Toplam 6 karakterden oluşan rastgele bir metin oluşturalım.
        for (int i = 0; i < 5; i++)
        {
            deger = deger + dizi[r.Next(0, 33)];
        }
        return deger;
    }

  
}