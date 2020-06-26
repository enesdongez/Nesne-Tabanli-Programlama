package client;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
/**
 *
 * @author enes
 */
public class ClientJ extends javax.swing.JFrame{
    static DataOutputStream dos;
    static DataInputStream dis;
    static Socket socket;
    static String ip = "";
    public static String password="1234";
            //"127.0.0.1";
    static int port;
            //8888;
    static InetAddress inetAddress;
    static SocketAddress socketAddress;
    static boolean connect = false , tekrar = false;
    static int deger = 0,ckod = 5;
    Random r = new Random();
    
    String protokol = "";
    String icerik = "";
    
    
    static String mess = "",ckelime = "",pkelime = "",vkelime = "",kelime = "",
            vcumle = "",cumle = "",gelencumle = "",yontem = "",name = "",duzenli = "",sifre = "";
    
    static String[] yontemDizi = null, icerikDizi = null;
    
    static String anahtar = "HÜSEYİNMERTNEYSE";
    
    String[] metinDizi = null,duzenliDizi = null;
    static String[] gelenDizi = null,sifreliDizi = null;
    
    static char[] alfabe = {'A','B','C','Ç','D','E','F','G','Ğ','H','I','İ','J','K','L','M','N','O','Ö','P','R','S','Ş','T','U','Ü','V','Y','Z'};
    
    //char[] kAlfabe = {'a','b','c','ç','d','e','f','g','ğ','h','ı','i','j','k','l','m','n','o','ö','p','q','r','s','ş','t','u','ü','v','w','x','y','z'};
    //char[] bAlfabe = {'A','B','C','Ç','D','E','F','G','Ğ','H','I','İ','J','K','L','M','N','O','Ö','P','Q','R','S','Ş','T','U','Ü','V','W','X','Y','Z'};
    
    
    static char[] palfabe = {'A','B','C','D','E','F','G','Ğ','H','I','J','K','L','M','N','O','P','R','S','Ş','T','U','V','Y','Z'};
    static char[][] kalfabe = null;
    static char[][] valfabe = null;
    
    
    
