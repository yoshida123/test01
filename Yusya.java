package jp.javadrive;

public class Yusya {
	String name;
	int hp = 50;
	static final int MAX_HP = 50;	//最大HPとMPの値は変わることなく決まっているので static finalとした
	int mp = 20;
	static final int MAX_MP = 20;
	
	public Yusya(String name, int hp, int mp){
		this.name = name;	//名前・HP・MPを指定してインスタンス化できる
		this.hp = hp;
		this.mp = mp;
	}
	
	public Yusya(String name, int hp){
		this(name,hp,MAX_MP);	//名前・HPを指定してインスタンス化、その際MPは最大MPとして初期化される
	}
	
	public Yusya(String name){
		this(name,MAX_HP);	//名前だけを指定してインスタンス化、その際HPとMPは最大HPとMPとして初期化される
	}
	public void status(){
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void damage(){
		System.out.println("「" + this.name + "のターン」");
		this.hp -= 10;
		System.out.println(this.name + "は、魔王へ攻撃したが返り討ちされた・・。");
		System.out.println("10のダメージ");
		System.out.println("残りHP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	
	public void heal(){
		System.out.println("「" + this.name + "のターン」");
		this.mp -= 5;
		this.hp = this.MAX_HP;
		System.out.println(this.name + "は、ヒールを使った。");
		System.out.println("HPが全回復、MP5消費");
		System.out.println("残りHP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	
	public void tikai(){
		System.out.println("「" + this.name + "のターン」");
		System.out.println(this.name + "は、必ず強くなって戻ってくると誓いその場を後にした・・。");
		System.out.println();
	}
}