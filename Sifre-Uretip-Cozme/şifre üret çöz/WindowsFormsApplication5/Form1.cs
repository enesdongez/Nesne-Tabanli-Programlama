using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication5
{
    public partial class Form1asd : Form
    {
        public Form1asd()
        {
            InitializeComponent();
        }

        String alfabe = " abcdefghıijklmnopqrstuvwxyz";
        int kilit1 = 5;
        int kilit2 = 1;
        int kilit1ters = 1;


        static int bul(String a)
        {
            String alfabe = " abcdefghıijklmnopqrstuvwxyz";
            int sayac = 0;
            String dd = Convert.ToString(alfabe[sayac]);
            while (dd != a)
            {

                sayac++;
                dd = Convert.ToString(alfabe[sayac]);

            }
            return sayac;
        }


        private void button1_Click(object sender, EventArgs e)
        {

            String kod = textBox1.Text;
            String sifre = "";


            for (int i = 0; i < kod.Length; i++)
            {
                int y = bul(Convert.ToString(kod[i]));

                sifre += alfabe[((kilit1 * y) + kilit2) % 29];
            }

            label1.Text = sifre;

        }

        

        private void button2_Click_1(object sender, EventArgs e)
        {
            String kod = label1.Text;
            String cozum = "";

            while ((kilit1 * kilit1ters) % 29 != 1)
            {
                kilit1ters++;
            }


            for (int i = 0; i < kod.Length; i++)
            {
                int y = bul(Convert.ToString(kod[i]));

                cozum += alfabe[((y - kilit2) * kilit1ters) % 29];
            }
            label2.Text = cozum;
        }
    }
}
