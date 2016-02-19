package jp.javadrive;

public class Maou {
	String name;
	int hp = 100;
	static final int MAX_HP = 100;
	
	public Maou(String name, int hp){
		this.name = name;
		this.hp = hp;
	}
	
	public Maou(String name){
		this(name,MAX_HP);
	}
	
	public void yousu(){
		System.out.println("「" + this.name + "のターン」");
		System.out.println(this.name + "は、「その程度か」と言わんばかりに様子をうかがっている。");
		System.out.println();
	}
}
