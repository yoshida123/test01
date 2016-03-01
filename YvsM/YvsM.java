package test02;

public class YvsM {

	public static void main(String[] args) {
		Yusya y = new Yusya("勇者");		//Yusyaクラスからインスタンスを生成し、変数 y に入れる
		Maou m = new Maou("魔王");		//Maouクラスからインスタンスを生成し、変数 m に入れる
		boolean act = false;
		
		System.out.println(y.name + "様、" + m.name + "を倒せばあなたの勝利です！頑張って下さい・・・");
		System.out.println();
		y.status();		//ステータスを表示させる
		m.status();
		
		while(y.hp > 0 & m.hp > 0){		//勇者かつ魔王のHPが0以上の間 while で回す
			act = y.menu(m);		//魔王の m
			if (act) {
				m.randomNumber(y);	//勇者の y
			}
		}
		if(y.hp < 0){		//もし、勇者のHPが0以下になった場合終了
			System.out.println(y.name + "の負けです" + " [GAMEOVER]");
		}else{				//でなければ魔王のHPが0以下になったとして終了
			System.out.println(m.name + "を倒した！" + "[COMPLETE]");
		}
	}

}
