CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `Biblioteca` ;


CREATE TABLE IF NOT EXISTS `Biblioteca`.`autor` (
  `id_autor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_autor`));


CREATE TABLE IF NOT EXISTS `Biblioteca`.`livro` (
  `id_livro` INT NOT NULL,
  `id_autor` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `num_pag` INT NOT NULL,
  `ano` SMALLINT(4) NOT NULL,
  PRIMARY KEY (`id_livro`),
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `id_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `Biblioteca`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Biblioteca`.`exemplar` (
  `id_exemplar` INT NOT NULL,
  `id_livro` INT NOT NULL,
  PRIMARY KEY (`id_exemplar`),
  INDEX `id_livro_idx` (`id_livro` ASC) VISIBLE,
  CONSTRAINT `id_livro`
    FOREIGN KEY (`id_livro`)
    REFERENCES `Biblioteca`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `Biblioteca`.`usuario` (
  `id_usuario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` INT NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`id_usuario`));


CREATE TABLE IF NOT EXISTS `Biblioteca`.`emprestimo` (
  `id_emprestimo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `id_exemplar` INT NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id_emprestimo`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `id_exemplar_idx` (`id_exemplar` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Biblioteca`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_exemplar`
    FOREIGN KEY (`id_exemplar`)
    REFERENCES `Biblioteca`.`exemplar` (`id_exemplar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