    static void createkalfabe(){//5x5 tablo oluşturma
        kalfabe = new char[5][5];
        int sayac = 0;
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                kalfabe[i][j] = palfabe[sayac];
                sayac++;
            }
        }
    }
    
    static void createvalfabe(){
        int t = 0;
        valfabe = new char[29][29];
        for (int i = 0; i < 29; i++) {//vigenere tablosu oluşturma
            for (int j = 0; j < 29; j++) {
                t= t % 29;
                valfabe[i][j] = alfabe[t];
                t++;
            }
            t++;
        }
    }
    /**
     * Creates new form ClientJ
     */
    public ClientJ() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jButton2 = new javax.swing.JButton();
        jTextField2 = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();

        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jButton4 = new javax.swing.JButton();
     
        jCheckBox2 = new javax.swing.JCheckBox();
        jCheckBox3 = new javax.swing.JCheckBox();
      

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Socket Chat");
        setResizable(false);

        jButton1.setText("Gönder");
        jButton1.setEnabled(false);
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jTextField1.setEnabled(false);
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField1KeyPressed(evt);
            }
        });

        jTextArea1.setEditable(false);
        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        jButton2.setText("Kullanıcı Adı Belirle");
        jButton2.setEnabled(false);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jTextField2.setEnabled(false);
        jTextField2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField2KeyPressed(evt);
            }
        });

        jLabel2.setText("< <");

        jButton3.setText("Tekrar Bağlan");
        jButton3.setEnabled(false);
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

      

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel1.setText("");

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel3.setText("");

        jLabel4.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel4.setText("");

        jLabel5.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabel5.setText("");

        jButton4.setText("Server'a Bağlan");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

       
        
        jCheckBox2.setText("Polybius Şifreleme");
        jCheckBox2.setEnabled(false);
       
        jCheckBox3.setText("Vigenere Şifreleme");
        jCheckBox3.setEnabled(false);
  

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jScrollPane1)
                        .addContainerGap())
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                    .addComponent(jTextField1)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 174, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jLabel2)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jButton2)
                                    .addGap(18, 18, 18)
                                    .addComponent(jButton3)))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel1)
                                .addGap(4, 4, 4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel4)
                                .addGap(4, 4, 4)
                                .addGap(4, 4, 4)
                                .addComponent(jLabel5)
                                .addGap(4, 4, 4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jButton4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                               ))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 22, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        	.addComponent(jCheckBox2)
                            
                            )
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        	.addComponent(jCheckBox3)
                            ))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 364, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        
                            .addComponent(jCheckBox2)
                            .addComponent(jCheckBox3)
                            .addComponent(jButton1))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        	
                            .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2)
                            .addComponent(jButton2)
                            .addComponent(jButton3))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                      
                            .addComponent(jLabel1)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jButton4)
                            ))
                    .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        String str = "";
        if((str = jTextField1.getText()).length() > 0){
            try {
                //dos.writeUTF(str);
                dos.writeUTF(encryption(str.toUpperCase(new java.util.Locale("tr" , "TR"))));
                jTextField1.setText(null);
            } catch (IOException ex) {
            }
        }   
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        try {
            if(jTextField2.getText().length() > 0){
                dos.writeUTF("/name"+jTextField2.getText());
                jTextField2.setText(null); 
            }  
        } catch (Exception e) {
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        try {
            socket = new Socket();
            socket.connect(socketAddress);
            System.out.println("Bağlandı");
            jTextArea1.append("Tekrar Bağlandınız.\n");
            dos = new DataOutputStream(socket.getOutputStream());
            dis = new DataInputStream(socket.getInputStream());
            connect = true;
            tekrar = true;

        
            jButton3.setEnabled(false);
            jTextField1.setEnabled(true);
            jTextField2.setEnabled(true);
            jButton1.setEnabled(true);
            jButton2.setEnabled(true);
         
            jCheckBox2.setEnabled(true);
            jCheckBox3.setEnabled(true);
        
        } catch (IOException ex) {
            System.out.println("Bağlanılamadı");
            JOptionPane.showMessageDialog(null, "Sunucuya Ulaşılamıyor !!!\nTekrar Bağlanmayı Deneyebilir veya Yeni IP-PORT Girebilirsiniz." , "UYARI !!!" , JOptionPane.PLAIN_MESSAGE);
        }
        
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed

        ip = "127.0.0.1";
        port = 8888;
        
        try {
            inetAddress = InetAddress.getByName(ip);
            socketAddress = new InetSocketAddress(inetAddress, port);
            socket = new Socket();
        } catch (Exception e) {
        }
        try {
            socket.connect(socketAddress);
            tekrar = true;
            connect = true;
            System.out.println("Bağlandı");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null , "Bağlantı Kurulamadı!\nIP-PORT kontrol edin." , "UYARI" , JOptionPane.PLAIN_MESSAGE);
        }
            
        try{
            dos = new DataOutputStream(socket.getOutputStream());
            dis = new DataInputStream(socket.getInputStream());

            jButton4.setEnabled(false);
            jTextField1.setEnabled(true);
            jTextField2.setEnabled(true);
            jButton1.setEnabled(true);
            jButton2.setEnabled(true);
            jCheckBox2.setEnabled(true);
            jCheckBox3.setEnabled(true);
          
      
        } catch (Exception e) {
        }
        
    }//GEN-LAST:event_jButton4ActionPerformed



    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyPressed
        if(evt.getKeyCode() == KeyEvent.VK_ENTER){
            jButton1.doClick();
        }
    }//GEN-LAST:event_jTextField1KeyPressed

    private void jTextField2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField2KeyPressed
        if(evt.getKeyCode() == KeyEvent.VK_ENTER){
            jButton2.doClick();
        }
    }//GEN-LAST:event_jTextField2KeyPressed

   
    
    public static void baglan() throws IOException, InterruptedException{

        while(true){
            Thread.sleep(500);
            if(tekrar == false){
                break;
            }
            try {
                socket = new Socket();
                socket.connect(socketAddress);
                System.out.println("Bağlandı");
                jTextArea1.append("Tekrar Bağlandınız.\n");
         
                dos = new DataOutputStream(socket.getOutputStream());
                dis = new DataInputStream(socket.getInputStream());

                jTextField1.setEnabled(true);
                jTextField2.setEnabled(true);
                jButton1.setEnabled(true);
                jButton2.setEnabled(true);
                jButton3.setEnabled(false);
            
         
                break;
            } catch (Exception e) {
                System.out.println("Bağlanılamadı");
            }
        }
    }
   // static Md5 object=new Md5();
    public String encryption(String mesaj){
        
        protokol = "";
        icerik = "";
        
        metinDizi = (mesaj.toUpperCase(new java.util.Locale("tr", "TR"))).split(" ");
        /*if(jCheckBox1.isSelected() == true)//MD5 Şifresi
        {
            cumle = "";
      
          
            
            cumle = Md5.encrypt(mesaj, password);
            //return "#1 " + cumle;
            protokol += "#1,";
            icerik += (cumle + ",");
        }*/
        if(jCheckBox2.isSelected() == true)//Polybius Å�ifresi
        {
            duzenli = "";
            sifre = "";
            for(int i = 0;i < metinDizi.length;i++){
                for (int j = 0; j < metinDizi[i].length();j++) {

                    if(metinDizi[i].charAt(j) == 'Ç'){
                        duzenli += 'C';
                    }
                    else if(metinDizi[i].charAt(j) == 'İ'){
                        duzenli += 'I';
                    }
                    else if(metinDizi[i].charAt(j) == 'Ö'){
                        duzenli += 'O';
                    }
                    else if(metinDizi[i].charAt(j) == 'Ü'){
                        duzenli += 'U';
                    }
                    else{
                        duzenli+=metinDizi[i].charAt(j);
                    }
                }
            duzenli += ' ';
            }
            
            duzenliDizi = duzenli.split(" ");
            for (String var : duzenliDizi) {
                for (char var2 : var.toCharArray()) {
                    for(int i = 0;i < 5;i++){
                        for (int j = 0; j < 5; j++) {
                            if(var2 == kalfabe[i][j]){
                                sifre += (Integer.toString(i+1) + Integer.toString(j+1) + " ");
                            }
                        }
                    } 
                }
                sifre += "! ";
            } 
            //return "#2 " + sifre;
            protokol += "#2,";
            icerik += (sifre + ",");
        }
        
        
        
        if(jCheckBox3.isSelected() == true)//Vigenere Şifresi
        {
            String duzenliMesaj = mesaj;
            vcumle = "";
            int tut = 0,tut2 = 0;
            for (int j = 0; j < duzenliMesaj.length(); j++) {//Şifreleme YaptÄ±ÄŸÄ±mÄ±z BÃ¶lÃ¼m
                if(duzenliMesaj.charAt(j) == ' '){
                    vcumle += '!';
                    continue;
                }
                for (int l = 0; l < 29; l++) {
                    if(alfabe[l] == anahtar.charAt(j%(anahtar.length()))){
                        tut = l;
                    }
                    if(alfabe[l]==duzenliMesaj.charAt(j)){
                        tut2 = l;
                    }
                }

                vcumle += valfabe[tut][tut2];
                System.out.print(valfabe[tut][tut2]);   

            }
            //return "#3 " + vcumle;
            protokol += "#3,";
            icerik += (vcumle + ",");
        }
        
        
      
        
        
       
        if( jCheckBox2.isSelected() == false && jCheckBox3.isSelected() == false ){
            try {
               // System.out.println("yaz");
                //return "#9 " + mesaj;
                protokol += "#9,";
                icerik += mesaj;
            } catch (Exception e) {
            }
        }
        return protokol + "&" + icerik;
    }
    
    
    /*public static String MD5(String metin){//MD5 Şifresi Çözümü
        ckelime = "";
        ckelime=object.decrypt(metin, password);
        return ckelime;
    }*/
    
    public static String polybius(String metin){
        pkelime = "";
        sifreliDizi = metin.split(" ");
        
        for(String var : sifreliDizi){
            System.out.println(var);
            if(var.charAt(0) == '!'){
                pkelime += ' ';
                continue;
            }
            else
            {
                int sayi = Integer.parseInt(var);
                int onlar = sayi / 10;
                int birler = sayi % 10;
                
                pkelime += kalfabe[onlar-1][birler-1];
                
            }
        }
        
        return pkelime;
    }
    
    public static String vigenere(String metin){
        vkelime = "";
        int tut = 0,tut2 = 0;
        for (int j = 0; j < metin.length(); j++) {
            if(metin.charAt(j) == '!'){
                vkelime += ' ';
                continue;
            }
            for (int l = 0; l < 29; l++) {
                if(alfabe[l] == anahtar.charAt(j%(anahtar.length()))){
                    tut = l;
                }
                if(alfabe[l]==metin.charAt(j)){
                    tut2 = l;
                }
            }
            
            int a = tut2 - (tut);
            if(a < 0){
                a += 29;
            }
            vkelime += alfabe[a];  
        }
        System.out.print("\n");
        System.out.println(vkelime);
        
        return vkelime;
    }
    
    public static String cit(String metin){
        metin = metin;
        int dongu = 0;
        String citkelime = "";
        System.out.println(metin.length());
        if(metin.length() % 2 == 1){
            dongu = (metin.length() / 2) + 1;
        }
        else
            dongu = metin.length() / 2;
        
        for (int i = 0; i < dongu; i++){
            if(metin.length() % 2 == 1){
                if((i + dongu) == metin.length()){
                    citkelime += metin.charAt(i);
                }
                else{
                    citkelime += metin.charAt(i);
                    citkelime += metin.charAt(i+dongu);
                }
            }
            else{
                citkelime += metin.charAt(i);
                citkelime += metin.charAt(i+dongu);
            }
        }
        System.out.println(citkelime);

        return citkelime;
    }
    
    
    public static String sutun(String metin){
        metin = (metin).replace(" ", "");
        String sifre = "";
        int kok = (int)Math.sqrt(metin.length());
        
        for(int i = 0; i < kok; i++){
            for(int j = 0; j < kok; j++){
                sifre += metin.charAt(i + (j * kok));
            }
        }
        System.out.println(sifre);
        return sifre;
    }
    

    /**
     * @param args the command line arguments
     */
    
    
    
    public static void main(String args[]) throws InterruptedException{
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ClientJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ClientJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ClientJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ClientJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        new ClientJ().setVisible(true);
 
        
        try {
            //baglan();
        } catch (Exception e) {
        }
        
        createkalfabe();
        createvalfabe();
        
        int sayac = 0;
        
        while(true){
            Thread.sleep(250);
            while(connect == true){
                try {
                    mess = dis.readUTF();
                    sayac = 0;
                    System.out.println(mess);
                    gelenDizi = mess.split("&");
                    name = gelenDizi[0];
                    yontem = gelenDizi[1];
                    gelencumle = gelenDizi[2];

                    yontemDizi = yontem.split(",");
                    icerikDizi = gelencumle.split(",");
                    
                    System.out.println(mess.charAt(0) +" " + mess.charAt(1));
                    
                    if(yontemDizi[0].charAt(0) == '#' && yontemDizi[0].charAt(1) == '0'){
                        System.out.println("kes");
                        socket.close();
                        jButton3.setEnabled(true); 
                        jTextField1.setEnabled(false);
                        jTextField2.setEnabled(false);
                        jButton1.setEnabled(false);
                        jButton2.setEnabled(false);
                     
                        jCheckBox2.setEnabled(false);
                        jCheckBox3.setEnabled(false);
                
                        connect = false;
                        tekrar = false;
                        jTextArea1.append("Bağlantınız Koptu !!! (Time Out)\n");
                        JOptionPane.showMessageDialog(null, "Belirli Bir Süredir Aktif Olmadığınız İçin Sunucudan Atıldınız." , "UYARI !!!" , JOptionPane.PLAIN_MESSAGE);
                        break;
                    } 
                    
                    for(int i = 0; i < yontemDizi.length; i++){

                        if(yontemDizi[i].charAt(0) == '#' && yontemDizi[i].charAt(1) == '9'){
                            jTextArea1.append(name + " " + icerikDizi[i] + "\n");
                            break;
                        }
                        if(yontemDizi[i].charAt(0) == '#' && yontemDizi[i].charAt(1) == '1'){
                            //jTextArea1.append(name + " " + MD5(icerikDizi[i]) + "\n");
                        }
                        else if(yontemDizi[i].charAt(0) == '#' && yontemDizi[i].charAt(1) == '2'){
                            jTextArea1.append(name + " Polybius: " + polybius(icerikDizi[i]) + "\n");
                        }
                        else if(yontemDizi[i].charAt(0) == '#' && yontemDizi[i].charAt(1) == '3'){
                            jTextArea1.append(name + " Vigenere: " + vigenere(icerikDizi[i]) + "\n");
                        }
               
                    }
                    
                    
                } catch (Exception e) {
                    sayac++;
                    System.out.println("gelemedi");
                    if(sayac > 100000000){
                        try {
                            socket.close();
                            jTextField1.setEnabled(false);
                            jTextField2.setEnabled(false);
                            jButton1.setEnabled(false);
                            jButton2.setEnabled(false);
                      
                            jCheckBox2.setEnabled(false);
                            jCheckBox3.setEnabled(false);
                            JOptionPane.showMessageDialog(null, "Sunucuya Ulaşılamıyor !!!\nSunucuya Otomatik Olarak Bağlanılacaktır.\nTekrar Bağlanana Kadar Bekleyeblir veya Yeni IP-PORT Girebilirsiniz." , "UYARI !!!" , JOptionPane.PLAIN_MESSAGE);   
                            jTextArea1.append("Bağlantınız Koptu !!!\n");
                      
                            baglan();
                        } catch (IOException ex) {}
                    }
                }
            }
        }  
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private static javax.swing.JButton jButton1;
    private static javax.swing.JButton jButton2;
    private static javax.swing.JButton jButton3;
    private static javax.swing.JButton jButton4;

    private static javax.swing.JCheckBox jCheckBox2;
    private static javax.swing.JCheckBox jCheckBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private static javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private static javax.swing.JTextArea jTextArea1;
    private static javax.swing.JTextField jTextField1;
    private static javax.swing.JTextField jTextField2;

    // End of variables declaration//GEN-END:variables


}