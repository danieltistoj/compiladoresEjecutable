/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author Usuario
 */
public class cmd {
    public String ejectuarExe(){
        String resultado="";
      try {
            
            String comando = "powershell Get-content \"src/proyectoCompiladores/prueba.txt\" | \"src/proyectoCompiladores/proyecto.exe\"";
            Process process = Runtime.getRuntime().exec("cmd /c "+comando);
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String resultOfExecution = null;
            while((resultOfExecution = br.readLine()) != null){
                resultado = resultado + resultOfExecution + "\n";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }  
     return resultado; 
    }
 }
