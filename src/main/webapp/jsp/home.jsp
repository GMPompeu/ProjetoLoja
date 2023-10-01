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
						<a class="nav-link" href="jsp/catalogo.jsp">Catálogo de Brinquedos</a>
					</ul>
					<ul>
						<a class="nav-link" href="CreateAndFind?cmd=adiministracao">Administração</a>
					</ul>
					<ul>
						<a class="nav-link" href="jsp/equipe.jsp">Sobre a equipe</a>
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
						<hr>
					</h3>
				</div>
			</div>
			<div class="row">
				<%
				List<Brinquedo> lista = new ArrayList<Brinquedo>();
				int count = 0;
				lista = (ArrayList) request.getAttribute("listaBrinquedo");
				for (Brinquedo a : lista) {

					if (a.getPreco() >= 200) {
				%>


				<div class="col-md-4" id="destaque">
					<div class="card">
						<div class="content-card">
							<form action="CreateAndFind" method="post">
								<input type="hidden" name="cmd" value="buscar"> <img
									src=<%="imgToy/" + a.getImagem()%> class="card-img-top"
									alt="Imagem do Brinquedo">
								<div class="card-body">
									<hr>
									<h5 class="card-title"><%=a.getCategoria()%><%=a.getNome()%></h5>
									<p class="card-title"><%=a.getDescricao()%></p>
									<p class="card-text" id="preco">
										R$<%=a.getPreco()%></p>
									 <input
										type="hidden" name="txtId" value="<%=a.getCod_produto()%>">
									<button type="submit">Ver</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<%
				count++;
				if (count % 3 == 0) {
				%>
			</div>
			<div class="row">
				<br>
				<%
				}
				}
				}
				%>
			</div>
		</main>
	</div>
</div>

<%@ include file="../header&footer/footer.html"%>
