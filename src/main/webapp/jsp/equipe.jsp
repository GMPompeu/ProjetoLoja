<%@ include file="../header&footer/headerHM.html"%>
<title>ToyShell-Sobre a Equipe</title>
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
			<div class="wrapper">
				<ul class="nav flex-column">
					<ul>
						<a class="nav-link" href="../CreateAndFind?cmd=listar">
						<input type="hidden" name="cmd" value="listar">
						Home</a>
					</ul>
				</ul>
			</div>
		</nav>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 10px;">
			<div class="row">
				<div class="col-md-12 ">
					<h3>
						Equipe<small class="text-body-secondary">: : Integrandes </small>
						<hr>
					</h3>
				</div>
			</div>
			<div class="container mt-4">
				<div class="row">
					<div class="col-md-4">
						<div class="card" style="width: 18rem;">
							<img src="../imgProject/guilherme.jpeg" class="card-img-top"
								alt="..."
								style="height: 250px; object-fit: cover; object-position: 0px -150px;">
							<div class="card-body">
								<h5 class="card-title">Guilherme Pompeu Mascarenhas</h5>
								<p class="card-text">RGM - 29364795</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
<style>
.card:hover {
    transform: translateY(-10px);
    transition: transform 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
</style>


<%@ include file="../header&footer/footer.html"%>
