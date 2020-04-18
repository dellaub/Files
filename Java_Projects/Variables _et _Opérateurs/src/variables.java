/home/dellaub/Downloads/jdk-13.0.2/binpublic class variables {

    public static void main(String[] args) {
//----------------------------------------------------------------------------------------------------------------------
// VARIABLES DE TYPE NUMÉRIQUE
// <types de variables> <nom de la variable>;
// <nom de la variable> = <numéro>;

        System.out.println("------------------------------------");
        System.out.println("   VARIABLES DE TYPES NUMÉRIQUES");
        System.out.print("\n  <types de variables> <nom de la variable>;");
        System.out.println("\n  <nom de la variable> = <numéro>;");
        System.out.println("\n------------------------------------");

//----------------------------------------------------------------------------------------------------------------------
// byte

            byte max;
            max = 127;
            byte min;
            min = -128;

//Imprime les valeurs limite de la variable -BYTE-


            System.out.println("\nVariable <byte> (1 octet)       <byte> <nom>;");
            System.out.println("                                <nom> = <n>;\n");
            System.out.print("Nombres entiers maximum: n = ");
            System.out.println(max);
            System.out.print("Nombres entiers minimum: n = ");
            System.out.println(min);
            System.out.println("------------------------------------");

//----------------------------------------------------------------------------------------------------------------------
// short

                short maxb;
                maxb = 32767;
                short minb;
                minb = -32768;

//Imprime les valeurs limite de la variable -SHORT-

                System.out.println("\nVariable <short> (2 octets)     <short> <nom>");
                System.out.println("                                <nom> = <n>;\n");
                System.out.print("Nombres entiers maximum: n = ");
                System.out.println(maxb);
                System.out.print("Nombres entiers minimum: n = ");
                System.out.println(minb);
                System.out.println("------------------------------------");

//----------------------------------------------------------------------------------------------------------------------
// int
                    int maxc;
                    maxc = 2147483647;
                    int minc;
                    minc = -2147483648;

//Imprime les valeurs limite de la variable -INT-

                    System.out.println("\nVariable <int> (3 octets)       <int> <nom>;");
                    System.out.println("                                <nom> = <n>;\n");
                    System.out.print("Nombres entiers maximum: n = ");
                    System.out.println(maxc);
                    System.out.print("Nombres entiers minimum: n = ");
                    System.out.println(minc);
                    System.out.println("------------------------------------");

//----------------------------------------------------------------------------------------------------------------------
// long
                        long maxd;
                        maxd = 9223372036854775807L;
                        long mind;
                        mind = -9223372036854775808L;


//Imprime les valeurs limite de la variable -LONG-

                        System.out.println("\nVariable <long> (8 octets)      <long> <nom>;");
                        System.out.println("                                <nom> = <n(L)>;\n");
                        System.out.print("Nombres entiers maximum: n = ");
                        System.out.print(maxd);
                        System.out.println("L");
                        System.out.print("Nombres entiers minimum: n = ");
                        System.out.print(mind);
                        System.out.println("L");
                        System.out.println("------------------------------------");


//----------------------------------------------------------------------------------------------------------------------
// float
                            float decimal;
                            decimal = 2.0f;
                            float pi;
                            pi = 3.141592653f;

//Imprime les valeurs limite de la variable -FLOAT-

                            System.out.println("\nVariable <float> (4 octets)     <float> <nom>;");
                            System.out.println("                                <nom> = <n(f)>;\n");
                            System.out.print("Une seul case décimale: n = ");
                            System.out.print(decimal);
                            System.out.println("f");
                            System.out.print("multiples cases décimales (7 max): n = ");
                            System.out.print(pi);
                            System.out.println("f");
                            System.out.println("------------------------------------");
//----------------------------------------------------------------------------------------------------------------------
// double

                                double longfloat;
                                longfloat = 0.333333333333333333334d;

//Imprime les valeurs limite de la variable -FLOAT-

                                System.out.println("\nVariable <double> (8 octets)    <double> <nom>;");
                                System.out.println("                                <nom> = <n(d)>;\n");
                                System.out.print("multiples cases décimales (16 max): n = ");
                                System.out.print(longfloat);
                                System.out.println("d");
                                System.out.println("--------------------------------------------\n\n");

//----------------------------------------------------------------------------------------------------------------------
// VARIABLES STOCKANT UN CARACTÈRE

                                    System.out.println("--------------------------------------------");
                                    System.out.println("   VARIABLES STOCKANT UN(des) CARACTÈRE(s)");
                                    System.out.println("--------------------------------------------");

//----------------------------------------------------------------------------------------------------------------------
// char
                                        char caracterel;
                                        caracterel = 'B';
                                        char caracteren;
                                        caracteren = '5';
                                        char caracteres;
                                        caracteres = '#';

                                            System.out.println("\nVariable <char>               <char> <nom>;");
                                            System.out.println("                              <nom> = <1 caractère>;\n");
                                            System.out.println("Example : La lettre '" + caracterel + "' est un caractère.");
                                            System.out.println("          Le numéro '" + caracteren + "' est un caractère.");
                                            System.out.println("          Le symbole '" + caracteres + "' est un caractère.");
                                            System.out.println("------------------------------------------------------");
//----------------------------------------------------------------------------------------------------------------------
// boolean
                                                boolean questiona;
                                                questiona = true;
                                                boolean questionb;
                                                questionb = false;

                                                    System.out.println("\nVariable <boolean>               <boolean> <nom>;");
                                                    System.out.println("                                 <nom> = <true> / <false>;\n");
                                                    System.out.println("Example : " + questiona + " ou " + questionb);
                                                    System.out.println("------------------------------------------------------");
//----------------------------------------------------------------------------------------------------------------------
// string (objet)
                                                        String phrase;
                                                        phrase = "!§1001è01001ç h e l l o ^$$010ù-µ00^[ç§  ";

                                                            System.out.println("\nObjet <String>               <String> <nom>;");
                                                            System.out.println("                             <nom> = <une phrase>;\n");
                                                            System.out.println("Example d'une chaine de caractères : " + phrase);
                                                            System.out.println("------------------------------------------------------");
//----------------------------------------------------------------------------------------------------------------------




    }


}
