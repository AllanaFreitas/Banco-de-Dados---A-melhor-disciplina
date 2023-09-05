SELECT titulo FROM livros;

SELECT nome_autor FROM autores WHERE ano_nascimento < 1900;

SELECT titulo FROM livros WHERE autor = 'J.K. Rowling';

SELECT nome_aluno FROM alunos WHERE curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receita_total FROM transacoes GROUP BY produto;

SELECT autor, COUNT(*) AS total_livros FROM livros GROUP BY autor;

SELECT curso, COUNT(*) AS total_alunos FROM alunos GROUP BY curso;

SELECT produto, AVG(receita) AS media_receita FROM transacoes GROUP BY produto;