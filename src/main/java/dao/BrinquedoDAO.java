package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Brinquedo;
import util.ConnectionFactory;

public class BrinquedoDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private Brinquedo brinquedo;

	public BrinquedoDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("Not Connected" + e.getMessage());
		}
	}

	public void inserir(Brinquedo brinquedo) throws Exception {

		if (brinquedo == null)
			throw new Exception("!ERRO : sem valor, porfavor insira os valores necessários");
		try {
			String sql = "INSERT INTO produtos (descricao, categoria, marca, preco, detalhes,imagem, nome) values"
					+ "(?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, brinquedo.getDescricao());
			stmt.setString(2, brinquedo.getCategoria());
			stmt.setString(3, brinquedo.getMarca());
			stmt.setDouble(4, brinquedo.getPreco());
			stmt.setString(5, brinquedo.getDetalhes());
			stmt.setString(6, brinquedo.imagem);
			stmt.setString(7, brinquedo.getNome());

			stmt.executeUpdate();
		} catch (SQLException sqle) {

			throw new Exception("NOT INSERT TO DATABASE" + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, stmt);
		}
	}

	public List<Brinquedo> todosBrinquedos() throws Exception {
		try {
			stmt = conn.prepareStatement("SELECT * FROM produtos");
			rs = stmt.executeQuery();
			List<Brinquedo> list = new ArrayList<Brinquedo>();
			while (rs.next()) {
				int cod_produto = rs.getInt("cod_produto");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				Double preco = rs.getDouble("preco");
				String detalhes = rs.getString("detalhes");
				String imagem = rs.getString("imagem");
				String nome = rs.getString("nome");
				list.add(new Brinquedo(cod_produto, descricao, categoria, marca, preco, detalhes, imagem, nome));
			}
			return list;
		} catch (Exception sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, stmt, rs);
		}
	}

	public ArrayList<Brinquedo> mostrartodos() {
		try {
			ArrayList<Brinquedo> mostrar = new ArrayList<>();
			String sql = "SELECT  * FROM produtos";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int cod_produto = rs.getInt("cod_produto");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				Double preco = rs.getDouble("preco");
				String detalhes = rs.getString("detalhes");
				String imagem = rs.getString("imagem");
				String nome = rs.getString("nome");
				mostrar.add(new Brinquedo(cod_produto, descricao, categoria, marca, preco, detalhes, imagem, nome));
			}

			ConnectionFactory.closeConnection(conn, stmt, rs);
			return mostrar;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
	public Brinquedo buscarBrinquedo(int Cod_produto) throws Exception{
		
		try {
			String sql = "SELECT * FROM produtos WHERE cod_produto = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Cod_produto);
			rs = stmt.executeQuery();
			if (rs.next()) {
				int cod_produto = rs.getInt("cod_produto");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				Double preco = rs.getDouble("preco");
				String detalhes = rs.getString("detalhes");
				String imagem = rs.getString("imagem");
				String nome = rs.getString("nome");
				
				brinquedo = new Brinquedo(cod_produto, descricao, categoria, marca, preco, detalhes, imagem, nome);
			}
			return brinquedo;
		}catch(SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, stmt, rs);
		}
	}
	
	public void atualizar(Brinquedo brinquedo) throws Exception {
		if (brinquedo == null) {
			throw new Exception("Valor não pode estar vazio");
		}
		try {
			String sql = "UPDATE produtos SET descricao=?, categoria=?, marca=?, preco=?, detalhes=?, imagem=?, nome=?"
					+ "WHERE Cod_produto=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, brinquedo.getDescricao());
			stmt.setString(2, brinquedo.getCategoria());
			stmt.setString(3, brinquedo.getMarca());
			stmt.setDouble(4, brinquedo.getPreco());
			stmt.setString(5, brinquedo.getDetalhes());
			stmt.setString(6, brinquedo.imagem);
			stmt.setString(7, brinquedo.getNome());
			stmt.setInt(8, brinquedo.getCod_produto());
			stmt.executeUpdate();
		}catch(SQLException sqle) {
			throw new Exception("Not update data" + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, stmt);
		}
	}
	
	public void excluir(Brinquedo brinquedo) throws Exception{
		try {
			String sql = "DELETE FROM produtos WHERE cod_produto = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, brinquedo.getCod_produto());
			stmt.executeUpdate();
		}catch (SQLException sqle) {
			System.out.println("Not delete to database" + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, stmt);
		}
	}
	
	
	
	
}
