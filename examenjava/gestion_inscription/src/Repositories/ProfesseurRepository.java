package Repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Entities.Classe;
import Entities.Professeur;

public class ProfesseurRepository {
    public void AjouterProf(Professeur professeur){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iage", "root", "");
            Statement statement = conn.createStatement();
            String sql = String.format("INSERT INTO `professeur` (`nci_prof`, `nom_completprof`, `Grade`) "
                      + " VALUES ('"+professeur.getNci()+"' , '"+professeur.getNomCompletp()+"' , '"+professeur.getGrade()+"')");
            int nbreLigne = statement.executeUpdate(sql);
            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver : " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD : " + e.getMessage());
        }
    }

    public List<Professeur> selectAll(){
         List<Professeur> professeurs=new ArrayList<>();
        try {
    
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iage"
                       , "root", "");
           Statement statement = conn.createStatement();
           String sql="SELECT * FROM professeur";
           ResultSet rs=statement.executeQuery(sql);
            while (rs.next()) {
               //Une ligne ==> rs de la requete
                Professeur professeur =new Professeur();
                professeur.setNci(rs.getString("nci_prof"));
                professeur.setNomCompletp(rs.getString("nom_completprof"));
                professeur.setGrade(rs.getString("Grade"));
                professeurs.add(professeur);
                
            }
            statement.close();
            rs.close();
            conn.close();
       } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver");
       }
       catch (SQLException e) {
         System.out.println("Erreur de Connexion a la BD");
       }
       return professeurs;
      }

      public Professeur selectProfById(int profId) {
        Professeur professeur = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iage", "root", "");
            Statement statement = conn.createStatement();
            String sql = "SELECT * FROM professeur WHERE id_prof = " + profId;
            ResultSet rs = statement.executeQuery(sql);
            
            if (rs.next()) {
                professeur = new Professeur();
                professeur.setIdp(rs.getInt("id_prof"));
                professeur.setNci(rs.getString("nci_prof"));
                professeur.setNomCompletp(rs.getString("nom_completprof"));
                professeur.setGrade(rs.getString("Grade"));
            }
            
            rs.close();
            statement.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur de chargement de Driver : " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Erreur de Connexion a la BD : " + e.getMessage());
        }
        return professeur;
    }
    
    
}
