package test02;

public class Yusya {
	static final int MAX_HP = 100;
	static final int MAX_MP = 35;
	static final int ATTACK_DAMAGE = 10;
	static final int FINISH_DAMAGE = 50;
	static final int HEAL_HP = 20;
	static final int USE_MP_FINISH = 10;
	static final int USE_MP_HEAL = 5;

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
		System.out.println("魔王の残りHP:" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void finisher(Maou m){	//必殺技	(魔王[クラス]のデータを引数として受け取る)
		m.hp -= FINISH_DAMAGE;					//魔王へ50のダメージ
		this.mp -= USE_MP_FINISH;				//勇者は必殺技を使うとMPを10消費する
		System.out.println(this.name + "は必殺技を繰り出した！(MP-10)" + m.name + "へ" + FINISH_DAMAGE + "のダメージ");
		System.out.println("魔王の残りHP" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void heal(){		//回復魔法
		this.hp += HEAL_HP;		//HPを20回復
		this.mp -= USE_MP_HEAL;		//回復魔法を使うとMPを10消費する
		System.out.println(this.name + "はヒールを使いHPを" + HEAL_HP + "回復(MP-" + USE_MP_HEAL + ")");
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public boolean menu(Maou m){		//メニューから選択させる	(魔王[クラス]のデータを引数として受け取る)

		boolean rc = true;

		System.out.println("メニューから操作したい数字を選択してください");
		System.out.println("[メニュー] 1:攻撃 2:必殺技 3:回復魔法");
		int selected = new java.util.Scanner(System.in).nextInt();		//キーボードから1つの整数の入力を受け取る
		switch(selected){
		case 1:
			attack(m);
			break;
		case 2:
			if (this.mp >= USE_MP_FINISH) {		//残りMPが消費MPより多ければ
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
				System.out.println("MP不足で回復出来ない！！");
				System.out.println();
				rc = false;
			}
			break;
		default:
			System.out.println("入力された数字が異常です");
			System.out.println();
			rc = false;
			break;
		}

		return rc;
	}
}
