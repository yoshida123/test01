package test02;

public class Wizard2 {
	private int hp;
	private int mp;
	private String name;
	private Wand wand;
	
	public void heal(Hero h){
		int basePoint = 10;		//基本回復ポイント
		int recovPoint = (int) (basePoint * this.getWand().getPower());	//杖による増幅
		h.setHp(h.getHp() + recovPoint);	//勇者のHPを回復させる
		
		System.out.println(h.getName() + "のHPを" + recovPoint + "回復した！");
	}
	public int getHp(){
		return this.hp;
	}
	public void setHp(int hp){
		if(hp < 0){		//HPは0以上であり、負の値が設定されそうになったら0が設定されるようにする
			this.hp = 0;
		}else{
		this.hp = hp;	
		}
	}
	public int getMp(){
		return this.mp;
	}
	public void setMp(int mp){
		if(mp < 0){
			throw new IllegalArgumentException("設定されようとしているMPが異常です");
		}
		this.mp = mp;
	}
	public String getName(){
		return this.name;
	}
	public void setName(String name){
		if(name == null || name.length() < 3){	//nullであってはならなず、3文字以上
			throw new IllegalArgumentException("魔法使いに設定されようとしている名前が異常です");
		}
		this.name = name;
	}
	public Wand getWand(){
		return this.wand;
	}
	public void setWand(Wand wand){
		if(wand == null){
			if(wand == null){
				throw new IllegalArgumentException("設定されようとしている杖がnullです");
			}
		}
		this.wand = wand;
	}
}
