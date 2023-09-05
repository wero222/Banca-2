package bank;

public class ContoCorrente {
	
	private String numero;
	private String intestatario;
	private float saldo;
	
	public ContoCorrente(String numero, String intestatario, float saldo) {
		super();
		this.numero = numero;
		this.intestatario = intestatario;
		this.saldo = saldo;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getIntestatario() {
		return intestatario;
	}

	public void setIntestatario(String intestatario) {
		this.intestatario = intestatario;
	}

	public float getSaldo() {
		return saldo;
	}

	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}
	
	
	
}
