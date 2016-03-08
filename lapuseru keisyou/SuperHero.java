package test02;

//基本的にはHeroクラスと同じと宣言　(違いだけを記述する)
public class SuperHero extends Hero{
	
	//今回追加したフィールド
	private boolean flying;
	
	//今回追加したfly()メソッド
	public void fly(){
		this.flying = true;
		System.out.println("飛び上がった！");
	}
	
	//今回追加したland()メソッド
	public void land(){
		this.flying = false;
		System.out.println("着地した！");
	}
}
