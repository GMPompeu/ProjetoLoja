<%@include file="../header&footer/header.html"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<title>ToyShell-Home</title>
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
			<div class="wrapper">
				<ul class="nav flex-column">
					<ul>
						<a class="nav-link" href="CreateAndFind?cmd=listar">Home</a>
					</ul>
				</ul>
			</div>
		</nav>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 10px;">
			<div class="row">
				<div class="col-md-12" id="infopag">
					<h3>
						Página Inicial <small class="text-body-secondary">: :
							Brinquedos em destaque</small>
					</h3>
					<hr>
					<a href="jsp/incluir.jsp">+Novo Brinquedo</a>
				</div>
			</div>
			<div class="col-md-4">
				<table style="width: 80vw;" class="table">
					<thead class="table-dark">
						<th scope="col">#</th>
						<th scope="col">Produto</th>
						<th width="300">Nome</th>
						<th scope="col">Categoria</th>
						<th scope="col">Marca</th>
						<th scope="col">Valor</th>
						<th width="200">Ações</th>
					</thead>
					<%
					List<Brinquedo> lista = new ArrayList<Brinquedo>();
					int count = 0;
					lista = (ArrayList) request.getAttribute("listaBrinquedo");
					for (Brinquedo a : lista) {
					%>
					<tbody>
						<tr>
							<th><%=a.getCod_produto()%></th>
							<td><img src=<%="imgToy/" + a.getImagem()%>
								style="width: 60px;"></td>
							<td><%=a.getNome()%></td>
							<td><%=a.getCategoria()%></td>
							<td><%=a.getMarca()%></td>
							<td><%=a.getPreco()%></td>
							<td><form action="CreateAndFind?cmd=editar" method="post"
									style="display: inline;">
									<button class="btn btn-primary editar-btn" type="submit"
										name="txtId" value="<%=a.getCod_produto()%>">
										<i class="bi bi-pencil-square"></i> Editar
									</button>
								</form>
								<form action="CreateAndFind?cmd=excluir" method="post"
									style="display: inline;">
									<button type="button" class="btn btn-danger"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal<%=a.getCod_produto()%>">
										<i class="bi bi-trash3"></i> Excluir
									</button>
									<div class="modal fade"
										id="exampleModal<%=a.getCod_produto()%>" tabindex="-1"
										aria-labelledby="exampleModalLabel<%=a.getCod_produto()%>"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5"
														id="exampleModalLabel<%=a.getCod_produto()%>">
														Confirmar Exclusão</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Tem certeza de que deseja
													excluir este item?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
													<button class="btn btn-danger" type="submit" name="txtId"
														value="<%=a.getCod_produto()%>">
														<i class="bi bi-trash3"></i> Excluir
													</button>
												</div>
											</div>
										</div>
									</div>
								</form></td>
						</tr>
					</tbody>
					<%
					}
					%>

				</table>
			</div>
			<br>
		</main>
	</div>
</div>

<%@ include file="../header&footer/footer.html"%>
