package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Onibus;
import model.Viagem;

public interface IViagemDao {
	
	public List<Viagem> consultaViagem() throws SQLException, ClassNotFoundException;
	public List<Onibus> consultaOnibus() throws SQLException, ClassNotFoundException;
}
