package test02;

public class Main3 {

	public static void main(String[] args) {
		Sword s = new Sword();		//newでインスタンを生み出している
		s.name = "炎の剣";
		s.damage = 10;
		s.rarity = "★★★☆☆";
		
		Hero2 h = new Hero2();		//newでインスタンを生み出している
		h.name = "ミナト";
		h.hp = 100;
		h.sword = s;		//swordフィールドに生成済みの剣インスタンスを代入
		
		System.out.println("現在の武器は" + h.sword.name);		//h.sword.name → 勇者 「の」 剣 「の」 名前
		System.out.println(h.sword.name + "のレア度は" + h.sword.rarity);	//h.sword.rarity → 勇者 「の」 剣 「の」 レア度
		
	}

}
