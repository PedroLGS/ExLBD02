package controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Onibus;
import model.Viagem;
import persistence.IViagemDao;
import persistence.ViagemDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ViagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViagemServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String botao = request.getParameter("botao");
		
		IViagemDao viagemdao = new ViagemDao();
		String erro = "";
		List<Viagem> listv = new ArrayList<Viagem>();
		List<Onibus> listo = new ArrayList<Onibus>();
		
		try {
			System.out.println(botao);
			if(botao.equalsIgnoreCase("Viagem")) {
				System.out.println("ListarViagem");
				listv = viagemdao.consultaViagem();
				System.out.println("Fim");
			}
			else {
				if(botao.equalsIgnoreCase("Onibus")) {
					System.out.println("ListarOnibus");
					listo = viagemdao.consultaOnibus();
					System.out.println("Fim");
				}
			}
		} catch(SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
			System.out.println(erro);
		}finally{
			RequestDispatcher rd = request.getRequestDispatcher("viagem.jsp");
			request.setAttribute("viagem", listv);
			request.setAttribute("onibus", listo);
			request.setAttribute("erro", erro);
			rd.forward(request,response);
		}		
	}
}
