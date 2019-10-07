
package logic;


import gui.gui;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;


public class aksiyon implements ActionListener {
  
    gui frm1=null;

    public aksiyon(gui frmm) {
        this.frm1=frmm;
        
    }
    
    @Override
    public void actionPerformed(ActionEvent event){
   
        if(event.getSource()==frm1.b1){
           
    String a=frm1.t1.getText();
      int b=Integer.parseInt(frm1.txtSifre.getText());
      if(b==123){
       
       frm1.adı.setText(a);
       frm1.dr1.setText(a+" (Vadeli Hesap) İstanbul/Ümr.");
       frm1.dr2.setText(a+" (Vadeli Hesap) İsviçre/Lozan");
       frm1.dr3.setText(a+" (Vadesiz Hesap) Trabzon/Of");
       frm1.jp1.setVisible(true);
       frm1.jp2.setVisible(true);
       frm1.jp.setVisible(false);              
         }
        }
       if(event.getSource()==frm1.çıkış){
       frm1.jp1.setVisible(false);
       frm1.jp2.setVisible(false);
       frm1.jp3.setVisible(false);
       frm1.jp4.setVisible(false);
       frm1.jp5.setVisible(false);
       frm1.fr.setSize(618,550);
       frm1.jp.setVisible(true);
       frm1.t1.setText("");
       frm1.txtSifre.setText("");
        }
      if(event.getSource()==frm1.paraçek){
        
       frm1.fr.setSize(618,698);
       frm1.jp3.setVisible(true);
       frm1.jp5.setVisible(false);
       frm1.jp4.setVisible(false);
      
            
        }
        if(event.getSource()==frm1.hızlıçek){
        int b=Integer.parseInt(frm1.t3.getText());
        if(b>Integer.parseInt(frm1.bakiyeTL.getText())){
        JOptionPane.showMessageDialog(null, "Yeterli Bakiye Yok!!", "Hata", 2);
        frm1.t3.setText("");
        }
        else{
       frm1.bakiyeTL.setText((Integer.parseInt(frm1.bakiyeTL.getText())-b)+"");
       frm1.listmodel.addElement("Para Çekildi:"+b);
       frm1.t3.setText("");
        }
        }
        if(event.getSource()==frm1.parayatır){
       frm1.fr.setSize(618,698);
       frm1.jp3.setVisible(false);
       frm1.jp5.setVisible(false);
       frm1.jp4.setVisible(true);
       
        }
        if(event.getSource()==frm1.hparayatır){
        int b=Integer.parseInt(frm1.t4.getText());
       frm1. bakiyeTL.setText((Integer.parseInt(frm1.bakiyeTL.getText())+b)+"");
       frm1.listmodel.addElement("Para Yatırıldı:"+b);
       frm1.t4.setText("");
     
        }
        if(event.getSource()==frm1.krediöde){
       frm1.fr.setSize(618,698);
       frm1.jp3.setVisible(false);
       frm1.jp4.setVisible(false);
       frm1.jp5.setVisible(true);
       
        }
        if(event.getSource()==frm1.hesaph){
        frm1.fr.setSize(618,550);
       frm1.jp1.setVisible(false);
       frm1.jp2.setVisible(false);
       frm1.jp3.setVisible(false);
       frm1.jp4.setVisible(false);
       frm1.jp5.setVisible(false);
       frm1.jp7.setVisible(true);
        }
        if(event.getSource()==frm1.geridön){
        frm1.jp7.setVisible(false);
        frm1.jp2.setVisible(true);
        frm1.jp1.setVisible(true);
        }
        if(event.getSource()==frm1.köde){
        String cmd = frm1.grpButonlar.getSelection().getActionCommand();
         if(cmd.equalsIgnoreCase("1")) {
             if(Integer.parseInt(frm1.bakiyeTL.getText())==0){
             JOptionPane.showMessageDialog(null, "Yetersiz Bakiye!!", "Hata", 2);
             }
             else if(Integer.parseInt(frm1.avanskalan.getText())>0){
            frm1.bakiyeTL.setText(Integer.parseInt(frm1.bakiyeTL.getText())-Integer.parseInt(frm1.avanskalan.getText())+"");
            
            frm1.listmodel.addElement("Kredi Ödendi:"+frm1.avanskalan.getText());
            frm1.avanskalan.setText("0");
             }
             else if(Integer.parseInt(frm1.avanskalan.getText())==0){
             JOptionPane.showMessageDialog(null, "Borç Yok!!", "Hata", 2);
        
             }
           
         }
         if(cmd.equalsIgnoreCase("2")){
                if(Integer.parseInt(frm1.bakiyeTL.getText())==0){
             JOptionPane.showMessageDialog(null, "Yetersiz Bakiye!!", "Hata", 2);
             }
                else if(Integer.parseInt(frm1.avanskalan.getText())>0){
           frm1. bakiyeTL.setText(Integer.parseInt(frm1.bakiyeTL.getText())-Integer.parseInt(frm1.avanskalan.getText())*30/100+"");
           frm1.avanskalan.setText(Integer.parseInt(frm1.avanskalan.getText())-Integer.parseInt(frm1.avanskalan.getText())*30/100+"");
           frm1.listmodel.addElement("Kredi Ödendi:"+Integer.parseInt(frm1.avanskalan.getText())*30/100);
             }
             else if(Integer.parseInt(frm1.avanskalan.getText())==0){
             JOptionPane.showMessageDialog(null, "Borç Yok!!", "Hata", 2);
        
             }
          
         }
        }
        if(event.getSource()==frm1.digerhesap){
       frm1.fr.setSize(618,550);
       frm1.jp3.setVisible(false);
       frm1.jp4.setVisible(false);
       frm1.jp1.setVisible(false);
       frm1.jp2.setVisible(false);
       frm1.jp6.setVisible(true);
        }
        if(event.getSource()==frm1.onayla){
            frm1.fr.setSize(618,550);
       
       frm1.jp1.setVisible(true);
       frm1.jp2.setVisible(true);
       frm1.jp6.setVisible(false);
        String cmd = frm1.grp.getSelection().getActionCommand();
         if(cmd.equalsIgnoreCase("6")) {
              frm1.bakiyeTL.setText("0");
             frm1.avansTL.setText("3000");
             frm1.avanskalan.setText("1000");
            
         }
         else if(cmd.equalsIgnoreCase("5")){
            frm1.bakiyeTL.setText("17000");
            frm1.avanskalan.setText("7000");
            frm1.avansTL.setText("25000");
            
         }
         else{
        frm1. avans.setVisible(true);
            frm1.bakiyeTL.setText("5000");
             frm1.avansTL.setText("2500");
             frm1.avanskalan.setText("1500");
         }
        }

    
  }
}
