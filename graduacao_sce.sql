-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para graduacao_sce
CREATE DATABASE IF NOT EXISTS `graduacao_sce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `graduacao_sce`;

-- Copiando estrutura para tabela graduacao_sce.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `id_aluno` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `sexo` varchar(1) NOT NULL DEFAULT 'm',
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela graduacao_sce.aluno: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`id_aluno`, `nome`, `sexo`) VALUES
	(1, 'Anakin', 'm'),
	(2, 'Luke', 'm'),
	(3, 'Han', 'm'),
	(4, 'Léia', 'f'),
	(5, 'Rey', 'f'),
	(6, 'Finn', 'm');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela graduacao_sce.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id_disciplina` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela graduacao_sce.disciplina: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`id_disciplina`, `nome`) VALUES
	(1, 'Computação I'),
	(2, 'Banco de Dados I');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

-- Copiando estrutura para tabela graduacao_sce.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `id_professor` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela graduacao_sce.professor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`id_professor`, `nome`) VALUES
	(1, 'Mestre Yoda'),
	(2, 'Chewbacca');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

-- Copiando estrutura para tabela graduacao_sce.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `id_turma` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_professor` int(11),
  PRIMARY KEY (`id_turma`),
  KEY `FK_turma_disciplina` (`id_disciplina`),
  KEY `FK_turma_professor` (`id_professor`),
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `FK_turma_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_professor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela graduacao_sce.turma: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`id_turma`, `codigo`, `id_disciplina`, `id_professor`) VALUES
	(1, 'COMPI01', 1, 1),
	(2, 'COMPI02', 1, 2),
	(3, 'BDI01', 2, 1);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

-- Copiando estrutura para tabela graduacao_sce.turma_aluno
CREATE TABLE IF NOT EXISTS `turma_aluno` (
  `id_turma` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  PRIMARY KEY (`id_aluno`,`id_turma`),
  KEY `FK__turma` (`id_turma`),
  CONSTRAINT `FK__aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `FK__turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela graduacao_sce.turma_aluno: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `turma_aluno` DISABLE KEYS */;
INSERT INTO `turma_aluno` (`id_turma`, `id_aluno`) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 4),
	(1, 5),
	(3, 5),
	(2, 6),
	(3, 6);
/*!40000 ALTER TABLE `turma_aluno` ENABLE KEYS */;

-- Copiando estrutura para tabela graduacao_sce.turma_aluno_notas
CREATE TABLE IF NOT EXISTS `turma_aluno_notas` (
  `id_turma` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `nota` float NOT NULL,
  KEY `FK_turma_aluno_notas_turma` (`id_turma`),
  KEY `FK_turma_aluno_notas_aluno` (`id_aluno`),
  CONSTRAINT `FK_turma_aluno_notas_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `FK_turma_aluno_notas_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela graduacao_sce.turma_aluno_notas: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `turma_aluno_notas` DISABLE KEYS */;
INSERT INTO `turma_aluno_notas` (`id_turma`, `id_aluno`, `id_nota`, `nota`) VALUES
	(1, 1, 1, 7.3),
	(1, 1, 2, 8.5),
	(1, 2, 1, 6.7),
	(1, 2, 2, 9.1),
	(1, 5, 1, 6.9),
	(1, 5, 2, 7.4),
	(2, 3, 1, 9.8),
	(2, 3, 2, 10),
	(2, 4, 1, 8.6),
	(2, 4, 2, 6.1),
	(2, 6, 1, 8.1),
	(2, 6, 2, 4.2),
	(3, 4, 1, 6.6),
	(3, 4, 2, 8.2),
	(3, 5, 1, 7.3),
	(3, 5, 2, 9.3),
	(3, 6, 1, 7.8),
	(3, 6, 2, 9.9);
/*!40000 ALTER TABLE `turma_aluno_notas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
