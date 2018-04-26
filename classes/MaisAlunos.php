<?php 
	class MaisAlunos {
		
		public function professorComMaisAlunos($conn, $sexo) {
			$sql = "SELECT professor.id_professor, professor.nome, turma.id_turma, turma_aluno.id_aluno, aluno.sexo FROM turma INNER JOIN professor ON (turma.id_professor = professor.id_professor) INNER JOIN turma_aluno ON (turma_aluno.id_turma = turma.id_turma) INNER JOIN aluno ON (aluno.id_aluno = turma_aluno.id_aluno) ORDER BY professor.id_professor";
			$result = $conn->query($sql);
			$alunos = array();
			$professor = array();
			
			while($row = $result->fetch_assoc()) {
				array_push($professor,$row['nome']);
				array_push($alunos, $row['sexo']);
			}

			return $this->array_combine_($alunos, $professor, $sexo);
		}

		private function array_combine_($keys, $values, $sexo) {
			$completo = array();
			foreach ($keys as $i => $k) {
				$completo[$k][] = $values[$i];
			}
			array_walk($completo, create_function('&$v','$v = (count($v) == 1)? array_pop($v): $v;'));
			
			$array_count = array_count_values($completo[$sexo]);

			$maxs = array_keys($array_count, max($array_count));
			$key = $maxs['0'];
			return $maxs['0'].' - '.($array_count[$key]). ' alunos';
		}
	}

 ?>