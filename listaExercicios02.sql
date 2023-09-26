/* 1 */

DELIMITER //

CREATE PROCEDURE sp_ListarAutores()
BEGIN
SELECT Nome, Sobrenome
FROM Autor;
END;
//

DELIMITER ;
CALL sp_ListarAutores();

/* 2 */

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN nome_da_categoria VARCHAR(200))
BEGIN
SELECT Livro.Titulo
FROM Livro
INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID WHERE Categoria.Nome = nome_da_categoria
END;
//

DELIMITER ;

CALL sp_LivrosPorCategoria('Romance');
CALL sp_LivrosPorCategoria('Ciência');
CALL sp_LivrosPorCategoria('Ficção Científica');
CALL sp_LivrosPorCategoria('História');
CALL sp_LivrosPorCategoria('Autoajuda');

/* 3 */

DELIMITER //

CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN nome_da_categoria VARCHAR(200), OUT total_livros INT)
BEGIN
SELECT COUNT(*) INTO total_livros
FROM Livro
INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
WHERE Categoria.Nome = nome_da_categoria;
END;
//

DELIMITER ;

CALL sp_ContarLivrosPorCategoria('Romance', @total_livros);
CALL sp_ContarLivrosPorCategoria('Ciência', @total_livros);
CALL sp_ContarLivrosPorCategoria('Ficção Científica', @total_livros);
CALL sp_ContarLivrosPorCategoria('História', @total_livros);
CALL sp_ContarLivrosPorCategoria('Autoajuda', @total_livros);

/* 4 */

DELIMITER //

CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nome_da_categoria VARCHAR(200), OUT livrospossuidos VARCHAR(3))
BEGIN


DECLARE contador INT;
SET contador = 0;

SELECT COUNT(*) INTO contador
FROM livro
INNER JOIN Categoria ON livro.Categoria_ID = Categoria.Categoria_ID
WHERE Categoria.Nome = nome_da_categoria;

IF contador > 0 THEN
    SET livrospossuidos = 'Sim';
ELSE
    SET livrospossuidos = 'Não';
END IF;



END;
//

DELIMITER ;

CALL sp_VerificarLivrosCategoria('Romance', @livrospossuidos);
CALL sp_VerificarLivrosCategoria('Ciência', @livrospossuidos);
CALL sp_VerificarLivrosCategoria('Ficção Científica',@livrospossuidos);
CALL sp_VerificarLivrosCategoria('História', @livrospossuidos);
CALL sp_VerificarLivrosCategoria('Autoajuda', @livrospossuidos);

SELECT @livrospossuidos;

/* 5 */

DELIMITER //

CREATE PROCEDURE sp_LivrosAteAno(IN ano_especifico INT)
BEGIN
SELECT Titulo, Publicacao_do_ano
FROM Livro
WHERE Publicacao_do_ano <= ano_especifico;
END;
//

DELIMITER ;

CALL sp_LivrosAteAno(1999);

/* 6 */

DELIMITER //

CREATE PROCEDURE sp_TitulosPorCategoria(IN nome_da_categoria VARCHAR(200))
BEGIN


DECLARE titulo_do_livro VARCHAR(255);

DECLARE cursor_dos_livros CURSOR FOR
    SELECT Titulo
    FROM livro
    INNER JOIN Categoria ON livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = nome_da_categoria;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET titulo_do_livro = NULL;

OPEN cursor_livros;
read_loop: LOOP
    FETCH cursor_dos_livros INTO titulo_do_livro;
    IF titulo_do_livro IS NULL THEN
        LEAVE read_loop;
    END IF;
    SELECT titulo_do_livro;
END LOOP;
CLOSE cursor_dos_livros;



END;
//

DELIMITER ;

CALL sp_TitulosPorCategoria('Romance');

/* 7 */

DELIMITER //

CREATE PROCEDURE sp_AdicionarLivro(
IN titulo_livro VARCHAR(255),
IN editora_id INT,
IN ano_publicacao INT,
IN numero_paginas INT,
IN categoria_id INT
)
BEGIN


IF titulo_do_livro IS NULL OR editora_id IS NULL OR ano_publicacao IS NULL OR numero_paginas IS NULL OR categoria_id IS NULL THEN
    SELECT 'Erro: Nenhum dos parâmetros pode ser nulo.' AS Status;
ELSE
    IF EXISTS (SELECT 1 FROM livro WHERE Titulo = titulo_do_livro) THEN
        SELECT 'Erro: O livro com esse título já existe na tabela.' AS Status;
    ELSE
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (titulo_livro, editora_id, ano_publicacao, numero_paginas, categoria_id);

        SELECT 'Livro adicionado com sucesso.' AS Status;
    END IF;
END IF;



END;
//

DELIMITER ;

CALL sp_AdicionarLivro('É assim que acaba', 1, 2016, 374, 1);
