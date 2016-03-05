package test02;

public class Yusya {
	static final int MAX_HP = 150;
	static final int MAX_MP = 70;
	static final int ATTACK_DAMAGE = 20;
	static final int FINISH_DAMAGE = 100;
	static final int HEAL_HP = 30;
	static final int USE_MP_FINISHER = 20;
	static final int USE_MP_HEAL = 10;

	String name;
	int hp;
	int mp;
	
	Yusya(String name){
		this.name = name;
		this.hp = MAX_HP;
		this.mp = MAX_MP;
	}
	public void status(){
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);	//ステータスの表示
		System.out.println();
	}
	public void attack(Maou m){		//攻撃	(魔王[クラス]のデータを引数として受け取る)
		m.hp -= ATTACK_DAMAGE;					//魔王へ10のダメージ
		System.out.println(this.name + "は" + m.name + "へ攻撃、" + ATTACK_DAMAGE + "のダメージ");
		System.out.println(m.name + "の残りHP:" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void finisher(Maou m){	//必殺技	(魔王[クラス]のデータを引数として受け取る)
		m.hp -= FINISH_DAMAGE;					//魔王へ50のダメージ
		this.mp -= USE_MP_FINISHER;				//勇者は必殺技を使うとMPを10消費する
		System.out.println(this.name + "は必殺技を繰り出した！(MP-" + USE_MP_FINISHER + ")"  + m.name + "へ" + FINISH_DAMAGE + "のダメージ");
		System.out.println(m.name + "の残りHP" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void heal(){	//回復魔法
		if(MAX_HP - this.hp < HEAL_HP){
			this.hp = MAX_HP;
			this.mp -= USE_MP_HEAL;
			System.out.println(this.name + "はヒールを使いHPを" + HEAL_HP + "回復(MP-" + USE_MP_HEAL + ")");
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}else{
			this.hp += HEAL_HP;		//HPを20回復
			this.mp -= USE_MP_HEAL;		//回復魔法を使うとMPを5消費する
			System.out.println(this.name + "はヒールを使いHPを" + HEAL_HP + "回復(MP-" + USE_MP_HEAL + ")");
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}
	}
	public boolean menu(Maou m){		//メニューから選択させる	(魔王[クラス]のデータを引数として受け取る)

		boolean rc = true;

		System.out.println(this.name + "のターンです、メニューから操作したい数字を選択してください");
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println("[メニュー] 1:攻撃 2:必殺技 3:ヒール");
		int selected = new java.util.Scanner(System.in).nextInt();		//キーボードから1つの整数の入力を受け取る
		switch(selected){
		case 1:
			attack(m);
			break;
		case 2:
			if (this.mp >= USE_MP_FINISHER) {		//残りMPが消費MPより多ければ
				finisher(m);
			} else {							//そうでなければMPが足りないということで以下の操作へ
				System.out.println("MP不足で必殺技が出せない！！");
				System.out.println();
				rc = false;
			}
			break;
		case 3:
			if (this.mp >= USE_MP_HEAL) {		//残りMPが消費MPより多ければ
				heal();
			} else {							//そうでなければMPが足りないということで以下の操作へ
				System.out.println("MP不足でヒールが使えない！");
				System.out.println();
				rc = false;
			}
			break;
		default:
			System.out.println("入力された数字は無効です");
			System.out.println();
			rc = false;
			break;
		}

		return rc;
	}
	
}
