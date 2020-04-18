public class Operateurs {

    public static void main(String[] args){

        //operateurs aritmétiques
        //
        //  EXAMPLE : <int> <nom;>\n          <nom> = <6 * 3;>
        //  
        //
        //  + Addition
        //
        // Example : 6 + 8;

        // Permet de additionner deux variables numériques du même type ( byte , short , int , long , float , double )

        //  - Soustraction
        //
        // Example : 9 - 4;

        // Permet de soustraire deux variables numériques du même type ( byte , short , int , long , float , double )

        //  * Multiplication
        //
        // Example : 5 * 2;

        // Permet de multiplier deux variables numériques du même type ( byte , short , int , long , float , double )

        //  / Division
        //
        // Permet de diviser deux variables numériques du même type ( byte , short , int , long , float , double )
        //
        // Example : 8 / 2;
        //
        //  % le reste d' une division
        //
        // Permet de renvoyer le reste d'une division entière entre deux variables numériques du même type ( byte , short , int , long , float , double )
        //
        // Example : 5 % 2; = 1 , car le resultat de la division est un nombre decimal (5 / 2) = 2.5   5 = (2 * 2) + 1
        //           6 % 2; = 0 , car le resultat de la division est un nombre entier (6 / 2) = 3    6 = (3 * 2)
        //
        //--------------------------------------------------------------------------------------------------------------------------------------------------------
        // Declaration des variables          def = definition         ex = example      i = int 
        //---------------------------------------------------------------------------------------------------------------------------------------------------------------------
        // Strings

            String adddef, addex, sousdef,
             sousex, muldef, mulex, divdef,
             divex, restdef, restex, restex2, separateur,
             titre, formule, ad, so, mu, di, re;

            separateur = "------------------------------------------------------------------------------------------------------\n";
            titre = "--------------------------------------- OPÉRATEURS ARITHMÉTIQUES -------------------------------------\n";
            formule = "                           EXAMPLE : <int> <nom;>\n                                     <nom> = <x * y;>\n";

            ad = "      Addition '+'\n";
            adddef = "\n                    Permet de additionner deux variables numériques du même type \n                         ( byte , short , int , long , float , double )\n";
            addex = "\n                           EXAMPLE : <int> <nom;>\n                                     <nom> = <6 + 8;>";

            so = "      Soustraction '-'\n";
            sousdef = "\n                   Permet de soustraire deux variables numériques du même type \n                          ( byte , short , int , long , float , double )\n";
            sousex = "\n                           EXAMPLE : <int> <nom;>\n                                     <nom> = <9 - 4;>";

            mu = "      Multiplication '*'\n";
            muldef = "\n                    Permet de multiplier deux variables numériques du même type \n                          ( byte , short , int , long , float , double )\n";
            mulex = "\n                           EXAMPLE : <int> <nom;>\n                                     <nom> = <5 * 2;>";

            di = "      Division '/'\n";
            divdef = "\n                    Permet de diviser deux variables numériques du même type \n                         ( byte , short , int , long , float , double )\n";
            divex = "\n                           EXAMPLE : <int> <nom;>\n                                     <nom> = <8 / 2;>";

            re = "      Reste de division '%'\n";
            restdef = "\n   Permet de renvoyer le reste d'une division entière entre deux variables numériques du même type \n                              ( byte , short , int , long , float , double )\n";
            restex = "\n                                    Example : \n          5 % 2; = 1 , car le resultat de la division est un nombre decimal (5 / 2) = 2.5   5 = (2 * 2) + 1\n";
            restex2 = "          6 % 2; = 0 , car le resultat de la division est un nombre entier (6 / 2) = 3    6 = (3 * 2)\n\n";


        //------------------------------------------------------------------------------------------------------------------------------------------------------------------
        //  Int's

            int iadd, isous, imul, idiv, irest1, irest2;

            //addition
            iadd = 6 + 8;
            
            //soustraction
            isous = 9 - 4;
            
            //multiplication
            imul = 5 * 2;
            
            //division
            idiv = 8 / 2;
            
            //reste de division
            irest1 = 5 % 2;
            irest2 = 6 % 2;

        //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        // prints

            // titre
            System.out.print(separateur);
            System.out.print(titre);
            
            // formule
            System.out.print(separateur);
            System.out.print(formule);

            //addition
            System.out.print(separateur);
            System.out.print(ad);
            System.out.print(adddef);
            System.out.println(addex + "    nom" + " = " + iadd);

            //soustraction
            System.out.print(separateur);
            System.out.print(so);
            System.out.print(sousdef);
            System.out.println(sousex + "   nom" + " = " + isous);
            
            //multiplication
            System.out.print(separateur);
            System.out.print(mu);
            System.out.print(muldef);
            System.out.println(mulex + "    nom" + " = " + imul);
            
            //division
            System.out.print(separateur);
            System.out.print(di);
            System.out.print(divdef);
            System.out.println(divex + "    nom" + " = " + idiv);
            
            //reste de division
            System.out.print(separateur);
            System.out.print(re);
            System.out.print(restdef);
            System.out.print(restex);
            System.out.print(restex2);
            System.out.print(separateur);
        //
        //Incrémantation d'une variable  (+) (*)

            




            System.out.print("----Incrémantation d'une variable----\n");

        //INTegers    
            int num1, num2, num3;
            

        //initialization des variables <int>
            num1 = num2 = num3 = 0;
            System.out.print(separateur);
            System.out.print(ad + mu);
            System.out.println("\n      <int num1, num2, num3;>");
            System.out.print(" ex1: <num1 = num2 = num3 = 0;> ");
            System.out.println("    (num1 = " + num1 + " - SANS incrémentation)");
            System.out.print(separateur);
            System.out.println("\n                        Alors...\n");
            System.out.print(separateur);

        //pour additioner la valeur de la variable de 1 Unité
            num1 = num1 + 1;
            System.out.print(" ex2: <num1 = num1 + 1;>");
            System.out.println("   (num1 = " + num1 + " - AVEC Incrémantation // num1 = 0 + 1)");

        //pour multiplier la valeur de la variable de 2 Unités
            num2 = num1 * 4;
            System.out.print(separateur);
            System.out.println("\n                        Alors...\n");
            System.out.print(separateur);
            System.out.print(" ex3: <num2 = num1 * 2;> ");
            System.out.println("   (num2 = " + num2 + " - AVEC Incrémantation // num2 = 1 * 4)\n");
            System.out.print(separateur);


        //
        //
        //
        //Décrémentation d'une variable  (-) (/).
            System.out.print("----Décrémentation d'une variable----\n");
            System.out.print(separateur);
            System.out.println(so + di);
            System.out.print(separateur);

        //initialization des variables <int>
            num3 = num2;
            System.out.print(" ex1: <num3 = num2;> ");
            System.out.println("    SANS Décrémentation // num3 = " + num3);
            System.out.print(separateur);
            System.out.println("\n                        Alors...\n");
            System.out.print(separateur);

        //pour diviser la valeur de la variable
            num3 = num3 / num3;
            System.out.print(" ex1: <num3 = num3 / num3;> ");
            System.out.println("   (num3 = 4 / 4 - AVEC Décrémentation // num3 = " + num3);
            System.out.print(separateur);
            System.out.println("\n                        Alors...\n");
            System.out.print(separateur);

        //pour soustraire la valeur de la variable
            num3 = num2 - num3;
            System.out.print(" ex1: <num3 = num2 - num3;> ");
            System.out.println("   (num3 = 4 - 1 - AVEC Décrémentation // num3 = " + num3);
            System.out.print(separateur);
        //
        // 
        //
        //
        //
        //
        //
        //
        //
        //   
    }
}
