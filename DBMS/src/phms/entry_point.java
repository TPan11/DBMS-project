package phms;

import java.util.Scanner;
import java.sql.*;

public class entry_point {
        static Scanner sc = new Scanner(System.in);

        private char getGender(){
                String Genderstring = sc.next();
                while(Genderstring.length()!= 1 || (Genderstring.charAt(0)!='M' && Genderstring.charAt(0)!='F')){
                        System.out.print("Enter character M/F for Gender : ");
                        Genderstring = sc.next();
                }
                return Genderstring.charAt(0);
        }

        void create_Account(){
                try{
                        //Console console = System.console();
                        System.out.println("In create account");
                        System.out.print("Enter PID: "); String PID = sc.next();
                        System.out.print("Enter DOB: "); String DOB = sc.next();
                        System.out.print("Enter Address: "); String Address = sc.next();
                        System.out.print("Enter Gender(M/F): "); char Gender = getGender();
                        System.out.print("Enter First Name: "); String First_Name = sc.next();
                        System.out.print("Enter Last Name: "); String Last_Name = sc.next();
                        //String Password = new String(console.readPassword("Please enter your password: "));
                        System.out.print("Enter Password: "); String Password = sc.next();
                }
                catch(Exception e){
                        System.out.println(e);
                }
        }

        void login(){
                login_screen ls = new login_screen();
                System.out.println("In login");
                while(true){
                        System.out.println("1. Enter Observation Data");
                        System.out.println("2. View Existing Observation Data");
                        System.out.println("3. View Alerts");
                        System.out.println("4. Update Patient Information");
                        System.out.println("5. Logout");
                        System.out.print("Choice : ");
                        int login_choice = sc.nextInt();
                        if(login_choice == 5){
                                System.out.println("Logging Out");
                                break;
                        }
                        switch(login_choice){
                                case 1: ls.write_obs_data();
                                break;
                                case 2: ls.view_obs_data();
                                break;
                                case 3: ls.view_alerts();
                                break;
                                case 4: ls.update_patient_info();
                                break;
                                default: System.out.println("Enter correct choice");
                        }
                }
        }
}
