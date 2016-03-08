package test02;

public class Maou {
	private static final int MAX_HP = 1000;
	private static final int SCRATCH_DAMEGE = 20;
	private static final int BITE_DAMAGE = 80;
	
	private String name;
	private int hp;
	
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
		y.setHp(y.getHp() - SCRATCH_DAMEGE);					//勇者へ10のダメージ
		System.out.println(this.name + "の攻撃「ひっかく」");
		System.out.println(this.name + "は大きな爪の生えた腕を振り下ろす・・・" + y.getName() + "へ、" + SCRATCH_DAMEGE + "のダメージ");
		System.out.println(y.getName() + "の残りHP" + y.getHp());
		if(y.getHp() <= 0){
			System.out.println(y.getName() + "が倒されました・・・");
		}
		System.out.println();
	}
	//オーバーロード(引数の値が違うメソッド)
	public void scratch(Wizard w){		//攻撃(ひっかく)	(魔法使い[クラス]のデータを引数として受け取る)
		w.setHp(w.getHp() - SCRATCH_DAMEGE);					//魔法使いへ10のダメージ
		System.out.println(this.name + "の攻撃「ひっかく」");
		System.out.println(this.name + "は大きな爪の生えた腕を振り下ろす・・・" + w.getName() + "へ、" + SCRATCH_DAMEGE + "のダメージ");
		System.out.println(w.getName() + "の残りHP" + w.getHp());
		if(w.getHp() <= 0){
			System.out.println(w.getName() + "が倒されました・・・");
		}
		System.out.println();
	}
	public void bite(Yusya y){		//かみつく		(勇者[クラス]のデータを引数として受け取る)
		y.setHp(y.getHp() - BITE_DAMAGE);		//勇者へ80のダメージ
		System.out.println(this.name + "の攻撃「かみつく」");
		System.out.println(this.name + "は鋭い牙と屈強な顎で噛みついた・・・" + y.getName() + "へ、" + BITE_DAMAGE + "のダメージ");
		System.out.println(y.getName() + "の残りHP" + y.getHp());
		if(y.getHp() <= 0){
			System.out.println(y.getName() + "が倒されました・・・");
		}
		System.out.println();
	}
	
	//オーバーロード
	public void bite(Wizard w){		//かみつく		(魔法使い[クラス]のデータを引数として受け取る)
		w.setHp(w.getHp() - BITE_DAMAGE);		//魔法使いへ80のダメージ
		System.out.println(this.name + "の攻撃「かみつく」");
		System.out.println(this.name + "は鋭い牙と屈強な顎で噛みついた・・・" + w.getName() + "へ、" + BITE_DAMAGE + "のダメージ");
		System.out.println(w.getName() + "の残りHP" + w.getHp());
		if(w.getHp() <= 0){
			System.out.println(w.getName() + "が倒されました・・・");
		}
		System.out.println();
	}
	public void randomNumber(Yusya y){		//魔王の攻撃をランダムで選択	(勇者[クラス]のデータを引数として受け取る)
		int r = new java.util.Random().nextInt(10);		//0～9の乱数を発生させる
		
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
	
	//オーバーロード
	public void randomNumber(Yusya y,Wizard w){		//魔王の攻撃をランダムで選択	(勇者と魔法使い[クラス]のデータを引数として受け取る)
		int r = new java.util.Random().nextInt(15);		//0～15の乱数を発生させる
		
		switch(r){
		case 4:
			bite(y);
			break;
		case 5:
			bite(w);
			break;
		case 7:
			topeep();
			break;
		case 0:
		case 2:
		case 6:
		case 9:
		case 11:
		case 13:
			scratch(y);
			break;
		default:
			scratch(w);
			break;
		}
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
		if(hp <= 0){
			this.hp = 0;
		}else{
			this.hp = hp;
		}
	}
}
