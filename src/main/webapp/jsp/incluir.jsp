<%@ include file="../header&footer/headerHM.html"%>
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
			<div class="wrapper">
				<ul class="nav flex-column">
					<ul>
						<a class="nav-link"  href="../CreateAndFind?cmd=listar">Home</a>
					</ul>
				</ul>
			</div>
		</nav>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
			style="margin-top: 10px;">
			<div class="row">
				<div class="col-md-12 ">
					<h3>
						Catalogo de Brinquedos<small class="text-body-secondary">:
							: novo Brinquedo </small>
						<hr>
					</h3>
				</div>
				<form action="../CreateAndFind" method="post" enctype="multipart/form-data">
				
					<input type="hidden" name="cmd" value="incluir">
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">Nome</span>
						<input type="text" class="form-control" name="nome"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm">Descrição</span>
						<input type="text" class="form-control" name="descricao"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">Categoria</label>
						<select class="form-select" id="inputGroupSelect01" name="categoria">
							<option selected>
							<option>
							<option value="Boneco Masculino">Boneco Masculino</option>
							<option value="Boneca Feminina">Boneca Feminina</option>
							<option value="Carrinhos">Carrinhos</option>
							<option value="Legos">Legos</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">Marca</label>
						<select class="form-select" id="inputGroupSelect01" name="marca">
							<option selected>
							<option>
							<option value="HotWeels">HotWeels</option>
							<option value="Lego">Lego</option>
							<option value="Nerf">Nerf</option>
							<option value="Estrela">Estrela</option>
							<option value="Tech Deck">Tech Deck</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">Preço</span> <span
							class="input-group-text">R$ 0,00</span> <input type="text"
							class="form-control" name="preco"
							aria-label="Dollar amount (with dot and two decimal places)">
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Digite aqui"
							name="detalhes" id="floatingTextarea2" style="height: 100px"></textarea>
						<label for="floatingTextarea2">Detalhes</label>
					</div>
					<hr>
					<div class="mb-3">
						<label for="formFileSm" class="form-label">Foto</label>
						 <input class="form-control form-control-sm"
							name="imagem"id="formFileSm" type="file">
					</div>
					<hr>
					<button type="submit" class="btn btn-success">Cadastrar</button>
					<button type="reset" class="btn btn-danger"
					style="margin-left: 50px;">Cancelar</button>
				</form>
			</div>
		</main>
	</div>
</div>
<%@ include file="../header&footer/footer.html"%>