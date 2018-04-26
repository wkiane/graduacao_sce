<?php 
	class Media {
		
		public function getMaiorMediaGeral($conn) {
			$sql = "SELECT turma.id_turma, turma.codigo, AVG(turma_aluno_notas.nota) FROM turma INNER JOIN turma_aluno_notas ON turma.id_turma = turma_aluno_notas.id_turma GROUP BY turma_aluno_notas.id_turma ORDER BY turma_aluno_notas.nota ASC";
			$result = $conn->query($sql);
			$row = $result->fetch_assoc();
			return $row['codigo'].' - ' .number_format(($row['AVG(turma_aluno_notas.nota)']), 2, '.', ',');
		}

		public function getMenorMediaGeral($conn) {
			$sql = "SELECT turma.id_turma, turma.codigo, AVG(turma_aluno_notas.nota) FROM turma INNER JOIN turma_aluno_notas ON turma.id_turma = turma_aluno_notas.id_turma GROUP BY turma_aluno_notas.id_turma";
			$result = $conn->query($sql);
			$row = $result->fetch_assoc();
			return $row['codigo'].' - '.number_format($row['AVG(turma_aluno_notas.nota)'], 2, '.', ',');
		}

		public function getMediaIndividual($conn, $order) {
			$sql = "SELECT turma.id_turma, turma.codigo, turma_aluno_notas.nota FROM turma INNER JOIN turma_aluno_notas ON turma.id_turma = turma_aluno_notas.id_turma GROUP BY nota ORDER BY nota $order";
			$result = $conn->query($sql);
			$row = $result->fetch_assoc();
			return  $row['codigo'].' - '.$row['nota'];
		}
	}	

 ?>