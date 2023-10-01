package controller;


import java.io.FileOutputStream;




import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import dao.BrinquedoDAO;
import model.Brinquedo;
@MultipartConfig
@WebServlet("/CreateAndFind")
public class CreateAndFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		   throws ServletException, IOException {
	   BrinquedoDAO dao;
	   Brinquedo brinquedo = new Brinquedo();
	   String cmd = request.getParameter("cmd");
	   
	   try {
		   if (cmd.equals("incluir")) {
			   try {
				   brinquedo.setNome(request.getParameter("nome"));
				   brinquedo.setDescricao(request.getParameter("descricao"));
				   brinquedo.setCategoria(request.getParameter("categoria"));
				   brinquedo.setMarca(request.getParameter("marca"));
				   brinquedo.setPreco(Double.parseDouble(request.getParameter("preco")));
				   brinquedo.setDetalhes(request.getParameter("detalhes"));
				   
				   try {
					   Part file = request.getPart("imagem");
					   brinquedo.imagem = file.getSubmittedFileName();
					   String uploadPath = "C:\\Users\\guilherme.pompeu\\OneDrive\\analise pwi\\Área de Trabalho\\projetoteste\\src\\main\\webapp\\imgToy/" 
					   + brinquedo.imagem;
					   FileOutputStream fos = new FileOutputStream(uploadPath);
					   InputStream is = file.getInputStream();
					   
					   byte[] data = new byte[is.available()];
					   is.read(data);
					   fos.write(data);
					   fos.close();
				   }catch(Exception e) {
					   e.printStackTrace();
				   }
				   
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
			   
		   } else if (cmd.equals("atualizar")) {
			   
			   brinquedo.setCod_produto(Integer.parseInt(request.getParameter("txtId")));
			   brinquedo.setNome(request.getParameter("nome"));
			   brinquedo.setDescricao(request.getParameter("descricao"));
			   brinquedo.setCategoria(request.getParameter("categoria"));
			   brinquedo.setMarca(request.getParameter("marca"));
			   brinquedo.setPreco(Double.parseDouble(request.getParameter("preco")));
			   brinquedo.setDetalhes(request.getParameter("detalhes"));
			   
			   Part filePart = request.getPart("imagem");
			   String fileName = filePart.getSubmittedFileName();

				if (filePart != null && !fileName.isEmpty()) {
					brinquedo.setImagem(fileName);
					String uploadPath = "C:\\Users\\guilherme.pompeu\\OneDrive\\analise pwi\\Área de Trabalho\\projetoteste\\src\\main\\webapp\\imgToy/" 
							   + fileName;
					FileOutputStream fos = new FileOutputStream(uploadPath);
					   InputStream is = filePart.getInputStream();
					   
					   byte[] data = new byte[is.available()];
					   is.read(data);
					   fos.write(data);
					   fos.close();
				} else {
					brinquedo.setImagem(request.getParameter("imagem2"));
				}

		   } else {
			   
			   brinquedo.setCod_produto(Integer.parseInt(request.getParameter("txtId")));
		   }
		   
	   }catch (Exception e) {
			// System.out.println("Erro na data");
			System.out.println(e.getMessage());
		}
	   try {
		   RequestDispatcher rd = null;
		   
		   dao = new BrinquedoDAO();
		   
		   if (cmd.equalsIgnoreCase("incluir")) {
			   dao.inserir(brinquedo);
			   rd = request.getRequestDispatcher("CreateAndFind?cmd=listar");
			   
		   } else if (cmd.equalsIgnoreCase("listar")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			  rd = request.getRequestDispatcher("jsp/home.jsp");
			  
		   } else if (cmd.equalsIgnoreCase("buscar")) {
			   brinquedo = dao.buscarBrinquedo(brinquedo.getCod_produto());
			   HttpSession session = request.getSession(true);
			   session.setAttribute("brinquedo", brinquedo);
			   rd = request.getRequestDispatcher("jsp/viewproduto.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("BrinquedoMasculino")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			   rd = request.getRequestDispatcher("jsp/bonecomasculino.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("BrinquedoFeminino")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			   rd = request.getRequestDispatcher("jsp/bonecafeminina.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("Carrinhos")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			   rd = request.getRequestDispatcher("jsp/carros.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("Lego")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			   rd = request.getRequestDispatcher("jsp/lego.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("adiministracao")) {
			   List<Brinquedo> listaBrinquedo = dao.todosBrinquedos();
			   request.setAttribute("listaBrinquedo", listaBrinquedo);
			   rd = request.getRequestDispatcher("jsp/adm.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("editar")) {
			   brinquedo = dao.buscarBrinquedo(brinquedo.getCod_produto());
			   HttpSession session = request.getSession(true);
			   session.setAttribute("brinquedo", brinquedo);
			   rd = request.getRequestDispatcher("jsp/editar.jsp");
			   
		   } else if (cmd.equalsIgnoreCase("atualizar")) {
			   dao.atualizar(brinquedo);
			   rd = request.getRequestDispatcher("/CreateAndFind?cmd=adiministracao");
		   } else if (cmd.equalsIgnoreCase("excluir")) {
			   dao.excluir(brinquedo);
			   rd = request.getRequestDispatcher("/CreateAndFind?cmd=adiministracao");
		   }
		   
		   rd.forward(request, response);
		   
	   }catch (Exception e) {
		   e.printStackTrace();
			throw new ServletException(e);
	   }
	   
	   
	
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	
}
