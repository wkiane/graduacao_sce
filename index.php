<?php 
	$conn = new mysqli('localhost', 'root', '', 'graduacao_sce');

	include('classes/MaisAlunos.php');
	include('classes/Media.php');
	include('classes/Tabela.php');
	$maisalunos = new MaisAlunos();
	$media = new Media();
	$tabela = new Tabela();
 ?>

 <!DOCTYPE html>
 <html>
 <head>
 	<meta charset="utf-8">
 	<title></title>
 	<style type="text/css">

 		ul {
 			list-style-type: none;
 		}

 		li {
 			display: inline-block;
 			padding-right: 30px;
 		}

 		li span {
 			font-weight: bold;
 			font-size: 1.2em;
 		}
 	</style>
 </head>
 <body>
 	<h2>Professor com mais alunos do sexo masculino: <span>
 		<?php echo $maisalunos->professorComMaisAlunos($conn, 'm') ?>
 	</span></h2>
 	<h2>Professor com mais alunos do sexo feminino: <span>
 		<?php echo $maisalunos->professorComMaisAlunos($conn, 'f'); ?>
 	</span></h2>

 	<h2>Turma com maior média geral: <span>
 		<?php echo $media->getMaiorMediaGeral($conn) ?>
 	</span></h2>

 	<h2>Turma com maior média individual: <span>
 		<?php echo $media->getMediaIndividual($conn, 'DESC') ?>
 	</span></h2>

 	<h2>Turma com menor média geral: <span>
 		<?php echo $media->getMenorMediaGeral($conn) ?>
 	</span></h2>
 	<h2>Turma com menor média individual: <span>
 		<?php echo $media->getMediaIndividual($conn, 'ASC'); ?>
 	</span></h2>

 
 	<ul>
 		<li>
 			<span>Código da Turma:</span>
 			<div>
 				<?php $tabela->getCodigo($conn) ?>
 			</div>
 		</li>

 		<li>
 			<span>Média Geral:</span>
 			<div>
 				<?php $tabela->getMediaGeral($conn) ?>
 			</div>
 		</li>

 		<li>
 			<span>Aluno com Maior Média:</span>
 			<div>
 				<?php $tabela->getAlunoMedia($conn, 'DESC') ?>
 			</div>
 		</li>

 		<li>
 			<span>Aluno com Menor Média:</span>
 			<div>
 				<?php $tabela->getAlunoMedia($conn, 'ASC') ?>
 			</div>
 		</li>
 	</ul>

 </body>
 </html>