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