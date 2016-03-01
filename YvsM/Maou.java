package test02;

public class Maou {
	static final int MAX_HP = 200;
	static final int SCRATCH_DAMEGE = 10;
	static final int BITE_DAMAGE = 80;
	
	String name;
	int hp;
	
	Maou(String name){
		this.name = name;
		this.hp = MAX_HP;
	}
	public void status(){		//魔王のステータスの表示
		System.out.println(this.name + "のステータス：HP" + this.hp);
		System.out.println();
	}
	public void topeep(){		//様子を窺う(何もしない)
		System.out.println("魔王はこちらの様子を窺っているようだ・・。");
		System.out.println(this.name + "のステータス：HP" + this.hp);
		System.out.println();
	}
	public void scratch(Yusya y){		//攻撃(ひっかく)	(勇者[クラス]のデータを引数として受け取る)
		y.hp -= SCRATCH_DAMEGE;					//勇者へ10のダメージ
		System.out.println(this.name + "の攻撃「ひっかく」");
		System.out.println(this.name + "は大きな爪の生えた腕を振り下ろす・・・" + y.name + "へ、" + SCRATCH_DAMEGE + "のダメージ");
		System.out.println(y.name + "の残りHP" + y.hp);
		System.out.println();
	}
	public void bite(Yusya y){		//かみつく		(勇者[クラス]のデータを引数として受け取る)
		y.hp -= BITE_DAMAGE;		//勇者へ80のダメージ
		System.out.println(this.name + "の攻撃「かみつく」");
		System.out.println(this.name + "は鋭い牙と屈強な顎で噛みついた・・・" + y.name + "へ、" + BITE_DAMAGE + "のダメージ");
		System.out.println(y.name + "の残りHP" + y.hp);
		System.out.println();
	}
	public void randomNumber(Yusya y){		//魔王の攻撃をランダムで選択	(勇者[クラス]のデータを引数として受け取る)
		int r = new java.util.Random().nextInt(10);		//0～2の乱数を発生させる
		
		switch(r){
		case 4:
			bite(y);
			break;
		case 7:
			topeep();
			break;
		default:
			scratch(y);
			break;
		}
	}
	
}
