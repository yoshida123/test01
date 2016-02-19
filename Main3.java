package jp.javadrive;

public class Main3 {

	public static void main(String[] args) {
		Cleric c1 = new Cleric("アサカ");
		c1.selfAid();
		c1.pray(3);
		System.out.println();
		
		Cleric c2 = new Cleric("ミナト",40,5);
		c2.selfAid();
		c2.pray(3);
	}

}
