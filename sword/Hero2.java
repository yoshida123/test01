package test02;

public class Hero2 {
	String name;												//属性
	int hp;
	Sword sword;
	
	void attack(){												//操作
		System.out.println(this.name + "は攻撃した！");
		System.out.println("敵に5のダメージ");
	}
}
