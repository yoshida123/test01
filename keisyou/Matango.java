package test02;

public class Matango {
	
	//private → 自分自身のクラスのみ
	private static final int MAX_HP = 50;
	
	private String name;
	private int hp;
	
	//雑魚的として量産する時にAやBなどを付けるため
	private char suffix;
	
	//引数１つ　コンストラクタ
	public Matango(char suffix){
		this.name = name;
		this.hp = MAX_HP;
		this.suffix = suffix;
	}
	public void attack(Hero h){
		System.out.println("キノコ" + this.suffix + "の攻撃");
		System.out.println("10のダメージ");
		
		//HeroのHPを書き換えて代入するためにsetter(getterでHeroのHPの値を受け取って -10する)
		h.setHp(h.getHp() - 10);
	}
	public String getName(){
		return this.name;
	}
	public void setName(String name){
		if(name == null){
			throw new IllegalArgumentException("名前がnullである、処理を中断");
		}
		this.name = name;
	}
	public int getHp(){
		return this.hp;
	}
	public void setHp(int hp){
		if(hp < 0){
			this.hp = 0;
		}else{
			this.hp = hp;
		}
	}
}
