
package gui;

import logic.aksiyon;
import main.*;
import java.awt.Color;
import java.awt.Font;
import javax.swing.ListSelectionModel;
import javax.swing.*;

public class gui {
    public JFrame fr;
    public JPanel jp,jp1,jp2,jp3,jp4,jp5,jp6,jp7;
    public JButton b1,b2,paraçek,parayatır,krediöde,hesaph,digerhesap,çıkış,hızlıçek,hparayatır,köde,onayla,geridön;
    public JLabel lab,ekran,lab1,lab2,ekran1,ekran2,adı,bakiye,bakiyeTL,avans,slash,avanskalan,avansTL,ekran3,ekran4,ekran5,ekran6,ekran7;
    public JTextField t1,t3,t4;
    public JPasswordField txtSifre;
    public JRadioButton r1,r2,dr1,dr2,dr3;
    public ButtonGroup grpButonlar,grp;
    aksiyon aks=null;
    public JList list;
    public DefaultListModel listmodel;

    
    public gui(){
     unit();
    
   
    }
     
    public void unit(){
      
     fr=new JFrame();
     jp=new JPanel();
     jp1=new JPanel();
     jp2=new JPanel();
     jp3=new JPanel();
     jp4=new JPanel();
     jp5=new JPanel();
     jp6=new JPanel();
     jp7=new JPanel();
     b1=new JButton("Giriş");
     paraçek=new JButton("Para Çek");
     parayatır=new JButton("Para Yatır");
     krediöde=new JButton("Kredi Öde");
     hesaph=new JButton("Hesap Hareketleri");
     digerhesap=new JButton("Diğer Hesaplar");
     çıkış=new JButton("Çıkış");
     hızlıçek=new JButton("Hızlı Çek");
     hparayatır=new JButton("Para Yatır");
     köde=new JButton("Öde");
     onayla=new JButton("Onayla");
     geridön=new JButton("Geri Dön");
     ekran=new JLabel();
     ekran1=new JLabel();
     ekran2=new JLabel();
     ekran3=new JLabel();
     ekran4=new JLabel();
     ekran5=new JLabel();
     ekran6=new JLabel();
     ekran7=new JLabel();
     t1=new JTextField();
     txtSifre=new JPasswordField();
     t3=new JTextField();
     t4=new JTextField();
     lab=new JLabel("Kullanıcı Adı:");
     lab1=new JLabel("Şifre:");
     lab2=new JLabel();
     adı=new JLabel();
     bakiye=new JLabel("Kullanılabilir Bakiye:");
     bakiyeTL=new JLabel("5000");
     slash=new JLabel("/");
     avans=new JLabel("Avans Kullanılan/Limit:");
     avanskalan=new JLabel("1500");
     avansTL=new JLabel("2500");
     r1=new JRadioButton("Güncel Borç");
     r2=new JRadioButton("Minimum Ödeme");
     dr1=new JRadioButton();
     dr2=new JRadioButton();
     dr3=new JRadioButton();
     
     
     
     
     Font fn=new Font("Times New Roman",Font.BOLD,20);
     lab.setFont(fn);
     lab1.setFont(fn);
     adı.setFont(fn);
     bakiye.setFont(fn);
     bakiyeTL.setFont(fn);
     avans.setFont(fn);
     avansTL.setFont(fn);
     avanskalan.setFont(fn);
     slash.setFont(fn);
     r1.setFont(fn);
     r2.setFont(fn);
     dr1.setFont(fn);
     dr2.setFont(fn);
     dr3.setFont(fn);
     
     
     
    
     r1.setForeground(Color.white);
     r2.setForeground(Color.white);
     adı.setForeground(Color.white);
     bakiye.setForeground(Color.white);
     bakiyeTL.setForeground(Color.white);
     avans.setForeground(Color.white);
     avansTL.setForeground(Color.white);
     avanskalan.setForeground(Color.white);
     slash.setForeground(Color.white);
     b1.setForeground(Color.white);
     paraçek.setForeground(Color.white);
     parayatır.setForeground(Color.white);
     krediöde.setForeground(Color.white);
     hesaph.setForeground(Color.white);
     digerhesap.setForeground(Color.white);
     çıkış.setForeground(Color.white);
     köde.setForeground(Color.white);
     hparayatır.setForeground(Color.white);
     hızlıçek.setForeground(Color.white);
     geridön.setForeground(Color.white);
     
     
     r1.setBackground(new java.awt.Color(102,102,102));
     r2.setBackground(new java.awt.Color(102,102,102));
     dr1.setBackground(new java.awt.Color(102,102,102));
     dr2.setBackground(new java.awt.Color(102,102,102));
     dr3.setBackground(new java.awt.Color(102,102,102));
     
     
     b1.setBackground(new java.awt.Color(153,153,153));
     b1.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     b1.setForeground(Color.black);
     paraçek.setBackground(new java.awt.Color(153,153,153));
     paraçek.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     parayatır.setBackground(new java.awt.Color(153,153,153));
     parayatır.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     krediöde.setBackground(new java.awt.Color(153,153,153));
     krediöde.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     hesaph.setBackground(new java.awt.Color(153,153,153));
     hesaph.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     digerhesap.setBackground(new java.awt.Color(153,153,153));
     digerhesap.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     çıkış.setBackground(new java.awt.Color(153,153,153));
     çıkış.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     köde.setBackground(new java.awt.Color(153,153,153));
     köde.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     hparayatır.setBackground(new java.awt.Color(153,153,153));
     hparayatır.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     hızlıçek.setBackground(new java.awt.Color(153,153,153));
     hızlıçek.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     geridön.setBackground(new java.awt.Color(153,153,153));
     geridön.setBorder(BorderFactory.createLineBorder(new java.awt.Color(153,153,153)));
     
     
     grpButonlar = new ButtonGroup();
     grpButonlar.add(r1);  
     grpButonlar.add(r2);
     
     
     grp=new ButtonGroup();
     grp.add(dr1);
     grp.add(dr2);
     grp.add(dr3);
     
     
     Icon ic=new ImageIcon(getClass().getResource("/logic/ana.png"));
     ekran.setIcon(ic);
     Icon ic1=new ImageIcon(getClass().getResource("/logic/ana1.png"));
     ekran1.setIcon(ic1);
     Icon ic2=new ImageIcon(getClass().getResource("/logic/ana2.png"));
     ekran2.setIcon(ic2);
     Icon ic3=new ImageIcon(getClass().getResource("/logic/ana3.png"));
     ekran3.setIcon(ic3);
     Icon ic4=new ImageIcon(getClass().getResource("/logic/ana3.png"));
     ekran4.setIcon(ic4);
     Icon ic5=new ImageIcon(getClass().getResource("/logic/ana3.png"));
     ekran5.setIcon(ic5);
     Icon ic6=new ImageIcon(getClass().getResource("/logic/ana_1.png"));
     ekran6.setIcon(ic6);
     Icon ic7=new ImageIcon(getClass().getResource("/logic/ana_1_1.png"));
     ekran7.setIcon(ic7);
     
     
    
     
     fr.setBounds(310,100,618,550);
     fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
     
    
      
       b1.addActionListener(getAks());
       çıkış.addActionListener(getAks());
       paraçek.addActionListener(getAks());
       hızlıçek.addActionListener(getAks());
       parayatır.addActionListener(getAks());
       hparayatır.addActionListener(getAks());
       krediöde.addActionListener(getAks());
       hesaph.addActionListener(getAks());
       köde.addActionListener(getAks());
       digerhesap.addActionListener(getAks());
       onayla.addActionListener(getAks());
       geridön.addActionListener(getAks());
    
       
     jp7.setLayout(null);  
     jp7.setVisible(false);
     jp7.setBounds(0,0,600,600);
     geridön.setBounds(450,410,90,40);
     ekran7.setBounds(0,0,600,600);
     listmodel = new DefaultListModel();
     list=new JList(listmodel);  
     list.setSelectionMode(2);
     list.setSelectedIndex(0);
     list.setVisibleRowCount(5);
     JScrollPane listscrollpane=new JScrollPane(list);
     list.setBounds(90,150,300,300);
     jp7.add(list);
     jp7.add(listscrollpane);
     
     
      
     
     jp5.setVisible(false);
     jp5.setBounds(0,520,600,150);
     jp5.setLayout(null); 
     ekran5.setBounds(0,0,600,150);  
     r1.setBounds(220,0,150,30);
     r2.setBounds(220,30,200,30);
     köde.setBounds(260,60,90,40);
     r1.setActionCommand("1");
     r2.setActionCommand("2");
     
     
       
     jp4.setVisible(false);
     jp4.setBounds(0,520,600,150);
     jp4.setLayout(null); 
     ekran4.setBounds(0,0,600,150);
     hparayatır.setBounds(255,50,90,40);
     t4.setBounds(225,0,150,40);
      
      
     jp3.setVisible(false);
     jp3.setBounds(0,520,600,150);
     jp3.setLayout(null); 
     ekran3.setBounds(0,0,600,150);
     hızlıçek.setBounds(255,50,90,40);
     t3.setBounds(225,0,150,40);
       
     
     jp1.setVisible(false);
     jp1.setLayout(null);
     jp1.setBounds(0,0,600,300);
     ekran1.setBounds(0,0,600,300);
     adı.setBounds(75,130,180,25);
     bakiye.setBounds(75,160,200,25);
     bakiyeTL.setBounds(255,160,100,25);
     avans.setBounds(75,190,230,25);
     avanskalan.setBounds(274,190,100,25);
     slash.setBounds(317,190,20,25);
     avansTL.setBounds(325,190,100,25);
     
     
     jp2.setVisible(false);
     jp2.setBounds(0,300,600,250);
     jp2.setLayout(null);  
     ekran2.setBounds(0,290,600,250);  
     paraçek.setBounds(90,300,160,50);
     parayatır.setBounds(350,300,160,50);
     hesaph.setBounds(90,360,160,50);
     krediöde.setBounds(350,360,160,50);
     digerhesap.setBounds(90,420,160,50);
     çıkış.setBounds(350,420,160,50);
     
     
     jp.setLayout(null);
     jp.setBounds(0,0,600,600);
     jp.setVisible(true);
     lab.setBounds(75,200,150,30);
     t1.setBounds(190,200,200,30);
     lab1.setBounds(75,250,100,30);
     txtSifre.setBounds(190,250,200,30);
     b1.setBounds(150,300,90,40);
     ekran.setBounds(0,0,600,600);
     
     
     jp6.setVisible(false);
     jp6.setBounds(0,0,600,600);
     jp6.setLayout(null);
     ekran6.setBounds(0,0,600,600);
     onayla.setBounds(75,280,90,40);
     dr1.setBounds(75,130,420,50);
     dr2.setBounds(75,180,420,50);
     dr3.setBounds(75,230,420,50);
     dr1.setActionCommand("4");
     dr2.setActionCommand("5");
     dr3.setActionCommand("6");
    
     
     
     
    
     jp1.add(adı);
     jp1.add(bakiye);
     jp1.add(bakiyeTL);
     jp1.add(avans);
     jp1.add(avansTL);
     jp1.add(slash);
     jp1.add(avanskalan);
     jp1.add(ekran1);
     
     
     jp2.add(paraçek);
     jp2.add(parayatır);
     jp2.add(hesaph);
     jp2.add(krediöde);
     jp2.add(digerhesap);
     jp2.add(çıkış);
     jp2.add(ekran2);
     
     
     jp.add(lab);
     jp.add(lab1);
     jp.add(b1);
     jp.add(t1);
     jp.add(txtSifre);
     jp.add(ekran);
     
     
     jp3.add(t3);
     jp3.add(hızlıçek);
     jp3.add(ekran3);
    
     
     jp4.add(hparayatır);
     jp4.add(t4);
     jp4.add(ekran4);
     
     
     jp5.add(r1);
     jp5.add(r2);
     jp5.add(köde);
     jp5.add(ekran5);
     
     
     jp6.add(dr1);
     jp6.add(dr2);
     jp6.add(dr3);
     jp6.add(onayla);
     jp6.add(ekran6);
     
     
     jp7.add(geridön);
     jp7.add(ekran7);
     
     
     fr.add(jp7);
     fr.add(jp6);
     fr.add(jp5);
     fr.add(jp4);
     fr.add(jp3);
     fr.add(jp);
     fr.add(jp1);
     fr.add(jp2);
     
     fr.setVisible(true);
    }

    public aksiyon getAks() {
        if(aks==null)
            aks=new aksiyon(this);
        return aks;
    }

    public void setAks(aksiyon aks) {
        this.aks = aks;
    }

  
}
