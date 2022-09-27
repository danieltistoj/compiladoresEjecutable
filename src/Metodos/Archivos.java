/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;
import Metodos.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import static java.time.Clock.system;
/**
 *
 * @author Usuario
 */
public class Archivos {
    public void crearArchivo(String archivo){
        File fl = new File(archivo);
        PrintWriter pw;
        try {
           pw=new PrintWriter(fl);
           pw.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    public void escribirArchivo(String archivo,String texto){
        System.out.println("entro");
        System.out.println(archivo);
        System.out.println(texto);
        File fl = new File(archivo);
        try {
            PrintWriter pw = new PrintWriter(new FileWriter(fl,true));
            pw.println(texto);
            pw.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace(System.out);
        }catch (IOException e) {
            e.printStackTrace(System.out);
        }
    }
}
