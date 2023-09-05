package bank;

import java.util.ArrayList;

public class Banca {
	
	private ArrayList<ContoCorrente> conti;
	
	public Banca() {
		conti = new ArrayList<>();
		conti.add(new ContoCorrente("A001", "Mario Rossi", 1500));
		conti.add(new ContoCorrente("B131", "Flavia Verdi", 4500));
		conti.add(new ContoCorrente("A487", "Carlo Verdone", 11200));
	}

	public ArrayList<ContoCorrente> getConti() {
		return conti;
	}
	
	public boolean contoExists(String numero) {
		return findByCodice(numero) != null;
	}

	public void eseguiBonifico(String da, String a, float importo) throws Exception {
		if(!contoExists(da) || !contoExists(a)) {
			throw new Exception("Il conto mittente o destinatario non esiste");
		}
		ContoCorrente mittente = findByCodice(da);
		ContoCorrente destinatario = findByCodice(a);
		
		if(mittente.getSaldo() < importo) {
			throw new Exception("Il saldo del mittente è inferiore all'importo scelto: " + importo);
		}
		
		mittente.setSaldo(mittente.getSaldo() - importo);
		destinatario.setSaldo(destinatario.getSaldo() + importo);
		
	}
	
	// torna un ContoCorrente se lo trova nell'ArrayList, oppure null se non lo trova
	public ContoCorrente findByCodice(String numero) {
		// ciclo su tutti conti
		for(ContoCorrente c : conti) {
			// se il numero l'ho trovato -> lo ritorno
			if(c.getNumero().equals(numero)) {
				return c;
			}
		}
		// -> null
		return null;
	}
	
	/*
	 * 100 A1 -> A2
	 * 
	 * TRANSACTION
	 * UPDATE Conticorrenti SET saldo = saldo - 100 WHERE cod_conto = 'A1'
	 * UPDATE Conticorrenti SET saldo = saldo + 100 WHERE cod_conto = 'A2' XXX
	 * 
	 * -> ROLLBACK()
	 * -> COMMIT()
	 * 
	 */
	
}
