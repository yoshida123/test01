package test02;

public class Hero {
	private String name;	//名前の宣言
	private int hp;		//HPの宣言
	
	public void sleep(){
		this.hp = 100;		//this.hp は自分自身のhpフィールド
		System.out.println(this.name + "は、眠って回復した！");		//this.name は自分自身のnameフィールド
	}
	public void sit(int sec){		//int sec は何秒座るか引き数で受け取る
		this.hp  += sec;		//座る秒数だけHPを回復
		System.out.println(this.name + "は、" + sec + "秒座った！");
	}
	public void slip(){
		this.hp -= 5;
		System.out.println(this.name + "は、転んだ！");
		System.out.println("5のダメージ");
	}
	public void run(){
		System.out.println(this.name + "は、逃げ出した！");
		System.out.println("GAMEOVER");
		System.out.println("最終HPは" + this.hp + "でした");
	}
	public String getName(){
		return this.name;
	}
	public void setName(String name){
		if(name == null || name.length() < 3){	//nullであってはならなず、3文字以上
			throw new IllegalArgumentException("設定されようとしている名前が異常です");
		}
		this.name = name;
	}
	public int getHp(){
		return this.hp;
	}
	public void setHp(int hp){
		if(hp < 0){		//HPは0以上であり、負の値が設定されそうになったら0が設定されるようにする
			this.hp = 0;
		}else{
			this.hp = hp;
		}
	}
}
