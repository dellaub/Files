//
//
//
// Méthode "ENTRÉES DE CLAVIER" (USER INPUT)
//-------------------------------------------------------------------
// Step	1 - <import> <java.util.Scanner;>							]		nom = un nom aleatoire, peu importe le nom utilisé
//																	]			
// Step	2 - <Scanner> <nom Scanner> = <new> <Scanner(System.in);> 	]
//																	]
// Step	3 - <System.out.println("question?")>						]		=   1 question   //   1 answer     
//												  					]
// !! Step 4 - <String> <nom String> = <nom Scanner.nextLine();>	]	 
// !! or 4.1 - <int> <nom int = <nom Scanner.nextInt();>			]	
//			2 - <double> 					.nextDouble;
//			3 - <long>						.nextLong;
//			4 - <Byte>						.nextByte						]			To add more questions just repeat the process from step  2 
// Step	5 - <System.out.println("reponse")>							]				using diferent:  - Scanner names
//-------------------------------------------------------------------								 - String names and/or int names
//		
// 1  Importation / Activation de l'outil Scanner (avant la class)


import java.util.Scanner;

public class entrees_de_claviers {

	public static void main(String[] args){

		


		//	STRING INPUT

		// 2  Crée la variable qui va reconnaitre ce que va etre ecrit par l'utilisateur.

		Scanner userinput = new Scanner(System.in); 


		// 3  imprime une question.

		System.out.println("Veuillez insérer votre prénom: \n");


		// 4  Crée une String appelé "prenom" pour representer la reponse ecrite par l'utilisateur.

		String prenom = userinput.nextLine();


		// 5  Imprime la reponse avec la String "prenom".

		System.out.println("\nSalut " + prenom + " !");





		// INT INPUT

		// 2  Crée la variable  qui va reconnaitre ce que va etre ecrit par l'utilisateur.

		Scanner userinput2 = new Scanner(System.in);


		// 3  imprime une deuxième question.

		System.out.println("\n...et quel age as tu ? \n");


		// 4  Crée une int appelé "age" pour representer la reponse ecrite par l'utilisateur.

		int age = userinput2.nextInt();


		// 5  Imprime la reponse avec la int "age".

		System.out.println("\nT'as " + age + " ans! Cool!\n");
	}
}