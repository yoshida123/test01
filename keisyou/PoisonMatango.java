package test02;

public class PoisonMatango extends Matango {
	private int poisonCount = 5;
	
	//コンストラクタする前に親クラスのコンストラクタを呼び出さなんければならないルールに基づいて
	public PoisonMatango(char suffix){
		super(suffix);
	}
	public void attack(Hero h){
		
		//親クラスのメソッドを呼び出して使う
		super.attack(h);
	
		//もし０でなければ
		if(this.poisonCount != 0){
			System.out.println("さらに毒の胞子をばらまいた！");
			
			//HeroのHPの5/1のダメージをHeroにあたえる
			int dmg = h.getHp() / 5;
			h.setHp(h.getHp() - dmg);
			System.out.println(dmg + "ポイントのダメージをあたえた！");
			
			//カウントを1減らす
			this.poisonCount --;
		}
	}
}
