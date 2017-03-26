package phms;

import java.util.*;

public class Index {
        static Scanner sc = new Scanner(System.in);

        public static void main(String[] args) {
                // TODO Auto-generated method stub
                entry_point ep = new entry_point();

                while(true){
                        System.out.println("1. Create Account");
                        System.out.println("2. Login");
                        System.out.println("3. Exit");
                        System.out.print("Choice : ");
                        int choice = sc.nextInt();
                        if(choice == 3)
                                break;
                        switch(choice){
                                case 1: ep.create_Account();
                                break;
                                case 2: ep.login();
                                break;
                                default: System.out.println("Enter correct choice");
                        }
                }
                sc.close();
        }

}
