package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Onibus;
import model.Viagem;

public class ViagemDao implements IViagemDao {

	private Connection c;
	private GenericDao gDao;
	
	public ViagemDao() {
		gDao = new GenericDao();
		try {
			c = gDao.getC();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Viagem> consultaViagem() throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM v_descricao_viagem";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Viagem> array = new ArrayList<Viagem>();
		while(rs.next()) {
			Viagem v = new Viagem();
		v.setCodigo(rs.getInt("codigo"));
		v.setOnibus(rs.getString("onibus"));
		v.setHora_saida(rs.getString("hora_saida"));
		v.setHora_chegada(rs.getString("hora_chegada"));
		v.setPartida(rs.getString("partida"));
		v.setDestino(rs.getString("destino"));
		array.add(v);
		}
		rs.close();
		ps.close();
		c.close();
		return array;
	}

	@Override
	public List<Onibus> consultaOnibus() throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM v_descricao_onibus";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Onibus> array = new ArrayList<Onibus>();
		while(rs.next()) {
			Onibus o = new Onibus();
		o.setPlaca(rs.getString("placa"));
		o.setMarca(rs.getString("marca"));
		o.setAno(rs.getInt("ano"));
		o.setDescricao(rs.getString("descricao"));
		array.add(o);
		}
		rs.close();
		ps.close();
		c.close();
		return array;
	}
}