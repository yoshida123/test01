package jp.javadrive;

public class YvsM {

	public static void main(String[] args) {
		Yusya y = new Yusya("ミナト");
		Maou m = new Maou("魔王");
		
		y.status();
		y.damage();
		m.yousu();
		y.heal();
		y.tikai();
	}

}
