<?php 
	class Tabela {

		public function getCodigo($conn) {
			$sql = "SELECT codigo FROM turma ORDER BY id_turma ASC";
			$result = $conn->query($sql);
			while($row = $result->fetch_assoc()) {
				echo '<p>'.$row['codigo'].'</p>';
			}
		}

		public function getMediaGeral($conn) {
			$sql = "SELECT turma.id_turma, turma.codigo, AVG(turma_aluno_notas.nota) FROM turma INNER JOIN turma_aluno_notas ON turma.id_turma = turma_aluno_notas.id_turma GROUP BY turma_aluno_notas.id_turma ORDER BY turma.id_turma ASC";
			$result = $conn->query($sql);
			while($row = $result->fetch_assoc()) {
				echo '<p>'.number_format($row['AVG(turma_aluno_notas.nota)'], 2).'</p>';
			}
		}

		public function getAlunoMedia($conn, $order) {
			$sql = "(SELECT turma_aluno_notas.id_turma, turma_aluno_notas.id_aluno, turma_aluno_notas.nota, aluno.nome FROM turma_aluno_notas INNER JOIN aluno ON (turma_aluno_notas.id_aluno = aluno.id_aluno) WHERE id_turma = 1 ORDER BY nota $order LIMIT 1) UNION ALL (SELECT turma_aluno_notas.id_turma, turma_aluno_notas.id_aluno, turma_aluno_notas.nota, aluno.nome FROM turma_aluno_notas INNER JOIN aluno ON (turma_aluno_notas.id_aluno = aluno.id_aluno) WHERE id_turma = 2 ORDER BY nota $order LIMIT 1) UNION ALL (SELECT turma_aluno_notas.id_turma, turma_aluno_notas.id_aluno, turma_aluno_notas.nota, aluno.nome FROM turma_aluno_notas INNER JOIN aluno ON (turma_aluno_notas.id_aluno = aluno.id_aluno) WHERE id_turma = 3 ORDER BY nota $order LIMIT 1)";
			$result = $conn->query($sql);
			while($row = $result->fetch_assoc()) {
				echo '<p>'.utf8_encode($row['nome']).' - '.$row['nota'].'</p>';
			}
		}
	}

 ?>