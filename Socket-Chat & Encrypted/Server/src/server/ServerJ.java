package server;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
/**
 *
 * @author enes
 */
public class ServerJ extends javax.swing.JFrame {

    static ServerSocket server = null;
    static String line = null;
    static String text = "chat.txt";//Açýlacak txt belgesi
    static int port = 8888;
    static FileReader fileReader;
    static BufferedReader br;
    
    /**
     * Creates new form ServerJ
     */
    public ServerJ() {
        initComponents();
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();


        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Socket Server");
        setBackground(new java.awt.Color(102, 102, 102));
        setResizable(false);

        jTextArea1.setEditable(false);
        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);


        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(291, 291, 291)
               
                .addContainerGap(290, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 463, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            
                .addContainerGap())
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
    }// </editor-fold>//GEN-END:initComponents
    
    
    public static void serverCreate() throws IOException {
        File file = new File(text);
        if (!file.exists()) {
            file.createNewFile();
        }
        else{
            file.delete();
            file.createNewFile();
        }
        
        try {
            server = new ServerSocket(port);
            System.out.println("Server Kuruldu");
        } catch (Exception e) {
            System.out.println("Server Kurulamadý");
        }
        
        Bridge bridge = new Bridge(server,text);
        bridge.start();
        
        fileReader = new FileReader(file);
        br = new BufferedReader(fileReader);
        
        while (true) {
            line = br.readLine();
            if(line != null){
                jTextArea1.append(line+"\n");
                for (int i = 0; i < bridge.threads.size(); i++) {
                    try {
                        bridge.threads.get(i).gonder(line);
                    } catch (Exception e) {
                        System.out.println("deneme");
                    }
                }
            } 
        }
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) throws IOException {

        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ServerJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ServerJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ServerJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ServerJ.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        new ServerJ().setVisible(true);
    

        serverCreate();

    }

    // Variables declaration - do not modify//GEN-BEGIN:variables

    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private static javax.swing.JTextArea jTextArea1;
    // End of variables declaration//GEN-END:variables
}
