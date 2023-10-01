<%@ include file="../header&footer/header.html"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Brinquedo"%>
<title>ToyShell-Home</title>
<jsp:useBean id="brinquedo" scope="session" class="model.Brinquedo" />
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
						Brinquedo <small class="text-body-secondary">: : <%=brinquedo.getMarca()%>-<%=brinquedo.getNome()%></small>
						<hr>
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="card mb-3" id="viewProduto">
					<img style="max-width: 350px;" src=<%="imgToy/" + brinquedo.getImagem()%>
						class="card-img-top" alt="imgcontent" >
					<div class="card-body">
						<h5 class="card-title"><%=brinquedo.getNome()%></h5>
						<p class="card-title" id="preco">
							<b>Valor: </b>R$ 
							<%=brinquedo.getPreco()%></p>
							<p class="card-text"><b>Detalhes: </b><%=brinquedo.getDetalhes()%></p>
						<p class="card-text">
							<small class="text-body-secondary"><b>Marca: </b><%=brinquedo.getMarca()%></small>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<br>
			</div>
		</main>
	</div>
</div>

<%@ include file="../header&footer/footer.html"%>
