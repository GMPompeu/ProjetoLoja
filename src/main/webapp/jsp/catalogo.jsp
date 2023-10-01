<%@ include file="../header&footer/headerHM.html"%>
<title>ToyShell-Sobre a Equipe</title>
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
			<div class="wrapper">
				<ul class="nav flex-column">
					<ul>
						<a class="nav-link" href="../CreateAndFind?cmd=listar"> <input
							type="hidden" name="cmd" value="listar"> Home
						</a>
					</ul>
				</ul>
			</div>
		</nav>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 10px;">
			<div class="row">
				<div class="col-md-12 ">
					<h3>
						Catálogo de Brinquedos<small class="text-body-secondary">:
							: categorias </small>
						<hr>
					</h3>
				</div>
			</div>
			<div class="container mt-4">
				<div class="row">
					<div class="col-md-4 mb-4">
						<a href="../CreateAndFind?cmd=BrinquedoMasculino">
							<div class="card" id="categorias">
								<div class="content-card">
									<form action="CreateAndFind" method="post">
										<input type="hidden" name="cmd" value="buscar"> <img
											src="../imgProject/Avengers-PNG-Photos.png"
											class="card-img-top" alt="Imagem do Brinquedo">
										<div class="card-body">
											<h5 class="card-title" id="categoria-title">Boneco
												Masculino</h5>

										</div>
									</form>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4 mb-4">
						<a href="../CreateAndFind?cmd=BrinquedoFeminino">
							<div class="card" id="categoriasFm">
								<div class="content-card">
									<form action="CreateAndFind" method="post">
										<input type="hidden" name="cmd" value="buscar"> <img
											src="../imgProject/princesa.png"
											style="max-width: 240px; aling-items: center;"
											class="card-img-top" alt="Imagem do Brinquedo">
										<div class="card-body">
											<h5 class="card-title" id="categoria-title">Boneca
												Feminina</h5>

										</div>
									</form>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4 mb-4">
						<a href="../CreateAndFind?cmd=Carrinhos">
							<div class="card" id="categoriasCar" style="height: 300px;">
								<div class="content-card">
									<form action="CreateAndFind" method="post">
										<input type="hidden" name="cmd" value="buscar"> <img
											src="../imgProject/carros.png" style="width: 280px;"
											class="card-img-top" alt="Imagem do Brinquedo">
										<div class="card-body">
											<h5 class="card-title" id="categoria-title">Carrinhos</h5>

										</div>
									</form>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4 mb-4">
						<a href="../CreateAndFind?cmd=Lego">
							<div class="card" id="categoriasLego" style="height: 300px;">
								<div class="content-card">
									<form action="CreateAndFind" method="post">
										<input type="hidden" name="cmd" value="buscar"> <img
											src="../imgProject/lego.png" style="width: 300px;"
											class="card-img-top" alt="Imagem do Brinquedo">
										<div class="card-body">
											<h5 class="card-title" id="categoria-title">lego</h5>
										</div>
									</form>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="../header&footer/footer.html"%>
