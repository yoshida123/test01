package test02;

public class Wizard {
	private static final int MAX_HP = 100;
	private static final int MAX_MP = 200;
	private static final int CANEATTACK_DAMAGE = 10;
	private static final int FLAME_DAMAGE = 20;
	private static final int HEAL_HP = 40;
	private static final int CURE_HP = 40;
	private static final int SELFAID_MP = 40;
	private static final int USE_MP_FLAME = 10;
	private static final int USE_MP_HEAL = 10;
	private static final int USE_MP_CURE = 20;
	private static final int USE_MP_SELFAID = 100;
	
	private String name;
	private int hp;
	private int mp;
	
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
		m.setHp(m.getHp() - CANEATTACK_DAMAGE);
		System.out.println(this.name + "は" + m.getName() + "へ杖で殴って攻撃、" + CANEATTACK_DAMAGE + "のダメージ");
		System.out.println(m.getName() + "の残りHP" + m.getHp());
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println();
	}
	public void flame(Maou m){
		m.setHp(m.getHp() - FLAME_DAMAGE);
		this.mp -= USE_MP_FLAME;
		System.out.println(this.name + "は攻撃魔法「フレイム」を唱えた！(MP-" + USE_MP_FLAME + ") " + m.getName() + "へ、" + FLAME_DAMAGE + "のダメージ");
		System.out.println(m.getName() + "の残りHP" + m.getHp());
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
		if(y.getMAX_HP() - y.getHp() < CURE_HP){
			y.setHp(y.getMAX_HP());
			this.mp -= USE_MP_CURE;
			System.out.println(this.name + "は回復魔法「キュア」を唱えた！(MP-" + USE_MP_CURE + ") " + y.getName() + "のHPが" + CURE_HP + "回復");
			System.out.println(y.getName() + "のステータス：HP" + y.getHp() + " " + "MP" + y.getMp());
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}else{
			y.setHp(y.getHp() + CURE_HP);
			this.mp -= USE_MP_CURE;
			System.out.println(this.name + "は回復魔法「キュア」を唱えた！(MP-" + USE_MP_CURE + ") " + y.getName() + "のHPが" + CURE_HP + "回復");
			System.out.println(y.getName() + "のステータス：HP" + y.getHp() + " " + "MP" + y.getMp());
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}
	}
	public void selfAid(Yusya y){
		if(y.getMAX_MP() - y.getMp() < SELFAID_MP){
			y.setHp(y.getMAX_HP());
			y.setMp(y.getMAX_MP());
			this.mp -= USE_MP_SELFAID;
			System.out.println(this.name + "は、回復魔法「セルフエイド」を唱えた！(MP-" + USE_MP_SELFAID + ") " + y.getName() + "のHPが全回復" + "、MPが" + SELFAID_MP + "回復");
			System.out.println(y.getName() + "のステータス：HP" + y.getHp() + " " + "MP" + y.getMp());
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}else{
			y.setHp(y.getMAX_HP());
			y.setMp(y.getMp() + SELFAID_MP);
			this.mp -= USE_MP_SELFAID;
			System.out.println(this.name + "は、回復魔法「セルフエイド」を唱えた！(MP-" + USE_MP_SELFAID + ") " + y.getName() + "のHPが全回復" + "、MPが" + SELFAID_MP + "回復");
			System.out.println(y.getName() + "のステータス：HP" + y.getHp() + " " + "MP" + y.getMp());
			System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
			System.out.println();
		}
	}
	public boolean menu(Yusya y, Maou m){
		
		boolean rc = true;
		
		System.out.println(this.name + "のターンです、メニューから操作したい数字を選択してください");
		System.out.println(this.name + "のステータス：HP" + this.hp + " " + "MP" + this.mp);
		System.out.println("[メニュー] 1:杖で殴る(MP-0) 2:フレイム(MP-10) 3:ヒール(MP-10) 4:キュア(MP-20) 5:セルフエイド(MP-100)");
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
	public int getMp(){
		return this.mp;
	}
	public void setMp(int mp){
		if(hp < 0){
			this.mp = 0;
		}else{
			this.mp = mp;
		}
	}
}
