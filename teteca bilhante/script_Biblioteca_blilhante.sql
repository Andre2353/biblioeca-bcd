drop database bliblioteca_bliante;
create database if not exists bliblioteca_bliante;
use bliblioteca_bliante;

create table aluno (
    id_aluno int primary key not null auto_increment,
    nome varchar(100) not null,
    turma varchar(20) not null
);

create table telefone (
    id_telefone int primary key auto_increment,
    ddd char(2) not null,
    numero varchar(9) not null,
    id_aluno int,
    foreign key (id_aluno) references aluno(id_aluno)
);

create table email (
    id_email int primary key auto_increment,
    email varchar(100) not null,
    tipo enum('pessoal', 'profissional', 'escolar') not null,
    id_aluno int,
    foreign key (id_aluno) references aluno(id_aluno)
);

create table editora (
    id_editora int primary key auto_increment,
    nome varchar(100)
);

create table autor (
    id_autor int primary key auto_increment,
    nome varchar(100)
);

create table livro (
    id_livro int primary key auto_increment,
    titulo varchar(100) not null,
    genero enum('romance', 'terror', 'ficção', 'drama', 'infantil'),
    id_editora int,
    foreign key (id_editora) references editora(id_editora)
);

create table livro_autor (
    id_livro int,
    id_autor int,
    primary key (id_livro, id_autor),
    foreign key (id_livro) references livro(id_livro),
    foreign key (id_autor) references autor(id_autor)
);

create table emprestimo (
    id_emprestimo int primary key auto_increment,
    id_aluno int,
    id_livro int,
    data_retirada date not null,
    data_prevista date not null,
    data_devolucao date,
    foreign key (id_aluno) references aluno(id_aluno),
    foreign key (id_livro) references livro(id_livro)
);

insert into aluno (nome, turma) values 
('aluno 1', '9a'), ('aluno 2', '9b'), ('aluno 3', '8a'), ('aluno 4', '9a'), ('aluno 5', '7c'),
('aluno 6', '8b'), ('aluno 7', '9b'), ('aluno 8', '7a'), ('aluno 9', '6a'), ('aluno 10', '8c');

insert into autor (nome) values 
('autor 1'), ('autor 2'), ('autor 3'), ('autor 4'), ('autor 5'),
('autor 6'), ('autor 7'), ('autor 8'), ('autor 9'), ('autor 10');

insert into editora (nome) values 
('editora 1'), ('editora 2'), ('editora 3'), ('editora 4'), ('editora 5'),
('editora 6'), ('editora 7'), ('editora 8'), ('editora 9'), ('editora 10');

insert into telefone (ddd, numero, id_aluno) values 
('11', '900010001', 1), ('11', '900010002', 2), ('11', '900010003', 3), ('11', '900010004', 4), ('11', '900010005', 5),
('11', '900010006', 6), ('11', '900010007', 7), ('11', '900010008', 8), ('11', '900010009', 9), ('11', '900010010', 10);

insert into email (email, tipo, id_aluno) values 
('aluno1@escola.com', 'escolar', 1), ('aluno2@escola.com', 'escolar', 2), ('aluno3@escola.com', 'escolar', 3), 
('aluno4@escola.com', 'escolar', 4), ('aluno5@escola.com', 'escolar', 5), ('aluno6@escola.com', 'escolar', 6), 
('aluno7@escola.com', 'escolar', 7), ('aluno8@escola.com', 'escolar', 8), ('aluno9@escola.com', 'escolar', 9), 
('aluno10@escola.com', 'escolar', 10);

insert into livro (titulo, genero, id_editora) values 
('livro 1', 'romance', 1), ('livro 2', 'romance', 2), ('livro 3', 'ficção', 3), ('livro 4', 'infantil', 4), ('livro 5', 'terror', 5),
('livro 6', 'drama', 6), ('livro 7', 'romance', 7), ('livro 8', 'romance', 8), ('livro 9', 'ficção', 9), ('livro 10', 'infantil', 10);

insert into livro_autor (id_livro, id_autor) values 
(1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10);

insert into emprestimo (id_aluno, id_livro, data_retirada, data_prevista, data_devolucao) values 
(1, 1, '2026-04-01', '2026-04-08', '2026-04-07'),
(2, 2, '2026-04-02', '2026-04-09', null), 
(3, 3, '2026-04-03', '2026-04-10', '2026-04-10'),
(4, 4, '2026-04-04', '2026-04-11', null),
(5, 5, '2026-04-05', '2026-04-12', '2026-04-11'),
(6, 6, '2026-04-06', '2026-04-13', null),
(7, 7, '2026-04-07', '2026-04-14', '2026-04-14'),
(8, 8, '2026-04-08', '2026-04-15', null),
(9, 9, '2026-04-09', '2026-04-16', '2026-04-16'),
(10, 10, '2026-04-10', '2026-04-17', null);

select * from aluno;
select * from livro;
select nome from autor;
select titulo from livro order by titulo asc;
select * from emprestimo;
select nome, turma from aluno;
select l.titulo from livro l 
join livro_autor la on l.id_livro = la.id_livro 
join autor a on la.id_autor = a.id_autor 
where a.nome = 'autor 1';

