package server;

import java.io.*;
import java.net.*;
import java.util.Timer;
import java.util.TimerTask;
/**
 *
 * @author enes
 */
public class Clients extends Thread{

    DataOutputStream dos;
    DataInputStream dis;
    Socket socket;
    String text = null,eski = null,gelen = null,id = null;
    Timer timer;
    TimerTask task;

    int sayac = 0;
    
    File file;
    FileWriter fileWriter;
    BufferedWriter bWriter;
    
    
    public Clients(Socket socket,int id,String text){
    
        this.socket = socket;
        this.id = Integer.toString(id);
        this.text = text;
    }
    
    public void dosya(String str) throws IOException{
        file = new File(text);
        fileWriter = new FileWriter(file, true);
        bWriter = new BufferedWriter(fileWriter);
        bWriter.write(str);
        bWriter.close();
        fileWriter.close();
    }
            
    
    public void baglan() throws IOException{
        
        dosya("Server: "+id+" Baðlandý.\n");
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        char name[] = {'/','n','a','m','e'};
        
        while(true){//Geleni txt belgesine yaz.
            try {
                gelen = dis.readUTF();
                sayac = 0;
                if(gelen.length()>5){
                    int i = 0;
                    while(i < 5){
                        if(gelen.charAt(i) == name[i]){
                            i++;
                        }
                        else{
                            break;
                        }
                    }
                    if(i == 5){
                        char dizi[] = gelen.toCharArray();
                        char dizi2[] = new char[dizi.length-5];
                        int j = 0;
                        for (int k = i; k < dizi.length; k++) {
                            dizi2[j] = dizi[k];
                            j++;
                        }
                        eski = id;
                        id = new String(dizi2);
                        dosya(eski+" kiþisi adýný "+id+" ile deðiþtirdi.\n");  
                    }
                    else{
                        dosya(id+":&"+gelen+"\n");
                    }
                }
                else{
                    dosya(id+":&"+gelen+"\n");
                }
            } catch (Exception e) {
                dosya(id +" Ayrýldý.");
                break;   
            }
        }    
        timer.cancel();//task iptal et
        timer.purge();//task yoksa timer durdur
        socket.close();
    }
       
    public void gonder(String giden){
    
        try {
            dos.writeUTF(giden);
        } catch (Exception e) {
        }
    } 
    
    @Override
    public void run() {
        timer = new Timer();
        task = new TimerTask() {
            @Override
            public void run() {
                System.out.println(sayac);
                sayac++;
                if(sayac == 10){
                    try {
                        gonder("Server: Baðlantýnýz Kesildi!(Time Out)");
                        dosya("Server: " + id +"Baðlantýsý Koptu!(Time Out!)");
                        socket.close();
                    } catch (Exception e) {
                    }
                    timer.cancel();
                    timer.purge();
                }
            }
         };
        timer.schedule(task,0,10000000);
        System.out.println("Baðlantý Bekleniyor...");
        try {
            baglan();
        } catch (Exception e) {
            System.out.println("Hata!!!");
        }  
    }  
}
