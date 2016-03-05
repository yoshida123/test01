package test02;

public class Wizard {
	static final int MAX_HP = 100;
	static final int MAX_MP = 200;
	static final int CANEATTACK_DAMAGE = 10;
	static final int FLAME_DAMAGE = 20;
	static final int HEAL_HP = 40;
	static final int CURE_HP = 40;
	static final int SELFAID_MP = 40;
	static final int USE_MP_FLAME = 10;
	static final int USE_MP_HEAL = 10;
	static final int USE_MP_CURE = 20;
	static final int USE_MP_SELFAID = 100;
	
	String name;
	int hp;
	int mp;
	
	Wizard(String name){
		this.name = name;
		this.hp = MAX_HP;
		this.mp = MAX_MP;
	}
	public void status(){
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);	//ステータスの表示
		System.out.println();
	}
	public void caneAttack(Maou m){
		m.hp -= CANEATTACK_DAMAGE;
		System.out.println(this.name + "は" + m.name + "へ杖で殴って攻撃、" + CANEATTACK_DAMAGE + "のダメージ");
		System.out.println(m.name + "の残りHP" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void flame(Maou m){
		m.hp -= FLAME_DAMAGE;
		this.mp -= USE_MP_FLAME;
		System.out.println(this.name + "は攻撃魔法「フレイム」を唱えた！(MP-" + USE_MP_FLAME + ") " + m.name + "へ、" + FLAME_DAMAGE + "のダメージ");
		System.out.println(m.name + "の残りHP" + m.hp);
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void heal(){
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
	public void cure(Yusya y){	
		if(y.MAX_HP - y.hp < CURE_HP){
			y.hp = y.MAX_HP;
			this.mp -= USE_MP_CURE;
			System.out.println(this.name + "は回復魔法「キュア」を唱えた！(MP-" + USE_MP_CURE + ") " + y.name + "のHPが" + CURE_HP + "回復");
			System.out.println(y.name + "のステータス：HP" + y.hp + " " + "MP" + y.mp);
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}else{
			y.hp += CURE_HP;
			this.mp -= USE_MP_CURE;
			System.out.println(this.name + "は回復魔法「キュア」を唱えた！(MP-" + USE_MP_CURE + ") " + y.name + "のHPが" + CURE_HP + "回復");
			System.out.println(y.name + "のステータス：HP" + y.hp + " " + "MP" + y.mp);
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}
	}
	public void selfAid(Yusya y){
		if(y.MAX_MP - y.mp < SELFAID_MP){
			y.hp = y.MAX_HP;
			y.mp = y.MAX_MP;
			this.mp -= USE_MP_SELFAID;
			System.out.println(this.name + "は、回復魔法「セルフエイド」を唱えた！(MP-" + USE_MP_SELFAID + ") " + y.name + "のHPが全回復" + "、MPが" + SELFAID_MP + "回復");
			System.out.println(y.name + "のステータス：HP" + y.hp + " " + "MP" + y.mp);
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}else{
			y.hp = y.MAX_HP;
			y.mp += SELFAID_MP;
			this.mp -= USE_MP_SELFAID;
			System.out.println(this.name + "は、回復魔法「セルフエイド」を唱えた！(MP-" + USE_MP_SELFAID + ") " + y.name + "のHPが全回復" + "、MPが" + SELFAID_MP + "回復");
			System.out.println(y.name + "のステータス：HP" + y.hp + " " + "MP" + y.mp);
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}
	}
	public boolean menu(Yusya y, Maou m){
		
		boolean rc = true;
		
		System.out.println(this.name + "のターンです、メニューから操作したい数字を選択してください");
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println("[メニュー] 1:杖で殴る 2:フレイム 3:ヒール 4:キュア 5:セルフエイド");
		int selected = new java.util.Scanner(System.in).nextInt();		//キーボードから1つの整数の入力を受け取る
		switch(selected){
		case 1:
			caneAttack(m);
			break;
		case 2:
			if(this.mp >= USE_MP_FLAME){
				flame(m);
			}else{
				System.out.println("MP不足でフレイムが使えない！");
				System.out.println();
				rc = false;
			}
			break;
		case 3:
			if(this.mp >= USE_MP_HEAL){
				heal();
			}else{
				System.out.println("MP不足でヒールが使えない！");
				System.out.println();
				rc = false;
			}
			break;
		case 4:
			if(this.mp >= USE_MP_CURE){
				cure(y);
			}else{
				System.out.println("MP不足でキュアが使えない！");
				System.out.println();
				rc = false;
			}
			break;
		case 5:
			if(this.mp >= USE_MP_SELFAID){
				selfAid(y);
			}else{
				System.out.println("MP不足でセルフエイドが使えない！");
				System.out.println();
				rc = false;
			}
			break;
		default:
			System.out.println("入力された値は無効です");
			System.out.println();
			rc = false;
			break;
		}
		
		return rc;
	}

}
