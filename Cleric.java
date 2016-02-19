package jp.javadrive;

public class Cleric {
	String name;
	int hp = 50;
	static final int MAX_HP = 50;
	int mp = 10;
	static final int MAX_MP = 10;
	
	public Cleric(String name, int hp, int mp){
		this.name = name;
		this.hp = hp;
		this.mp = mp;
	}
	
	public Cleric(String name, int hp){
		this(name,hp,Cleric.MAX_MP);
	}
	
	public Cleric(String name){
		this(name, Cleric.MAX_HP);
	}
	
	public void selfAid(){
		System.out.println("ステータス：HP" + this.hp + " " + "MP" + this.mp);
		
		System.out.println("「" + this.name + "のターン」");
		System.out.println(this.name + "はセルフエイドを唱えた！(MP消費5)");
		this.hp = this.MAX_HP;
		this.mp -= 5;
		System.out.println("HPが最大まで回復した。");
		System.out.println("残りMPは" + this.mp + "です。");
		System.out.println();
	}
		public int pray(int sec){
			System.out.println("「" + this.name + "のターン」");
			System.out.println(this.name + "は、" + sec + "秒間天に祈った！");
			int recover = new java.util.Random().nextInt(3) + sec;
			int recoverActual = Math.min(this.MAX_MP - this.mp,recover);	/*Math.maxどちらか(大きい方)を代入、その
			 																逆がmin(小さい方)*/
			
			this.mp += recoverActual;
			System.out.println("MPが" + recoverActual + "回復した。");
			System.out.println("最終MPは" + this.mp + "です。");
			return recoverActual;	//retrun文はメソッドの終了も行うのでこの後に処理を書いても実行できない
			
		}
}
