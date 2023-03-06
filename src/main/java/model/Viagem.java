package model;

public class Viagem {
	
	private int codigo;
	private String onibus;
	private String hora_saida;
	private String hora_chegada;
	private String partida;
	private String destino;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getOnibus() {
		return onibus;
	}
	public void setOnibus(String onibus) {
		this.onibus = onibus;
	}
	public String getHora_saida() {
		return hora_saida;
	}
	public void setHora_saida(String hora_saida) {
		this.hora_saida = hora_saida;
	}
	public String getHora_chegada() {
		return hora_chegada;
	}
	public void setHora_chegada(String hora_chegada) {
		this.hora_chegada = hora_chegada;
	}
	public String getPartida() {
		return partida;
	}
	public void setPartida(String partida) {
		this.partida = partida;
	}
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	@Override
	public String toString() {
		return "Viagem [codigo=" + codigo + ", onibus=" + onibus + ", hora_saida="
				+ hora_saida + ", hora_chegada=" + hora_chegada + ", partida=" + partida + ", destino=" + destino + "]";
	}
}