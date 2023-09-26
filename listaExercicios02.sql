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
