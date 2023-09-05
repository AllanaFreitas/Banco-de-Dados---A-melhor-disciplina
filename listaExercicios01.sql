SELECT titulo FROM livros;

SELECT nome_autor FROM autores WHERE ano_nascimento < 1900;

SELECT titulo FROM livros WHERE autor = 'J.K. Rowling';

SELECT nome_aluno FROM alunos WHERE curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receita_total FROM transacoes GROUP BY produto;

SELECT autor, COUNT(*) AS total_livros FROM livros GROUP BY autor;