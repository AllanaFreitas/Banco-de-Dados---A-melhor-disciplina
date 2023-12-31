SELECT titulo FROM livros;

SELECT nome_autor FROM autores WHERE ano_nascimento < 1900;

SELECT titulo FROM livros WHERE autor = 'J.K. Rowling';

SELECT nome_aluno FROM alunos WHERE curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receita_total FROM transacoes GROUP BY produto;

SELECT autor, COUNT(*) AS total_livros FROM livros GROUP BY autor;

SELECT curso, COUNT(*) AS total_alunos FROM alunos GROUP BY curso;

SELECT produto, AVG(receita) AS media_receita FROM transacoes GROUP BY produto;

SELECT produto, SUM(receita) AS receita_total FROM transacoes GROUP BY produto HAVING receita_total > 10000;

SELECT autor, COUNT(*) AS total_livros FROM livros GROUP BY autor HAVING total_livros > 2;

SELECT livros.titulo, autores.nome autor
FROM livros
JOIN autores ON livros.autor = autores.id_autor;

SELECT alunos.nome_aluno, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id_aluno = matriculas.id_aluno;

SELECT autores.nome AS nome_do_autor, livros.titulo AS titulo_do_livro
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;

SELECT cursos.nome AS nome_do_curso, alunos.nome AS nome_do_aluno
FROM cursos
RIGHT JOIN alunos ON cursos.id = alunos.curso_id;

SELECT alunos.nome_aluno, cursos.nome_curso
FROM alunos
INNER JOIN cursos ON alunos.curso_id = curso.id_curso;

SELECT autor, COUNT(*) AS total_livros
FROM livros
GROUP BY autor
ORDER BY total_livros DESC
LIMIT 1;

SELECT produto, SUM(receita) AS receita_total
FROM transacoes
GROUP BY produto
ORDER BY receita_total
LIMIT 1;

SELECT alunos.nome_aluno, COUNT(*) AS total_matriculas
FROM alunos
LEFT JOIN matriculas ON alunos.id_aluno = matriculas.id_aluno
GROUP BY alunos.nome_aluno;

SELECT produto, COUNT(*) AS total_transacoes
FROM transacoes
GROUP BY produto
ORDER BY total_transacoes DESC
LIMIT 1;