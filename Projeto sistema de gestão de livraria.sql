-- Criando o database
CREATE DATABASE SistemaDeGestaoDeLivros

USE SistemaDeGestaoDeLivros

-- Criando a tabela de Clientes
CREATE TABLE Clientes(
	Cliente_id INT IDENTITY(0, 1),
	Nome VARCHAR(100) NOT NULL,
	Genero Varchar(1) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	Data_cadastro DATE DEFAULT GETDATE(),
	CONSTRAINT Cliente_id_Clientes_pk PRIMARY KEY(Cliente_id),
	CONSTRAINT CPF_Clientes_un UNIQUE(CPF),
	CONSTRAINT Email_Clientes_un UNIQUE(Email),
	CONSTRAINT Genero_Clientes_ck CHECK(Genero IN ('M','F'))
)

-- Criando a tabela de Vendedores
CREATE TABLE Vendedores(
	Vendedor_id INT IDENTITY(1, 1),
	Nome VARCHAR(100) NOT NULL,
	Genero VARCHAR(1) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	Data_admissao DATE NOT NULL,
	Data_desligamento DATE,
	CONSTRAINT Vendedor_id_Vendedores_pk PRIMARY KEY(Vendedor_id),
	CONSTRAINT CPF_Vendedores_un UNIQUE(CPF),
	CONSTRAINT Email_Vendedores_un UNIQUE(CPF),
	CONSTRAINT Genero_Vendedores_ck CHECK(Genero IN ('M','F'))
)

-- Criando a tabela de Livros
CREATE TABLE Livros(
	Livro_id INT IDENTITY(1, 1),
	Nome VARCHAR(100) NOT NULL,
	Autor VARCHAR(100) NOT NULL,
	Genero_literario VARCHAR(30) NOT NULL,
	Preco FLOAT NOT NULL,
	Qtd_estoque INT NOT NULL,
	Qtd_minima INT NOT NULL,
	CONSTRAINT Livro_id_Livros_pk PRIMARY KEY(Livro_id),
	CONSTRAINT Preco_Livros_ck CHECK(Preco > 0),
	CONSTRAINT Genero_literario_Livros_ck CHECK(Genero_literario IN ('Ficção', 'Não-ficção', 'Romance', 'Fantasia', 'Mistério', 'Biografia'))
)

-- Criando a tabela de Pedidos(tabela fato)
CREATE TABLE Pedidos(
	Pedido_id INT IDENTITY(1, 1),
	Cliente_id INT NOT NULL,
	Vendedor_id INT NOT NULL,
	Livro_id INT NOT NULL,
	Data_pedido DATE DEFAULT GETDATE(),
	Quantidade INT NOT NULL,
	Valor_total FLOAT NOT NULL,
	CONSTRAINT Pedido_id_Pedidos_pk PRIMARY KEY(Pedido_id),
	CONSTRAINT Cliente_id_Pedidos_fk FOREIGN KEY(Cliente_id) REFERENCES Clientes(Cliente_id),
	CONSTRAINT Vendedor_id_Pedidos_fk FOREIGN KEY(Vendedor_id) REFERENCES Vendedores(Vendedor_id),
	CONSTRAINT Livro_id_Pedidos_fk FOREIGN KEY(Livro_id) REFERENCES Livros(Livro_id),
	CONSTRAINT Valor_total_Pedidos_ck CHECK(Valor_total > 10)
)

-- Inserindo os dados da tabela clientes e criando o Cliente número Zero, que será a forma que escolhi para representar clientes "não cadastrados"
INSERT INTO Clientes(Nome, Genero, Email, CPF, Data_cadastro) VALUES
    ('Não cadastrado'              , 'M', 'Não Cadastrado'                        , '000.000.000-00', '1800-01-01'),
    ('Carlos Eduardo Almeida'      , 'M', 'carlos.eduardo.almeida@email.com'      , '111.222.333-01', '2023-06-05'),
    ('Ana Beatriz Lima'            , 'F', 'ana.beatriz.lima@email.com'            , '222.333.444-02', '2023-06-06'),
    ('Lucas Gabriel Silva'         , 'M', 'lucas.gabriel.silva@email.com'         , '333.444.555-03', '2023-06-06'),
    ('Fernanda Cristina Santos'    , 'F', 'fernanda.cristina.santos@email.com'    , '444.555.666-04', '2023-06-07'),
    ('João Pedro Carvalho'         , 'M', 'joao.pedro.carvalho@email.com'         , '555.666.777-05', '2023-06-08'),
    ('Mariana Vitória Ferreira'    , 'F', 'mariana.vitoria.ferreira@email.com'    , '666.777.888-06', '2023-06-10'),
    ('Guilherme Augusto Nascimento', 'M', 'guilherme.augusto.nascimento@email.com', '777.888.999-07', '2023-06-12'),
    ('Isabela Regina Duarte'       , 'F', 'isabela.regina.duarte@email.com'       , '888.999.000-08', '2023-06-15'),
    ('Pedro Henrique Rocha'        , 'M', 'pedro.henrique.rocha@email.com'        , '999.000.111-09', '2023-06-18'),
    ('Sofia Carolina Gomes'        , 'F', 'sofia.carolina.gomes@email.com'        , '111.222.333-10', '2023-06-20'),
    ('Felipe Matheus Monteiro'     , 'M', 'felipe.matheus.monteiro@email.com'     , '222.333.444-11', '2023-06-21'),
    ('Camila Gabriela Oliveira'    , 'F', 'camila.gabriela.oliveira@email.com'    , '333.444.555-12', '2023-06-22'),
    ('Rafael Luiz Ramos'           , 'M', 'rafael.luiz.ramos@email.com'           , '444.555.666-13', '2023-06-24'),
    ('Laura Vitória Costa'         , 'F', 'laura.vitoria.costa@email.com'         , '555.666.777-14', '2023-06-25'),
    ('Anderson Augusto Vieira'     , 'M', 'anderson.augusto.vieira@email.com'     , '666.777.888-15', '2023-06-26'),
    ('Paula Regina Almeida'        , 'F', 'paula.regina.almeida@email.com'        , '777.888.999-16', '2023-06-27'),
    ('Leonardo Henrique Martins'   , 'M', 'leonardo.henrique.martins@email.com'   , '888.999.000-17', '2023-06-30'),
    ('Tatiane Duarte Silva'        , 'F', 'tatiane.duarte.silva@email.com'        , '999.000.111-18', '2023-07-02'),
    ('Alexandre Gomes Lima'        , 'M', 'alexandre.gomes.lima@email.com'        , '111.222.333-19', '2023-07-03'),
    ('Bruna Carolina Ferreira'     , 'F', 'bruna.carolina.ferreira@email.com'     , '222.333.444-20', '2023-07-04'),
    ('Fernando Augusto Barbosa'    , 'M', 'fernando.augusto.barbosa@email.com'    , '333.444.555-21', '2023-07-05'),
    ('Carolina Beatriz Monteiro'   , 'F', 'carolina.beatriz.monteiro@email.com'   , '444.555.666-22', '2023-07-07'),
    ('Marcelo Rodrigues Silva'     , 'M', 'marcelo.rodrigues.silva@email.com'     , '555.666.777-23', '2023-07-08'),
    ('Sandra Regina Almeida'       , 'F', 'sandra.regina.almeida@email.com'       , '666.777.888-24', '2023-07-09'),
    ('Lucas Rafael Moura'          , 'M', 'lucas.rafael.moura@email.com'          , '777.888.999-25', '2023-07-10'),
    ('Daniela Cristina Gomes'      , 'F', 'daniela.cristina.gomes@email.com'      , '888.999.000-26', '2023-07-11'),
    ('Caio Matheus Lima'           , 'M', 'caio.matheus.lima@email.com'           , '999.000.111-27', '2023-07-13'),
    ('Joana Pereira Vieira'        , 'F', 'joana.pereira.vieira@email.com'        , '111.222.333-28', '2023-07-14'),
    ('Guilherme Silva Santos'      , 'M', 'guilherme.silva.santos@email.com'      , '222.333.444-29', '2023-07-15'),
    ('Luana Gabriela Rocha'        , 'F', 'luana.gabriela.rocha@email.com'        , '333.444.555-30', '2023-07-16'),
    ('Matheus Alves Ramos'         , 'M', 'matheus.alves.ramos@email.com'         , '444.555.666-31', '2023-07-17'),
    ('Renata Cristina Costa'       , 'F', 'renata.cristina.costa@email.com'       , '555.666.777-32', '2023-07-18'),
    ('Thiago Monteiro Teixeira'    , 'M', 'thiago.monteiro.teixeira@email.com'    , '666.777.888-33', '2023-07-20'),
    ('Patrícia Regina Oliveira'    , 'F', 'patricia.regina.oliveira@email.com'    , '777.888.999-34', '2023-07-21'),
    ('Anderson Augusto Ramos'      , 'M', 'anderson.augusto.ramos@email.com'      , '888.999.000-35', '2023-07-22'),
    ('Débora Carolina Farias'      , 'F', 'debora.carolina.farias@email.com'      , '999.000.111-36', '2023-07-23'),
    ('Rafael Matheus Gomes'        , 'M', 'rafael.matheus.gomes@email.com'        , '111.222.333-37', '2023-07-24'),
    ('Sabrina Duarte Monteiro'     , 'F', 'sabrina.duarte.monteiro@email.com'     , '222.333.444-38', '2023-07-25'),
    ('Eduardo Augusto Almeida'     , 'M', 'eduardo.augusto.almeida@email.com'     , '333.444.555-39', '2023-07-26'),
    ('Carla Beatriz Nascimento'    , 'F', 'carla.beatriz.nascimento@email.com'    , '444.555.666-40', '2023-07-27'),
    ('Roberto Henrique Ramos'      , 'M', 'roberto.henrique.ramos@email.com'      , '555.666.777-41', '2023-07-28'),
    ('Fernanda Cristina Rocha'     , 'F', 'fernanda.cristina.rocha@email.com'     , '666.777.888-42', '2023-07-29'),
    ('Pedro Luiz Vieira'           , 'M', 'pedro.luiz.vieira@email.com'           , '777.888.999-43', '2023-07-30'),
    ('Viviane Gabriela Alves'      , 'F', 'viviane.gabriela.alves@email.com'      , '888.999.000-44', '2023-07-31'),
    ('Samuel Augusto Teixeira'     , 'M', 'samuel.augusto.teixeira@email.com'     , '999.000.111-45', '2023-08-01'),
    ('Adriana Beatriz Silva'       , 'F', 'adriana.beatriz.silva@email.com'       , '111.222.333-46', '2023-08-02'),
    ('Renato Monteiro Santos'      , 'M', 'renato.monteiro.santos@email.com'      , '222.333.444-47', '2023-08-03'),
    ('Natália Cristina Gomes'      , 'F', 'natalia.cristina.gomes@email.com'      , '333.444.555-48', '2023-08-04'),
    ('Gustavo Luiz Ferreira'       , 'M', 'gustavo.luiz.ferreira@email.com'       , '444.555.666-49', '2023-08-05'),
    ('Camila Regina Carvalho'      , 'F', 'camila.regina.carvalho@email.com'      , '555.666.777-50', '2023-08-06');


SELECT * FROM Clientes

-- Inserindo os dados da tabela Vendedores
INSERT INTO Vendedores (Nome, Genero, Email, CPF, Data_admissao, Data_desligamento) VALUES
    ('Guilherme Pagano Amaral'   , 'M', 'guilherme.pagano@email.com'          , '539.897.569-14', '2023-05-15', '2023-09-04'),
    ('Ana Paula Ferreira'        , 'F', 'ana.paula.ferreira@email.com'        , '345.678.901-23', '2023-06-01', NULL        ),
    ('Carlos Eduardo Souza'      , 'M', 'carlos.eduardo.souza@email.com'      , '123.456.789-00', '2023-06-10', '2023-08-15'),
    ('Fernanda Cristina Santos'  , 'F', 'fernanda.cristina.santos@email.com'  , '234.567.890-12', '2023-06-15', NULL        ),
    ('João Pedro Carvalho'       , 'M', 'joao.pedro.carvalho@email.com'       , '345.678.901-45', '2023-06-20', NULL        ),
    ('Mariana Vitória Lima'      , 'F', 'mariana.vitoria.lima@email.com'      , '456.789.012-34', '2023-06-25', '2023-12-05'),
    ('Lucas Gabriel Nascimento'  , 'M', 'lucas.gabriel.nascimento@email.com'  , '567.890.123-56', '2023-07-01', NULL        ),
    ('Camila Gabriela Almeida'   , 'F', 'camila.gabriela.almeida@email.com'   , '678.901.234-67', '2023-07-05', '2023-10-22'),
    ('Rafael Augusto Silva'      , 'M', 'rafael.augusto.silva@email.com'      , '789.012.345-78', '2023-07-10', NULL        ),
    ('Isabela Regina Costa'      , 'F', 'isabela.regina.costa@email.com'      , '890.123.456-89', '2023-07-15', NULL        ),
    ('Pedro Henrique Ramos'      , 'M', 'pedro.henrique.ramos@email.com'      , '901.234.567-90', '2023-07-20', NULL        ),
    ('Laura Vitória Rocha'       , 'F', 'laura.vitoria.rocha@email.com'       , '012.345.678-91', '2023-07-25', NULL        ),
    ('Guilherme Augusto Teixeira', 'M', 'guilherme.augusto.teixeira@email.com', '123.567.890-01', '2023-07-30', NULL        ),
    ('Tatiane Duarte Gomes'      , 'F', 'tatiane.duarte.gomes@email.com'      , '234.678.901-23', '2023-08-01', '2023-10-10'),
    ('Alexandre Luiz Monteiro'   , 'M', 'alexandre.luiz.monteiro@email.com'   , '345.789.012-34', '2023-08-05', NULL        ),
    ('Bruna Carolina Martins'    , 'F', 'bruna.carolina.martins@email.com'    , '456.890.123-45', '2023-08-10', NULL        ),
    ('Fernando Augusto Costa'    , 'M', 'fernando.augusto.costa@email.com'    , '567.901.234-56', '2023-08-15', NULL        ),
    ('Carolina Beatriz Ramos'    , 'F', 'carolina.beatriz.ramos@email.com'    , '678.012.345-67', '2023-08-20', NULL        ),
    ('Marcelo Henrique Oliveira' , 'M', 'marcelo.henrique.oliveira@email.com' , '789.123.456-78', '2023-08-25', '2023-12-31'),
    ('Sandra Regina Almeida'     , 'F', 'sandra.regina.almeida@email.com'     , '890.234.567-89', '2023-08-30', NULL        );


SELECT * FROM Vendedores

-- Inserindo os dados da tabela Livros
INSERT INTO Livros (Nome, Autor, Genero_literario, Preco, Qtd_estoque, Qtd_minima) VALUES
    ('Revolução dos Bichos', 'George Orwell', 'Ficção', 14.99, 53, 10),
    ('1984', 'George Orwell', 'Ficção', 19.90, 47, 15),
    ('O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 34.99, 12, 5),
    ('Dom Quixote', 'Miguel de Cervantes', 'Romance', 39.99, 8, 2),
    ('A Origem das Espécies', 'Charles Darwin', 'Não-ficção', 49.90, 20, 8),
    ('Sherlock Holmes: Um Estudo em Vermelho', 'Arthur Conan Doyle', 'Mistério', 29.90, 15, 5),
    ('Orgulho e Preconceito', 'Jane Austen', 'Romance', 24.99, 30, 10),
    ('O Código Da Vinci', 'Dan Brown', 'Mistério', 27.50, 25, 8),
    ('Biografia de Albert Einstein', 'Walter Isaacson', 'Biografia', 54.90, 7, 3),
    ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Ficção', 19.90, 35, 10),
    ('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Fantasia', 34.99, 20, 7),
    ('As Crônicas de Nárnia', 'C.S. Lewis', 'Fantasia', 49.99, 10, 3),
    ('Moby Dick', 'Herman Melville', 'Ficção', 29.90, 8, 2),
    ('A Menina que Roubava Livros', 'Markus Zusak', 'Ficção', 24.90, 18, 5),
    ('O Morro dos Ventos Uivantes', 'Emily Brontë', 'Romance', 22.50, 22, 8),
    ('Crime e Castigo', 'Fyodor Dostoevsky', 'Romance', 34.90, 12, 5),
    ('O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 29.90, 15, 6),
    ('O Alquimista', 'Paulo Coelho', 'Ficção', 19.90, 50, 10),
    ('O Guia do Mochileiro das Galáxias', 'Douglas Adams', 'Ficção', 24.90, 18, 7),
    ('A Biografia de Steve Jobs', 'Walter Isaacson', 'Biografia', 59.90, 10, 4),
    ('Cem Anos de Solidão', 'Gabriel García Márquez', 'Ficção', 39.90, 25, 10),
    ('O Conto da Aia', 'Margaret Atwood', 'Ficção', 29.90, 20, 8),
    ('Jane Eyre', 'Charlotte Brontë', 'Romance', 24.99, 14, 5),
    ('Os Miseráveis', 'Victor Hugo', 'Romance', 44.90, 10, 3),
    ('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Fantasia', 34.90, 18, 7),
    ('Jogos Vorazes', 'Suzanne Collins', 'Fantasia', 39.90, 12, 5),
    ('A Sangue Frio', 'Truman Capote', 'Não-ficção', 29.90, 10, 4),
    ('O Nome da Rosa', 'Umberto Eco', 'Mistério', 34.90, 10, 3),
    ('Inferno', 'Dan Brown', 'Mistério', 27.99, 22, 7),
    ('Anne Frank: O Diário de uma Jovem', 'Anne Frank', 'Biografia', 19.90, 28, 10),
    ('A Divina Comédia', 'Dante Alighieri', 'Ficção', 29.99, 12, 5),
    ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Ficção', 19.99, 20, 8),
    ('O Alienista', 'Machado de Assis', 'Ficção', 14.90, 30, 10),
    ('O Último Desejo', 'Andrzej Sapkowski', 'Fantasia', 34.99, 15, 6),
    ('Os Irmãos Karamázov', 'Fyodor Dostoevsky', 'Romance', 39.99, 8, 3),
    ('A Dança da Morte', 'Stephen King', 'Mistério', 39.90, 14, 5),
    ('Sob a Redoma', 'Stephen King', 'Mistério', 44.90, 12, 4),
    ('Biografia de Winston Churchill', 'Andrew Roberts', 'Biografia', 54.90, 8, 3),
    ('Harry Potter e o Cálice de Fogo', 'J.K. Rowling', 'Fantasia', 34.99, 10, 5),
    ('O Silmarillion', 'J.R.R. Tolkien', 'Fantasia', 49.99, 8, 2),
    ('O Retrato de Dorian Gray', 'Oscar Wilde', 'Romance', 24.99, 18, 7),
    ('O Lobo da Estepe', 'Hermann Hesse', 'Ficção', 29.99, 12, 5),
    ('Biografia de Leonardo da Vinci', 'Walter Isaacson', 'Biografia', 59.99, 10, 4),
    ('A História Secreta', 'Donna Tartt', 'Ficção', 34.90, 14, 6),
    ('A Garota no Trem', 'Paula Hawkins', 'Mistério', 27.99, 18, 8),
    ('O Sol é Para Todos', 'Harper Lee', 'Ficção', 19.99, 24, 8),
    ('O Labirinto dos Espíritos', 'Carlos Ruiz Zafón', 'Mistério', 34.99, 14, 6),
    ('Eu, Robô', 'Isaac Asimov', 'Ficção', 29.90, 18, 7),
    ('Duna', 'Frank Herbert', 'Ficção', 39.99, 15, 5),
    ('Vinte Mil Léguas Submarinas', 'Jules Verne', 'Ficção', 29.90, 20, 8),
    ('A Máquina do Tempo', 'H.G. Wells', 'Ficção', 19.99, 25, 10),
    ('Frankenstein', 'Mary Shelley', 'Ficção', 24.99, 15, 6),
    ('Drácula', 'Bram Stoker', 'Ficção', 34.90, 10, 4),
    ('O Mundo de Sofia', 'Jostein Gaarder', 'Ficção', 19.90, 30, 10),
    ('Os Pilares da Terra', 'Ken Follett', 'Romance', 49.90, 8, 3),
    ('A Casa dos Espíritos', 'Isabel Allende', 'Romance', 39.99, 14, 6),
    ('O Velho e o Mar', 'Ernest Hemingway', 'Romance', 22.50, 18, 7),
    ('As Aventuras de Tom Sawyer', 'Mark Twain', 'Ficção', 19.99, 25, 10),
    ('O Grande Gatsby', 'F. Scott Fitzgerald', 'Romance', 24.99, 20, 8),
    ('O Jardim Secreto', 'Frances Hodgson Burnett', 'Ficção', 14.99, 30, 10),
    ('O Leitor', 'Bernhard Schlink', 'Romance', 34.90, 12, 5),
    ('A Roda do Tempo: O Olho do Mundo', 'Robert Jordan', 'Fantasia', 49.99, 10, 4),
    ('Eragon', 'Christopher Paolini', 'Fantasia', 29.99, 18, 6),
    ('Mistborn: O Império Final', 'Brandon Sanderson', 'Fantasia', 39.90, 15, 5),
    ('A Guerra dos Tronos', 'George R.R. Martin', 'Fantasia', 44.99, 12, 5),
    ('Os Magos', 'Lev Grossman', 'Fantasia', 34.99, 20, 8),
    ('Corte de Espinhos e Rosas', 'Sarah J. Maas', 'Fantasia', 39.99, 18, 7),
    ('O Assassinato no Expresso do Oriente', 'Agatha Christie', 'Mistério', 29.90, 15, 6),
    ('E Não Sobrou Nenhum', 'Agatha Christie', 'Mistério', 34.90, 12, 5),
    ('O Homem de Giz', 'C.J. Tudor', 'Mistério', 24.90, 25, 10),
    ('A Paciente Silenciosa', 'Alex Michaelides', 'Mistério', 27.99, 20, 8),
    ('Noites Brancas', 'Fyodor Dostoevsky', 'Romance', 19.99, 28, 10),
    ('O Idiota', 'Fyodor Dostoevsky', 'Romance', 44.90, 8, 3),
    ('Os Contos de Beedle, o Bardo', 'J.K. Rowling', 'Fantasia', 19.90, 18, 7),
    ('As Cidades Invisíveis', 'Italo Calvino', 'Ficção', 29.99, 15, 6),
    ('O Circo da Noite', 'Erin Morgenstern', 'Fantasia', 39.99, 10, 4),
    ('As Brumas de Avalon', 'Marion Zimmer Bradley', 'Fantasia', 49.99, 12, 5),
    ('Um Estudo em Escarlate', 'Arthur Conan Doyle', 'Mistério', 19.99, 25, 10),
    ('O Grande Mentecapto', 'Fernando Sabino', 'Ficção', 24.90, 18, 7),
    ('Dom Casmurro', 'Machado de Assis', 'Ficção', 19.90, 30, 10),
    ('Quincas Borba', 'Machado de Assis', 'Ficção', 24.99, 22, 8),
    ('A Moreninha', 'Joaquim Manuel de Macedo', 'Romance', 14.99, 35, 10),
    ('Capitães da Areia', 'Jorge Amado', 'Ficção', 19.90, 25, 8),
    ('Mar Morto', 'Jorge Amado', 'Ficção', 29.90, 15, 6),
    ('Gabriela, Cravo e Canela', 'Jorge Amado', 'Ficção', 34.90, 12, 5),
    ('Olga', 'Fernando Morais', 'Biografia', 39.99, 10, 4),
    ('O Livro dos Espíritos', 'Allan Kardec', 'Não-ficção', 19.99, 20, 8),
    ('O Príncipe', 'Nicolau Maquiavel', 'Não-ficção', 29.90, 18, 6),
    ('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Não-ficção', 39.90, 15, 5),
    ('Homo Deus: Uma Breve História do Amanhã', 'Yuval Noah Harari', 'Não-ficção', 44.90, 10, 4),
    ('A Revolução dos Voluntários', 'Leandro Karnal', 'Não-ficção', 34.99, 22, 8),
    ('Biografia de Nelson Mandela', 'Anthony Sampson', 'Biografia', 54.90, 8, 3),
    ('Biografia de Elon Musk', 'Ashlee Vance', 'Biografia', 49.99, 10, 4),
    ('Diário de um Banana', 'Jeff Kinney', 'Ficção', 19.99, 30, 10),
    ('Maze Runner: Correr ou Morrer', 'James Dashner', 'Ficção', 29.90, 20, 8),
    ('O Poder do Hábito', 'Charles Duhigg', 'Não-ficção', 24.99, 18, 6),
    ('Mindset: A Nova Psicologia do Sucesso', 'Carol S. Dweck', 'Não-ficção', 34.90, 12, 5),
    ('A Arte da Guerra', 'Sun Tzu', 'Não-ficção', 19.90, 35, 10),
    ('O Homem Mais Rico da Babilônia', 'George S. Clason', 'Não-ficção', 24.90, 20, 8);

SELECT * FROM Livros

-- Inserindo os dados da tabela Pedidos
INSERT INTO Pedidos (Cliente_id, Vendedor_id, Livro_id, Data_pedido, Quantidade, Valor_total) VALUES
    (0, 3, 10, '2023-05-15', 2, 29.98),
    (2, 5, 8, '2023-05-15', 1, 24.99),
    (0, 7, 14, '2023-05-16', 3, 89.97),
    (4, 9, 22, '2023-05-16', 1, 34.90),
    (0, 6, 5, '2023-05-17', 4, 59.96),
    (7, 11, 19, '2023-05-17', 2, 44.98),
    (0, 2, 40, '2023-05-18', 1, 49.99),
    (9, 4, 17, '2023-05-18', 3, 104.97),
    (10, 15, 9, '2023-05-19', 2, 59.98),
    (0, 12, 23, '2023-05-19', 3, 104.97),
    (12, 1, 45, '2023-05-20', 1, 24.90),
    (13, 8, 18, '2023-05-20', 2, 59.98),
    (0, 14, 31, '2023-05-21', 1, 34.99),
    (15, 3, 50, '2023-05-21', 3, 104.97),
    (16, 10, 29, '2023-05-22', 2, 79.98),
    (0, 13, 36, '2023-05-22', 4, 119.96),
    (19, 7, 41, '2023-05-23', 1, 14.99),
    (20, 9, 26, '2023-05-23', 2, 49.98),
    (0, 4, 33, '2023-05-24', 3, 89.97),
    (8, 11, 47, '2023-05-24', 1, 19.99),
	(5, 6, 15, '2023-05-25', 2, 44.98),
    (0, 8, 23, '2023-05-25', 3, 104.97),
    (18, 3, 5, '2023-05-26', 1, 14.99),
    (10, 4, 12, '2023-05-26', 4, 79.96),
    (0, 9, 37, '2023-05-27', 1, 29.99),
    (2, 14, 6, '2023-05-27', 2, 39.98),
    (9, 2, 45, '2023-05-28', 1, 24.90),
    (0, 5, 18, '2023-05-28', 3, 89.97),
    (15, 10, 32, '2023-05-29', 1, 19.99),
    (12, 11, 41, '2023-05-29', 2, 29.98),
    (0, 7, 13, '2023-05-30', 1, 34.90),
    (16, 12, 50, '2023-05-30', 3, 104.97),
    (8, 1, 33, '2023-06-01', 1, 24.99),
    (0, 3, 22, '2023-06-01', 4, 119.96),
    (6, 8, 10, '2023-06-02', 2, 29.98),
    (0, 2, 5, '2023-06-02', 3, 44.97),
    (19, 4, 9, '2023-06-03', 1, 19.99),
    (20, 6, 36, '2023-06-03', 2, 79.98),
    (0, 15, 24, '2023-06-04', 4, 99.96),
    (13, 10, 8, '2023-06-04', 1, 24.99),
    (7, 13, 30, '2023-06-05', 3, 89.97),
    (0, 11, 42, '2023-06-05', 1, 14.99),
    (17, 9, 21, '2023-06-06', 2, 49.98),
    (4, 7, 14, '2023-06-06', 4, 79.96),
    (0, 5, 39, '2023-06-07', 3, 89.97),
    (11, 2, 17, '2023-06-07', 2, 59.98),
    (14, 3, 28, '2023-06-08', 1, 29.99),
    (0, 4, 6, '2023-06-08', 2, 39.98),
    (18, 12, 47, '2023-06-09', 1, 19.99),
    (15, 6, 34, '2023-06-09', 3, 59.97),
    (0, 9, 43, '2023-06-10', 4, 99.96),
    (10, 8, 3, '2023-06-10', 2, 24.98),
    (8, 11, 11, '2023-06-11', 3, 74.97),
    (0, 1, 20, '2023-06-11', 1, 24.99),
    (2, 14, 25, '2023-06-12', 4, 119.96),
    (0, 15, 7, '2023-06-12', 2, 39.98),
    (14, 3, 29, '2023-06-13', 1, 19.99),
    (6, 7, 46, '2023-06-13', 4, 119.96),
    (0, 9, 35, '2023-06-14', 3, 89.97),
    (12, 4, 49, '2023-06-14', 2, 49.98),
	(9, 6, 15, '2023-06-15', 2, 44.98),
    (0, 2, 23, '2023-06-15', 3, 104.97),
    (18, 7, 5, '2023-06-16', 1, 14.99),
    (12, 4, 12, '2023-06-16', 4, 79.96),
    (0, 10, 37, '2023-06-17', 1, 29.99),
    (3, 8, 6, '2023-06-17', 2, 39.98),
    (6, 11, 45, '2023-06-18', 1, 24.90),
    (0, 9, 18, '2023-06-18', 3, 89.97),
    (15, 5, 32, '2023-06-19', 1, 19.99),
    (14, 12, 41, '2023-06-19', 2, 29.98),
    (0, 14, 13, '2023-06-20', 1, 34.90),
    (16, 7, 50, '2023-06-20', 3, 104.97),
    (8, 13, 33, '2023-06-21', 1, 24.99),
    (0, 6, 22, '2023-06-21', 4, 119.96),
    (10, 3, 10, '2023-06-22', 2, 29.98),
    (0, 5, 5, '2023-06-22', 3, 44.97),
    (20, 15, 9, '2023-06-23', 1, 19.99),
    (11, 9, 36, '2023-06-23', 2, 79.98),
    (0, 8, 24, '2023-06-24', 4, 99.96),
    (19, 11, 8, '2023-06-24', 1, 24.99),
    (7, 4, 30, '2023-06-25', 3, 89.97),
    (0, 12, 42, '2023-06-25', 1, 14.99),
    (17, 2, 21, '2023-06-26', 2, 49.98),
    (13, 14, 14, '2023-06-26', 4, 79.96),
    (0, 1, 39, '2023-06-27', 3, 89.97),
    (6, 3, 17, '2023-06-27', 2, 59.98),
    (5, 8, 28, '2023-06-28', 1, 29.99),
    (0, 14, 6, '2023-06-28', 2, 39.98),
    (18, 7, 47, '2023-06-29', 1, 19.99),
    (9, 6, 34, '2023-06-29', 3, 59.97),
    (0, 4, 43, '2023-06-30', 4, 99.96),
    (20, 5, 3, '2023-06-30', 2, 24.98),
    (14, 11, 11, '2023-07-01', 3, 74.97),
    (0, 9, 20, '2023-07-01', 1, 24.99),
    (15, 8, 25, '2023-07-02', 4, 119.96),
    (0, 7, 7, '2023-07-02', 2, 39.98),
    (12, 10, 29, '2023-07-03', 1, 19.99),
    (19, 2, 46, '2023-07-03', 4, 119.96),
    (0, 3, 35, '2023-07-04', 3, 89.97),
    (16, 6, 49, '2023-07-04', 2, 49.98),
	(0, 4, 2, '2023-07-05', 1, 19.99),
    (13, 8, 16, '2023-07-05', 3, 74.97),
    (11, 14, 27, '2023-07-06', 2, 39.98),
    (0, 6, 31, '2023-07-06', 4, 119.96),
    (8, 11, 4, '2023-07-07', 1, 14.99),
    (17, 9, 19, '2023-07-07', 2, 29.98),
    (0, 7, 38, '2023-07-08', 3, 104.97),
    (18, 5, 40, '2023-07-08', 1, 34.99),
    (9, 10, 44, '2023-07-09', 4, 99.96),
    (0, 12, 12, '2023-07-09', 1, 19.99),
    (10, 3, 18, '2023-07-10', 3, 89.97),
    (15, 14, 45, '2023-07-10', 2, 59.98),
    (6, 13, 23, '2023-07-11', 1, 24.99),
    (0, 2, 25, '2023-07-11', 4, 119.96),
    (20, 4, 9, '2023-07-12', 2, 39.98),
    (16, 7, 22, '2023-07-12', 3, 89.97),
    (0, 8, 14, '2023-07-13', 1, 19.99),
    (12, 9, 30, '2023-07-13', 2, 59.98),
    (5, 6, 6, '2023-07-14', 3, 44.97),
    (0, 14, 48, '2023-07-14', 4, 129.96),
    (19, 11, 24, '2023-07-15', 1, 34.99),
    (14, 10, 35, '2023-07-15', 2, 49.98),
    (0, 5, 1, '2023-07-16', 3, 44.97),
    (8, 12, 46, '2023-07-16', 4, 119.96),
    (7, 3, 29, '2023-07-17', 1, 24.99),
    (0, 2, 21, '2023-07-17', 3, 89.97),
    (18, 4, 13, '2023-07-18', 2, 39.98),
    (13, 9, 50, '2023-07-18', 4, 119.96),
    (0, 1, 20, '2023-07-19', 1, 24.99),
    (6, 7, 8, '2023-07-19', 3, 74.97),
    (15, 14, 37, '2023-07-20', 2, 59.98),
    (0, 10, 3, '2023-07-20', 4, 99.96),
    (12, 8, 17, '2023-07-21', 1, 14.99),
    (11, 11, 26, '2023-07-21', 2, 39.98),
    (0, 5, 40, '2023-07-22', 3, 104.97),
    (20, 13, 28, '2023-07-22', 4, 79.96),
    (19, 9, 39, '2023-07-23', 1, 19.99),
    (0, 6, 11, '2023-07-23', 2, 29.98),
    (8, 3, 15, '2023-07-24', 3, 74.97),
    (16, 14, 34, '2023-07-24', 4, 119.96),
    (0, 12, 18, '2023-07-25', 1, 24.99),
    (10, 4, 27, '2023-07-25', 2, 39.98),
    (13, 7, 2, '2023-07-26', 3, 44.97),
    (0, 10, 43, '2023-07-26', 4, 129.96),
    (5, 11, 7, '2023-07-27', 1, 19.99),
    (15, 2, 32, '2023-07-27', 2, 59.98),
    (0, 5, 42, '2023-07-28', 3, 104.97),
    (18, 14, 38, '2023-07-28', 4, 129.96),
    (14, 8, 9, '2023-07-29', 1, 24.99),
    (0, 6, 4, '2023-07-29', 2, 29.98),
    (19, 3, 31, '2023-07-30', 3, 89.97),
    (7, 9, 45, '2023-07-30', 4, 119.96),
    (0, 1, 10, '2023-07-31', 1, 24.99),
    (8, 13, 36, '2023-07-31', 3, 74.97),
	(3, 7, 20, '2023-08-01', 2, 39.98),
    (0, 9, 12, '2023-08-01', 4, 79.96),
    (15, 5, 11, '2023-08-02', 3, 59.97),
    (0, 6, 30, '2023-08-02', 1, 29.99),
    (10, 13, 35, '2023-08-03', 4, 79.96),
    (8, 12, 14, '2023-08-03', 2, 49.98),
    (0, 10, 40, '2023-08-04', 1, 34.99),
    (19, 8, 50, '2023-08-04', 3, 104.97),
    (11, 3, 5, '2023-08-05', 4, 59.96),
    (0, 4, 41, '2023-08-05', 2, 49.98),
    (20, 9, 3, '2023-08-06', 3, 44.97),
    (12, 11, 18, '2023-08-06', 1, 24.99),
    (0, 6, 24, '2023-08-07', 4, 79.96),
    (18, 2, 7, '2023-08-07', 2, 39.98),
    (17, 14, 27, '2023-08-08', 3, 89.97),
    (0, 8, 42, '2023-08-08', 1, 29.99),
    (9, 5, 15, '2023-08-09', 2, 49.98),
    (13, 7, 22, '2023-08-09', 4, 99.96),
    (0, 3, 6, '2023-08-10', 1, 14.99),
    (7, 12, 45, '2023-08-10', 3, 104.97),
    (14, 11, 36, '2023-08-11', 2, 59.98),
    (0, 2, 1, '2023-08-11', 4, 59.96),
    (6, 14, 9, '2023-08-12', 1, 24.99),
    (16, 10, 34, '2023-08-12', 3, 74.97),
    (0, 13, 4, '2023-08-13', 2, 29.98),
    (18, 7, 14, '2023-08-13', 4, 119.96),
    (15, 5, 10, '2023-08-14', 3, 74.97),
    (0, 9, 23, '2023-08-14', 1, 24.99),
    (10, 8, 32, '2023-08-15', 2, 49.98),
    (20, 6, 38, '2023-08-15', 4, 129.96),
    (0, 12, 21, '2023-08-16', 1, 19.99),
    (3, 4, 50, '2023-08-16', 2, 49.98),
    (11, 1, 19, '2023-08-17', 3, 74.97),
    (0, 3, 29, '2023-08-17', 4, 119.96),
    (7, 14, 16, '2023-08-18', 1, 24.99),
    (8, 2, 8, '2023-08-18', 3, 89.97),
    (0, 10, 13, '2023-08-19', 2, 39.98),
    (13, 9, 25, '2023-08-19', 4, 99.96),
    (9, 6, 37, '2023-08-20', 1, 19.99),
    (0, 7, 28, '2023-08-20', 2, 49.98),
    (18, 11, 46, '2023-08-21', 3, 104.97),
    (5, 8, 31, '2023-08-21', 4, 119.96),
    (0, 12, 2, '2023-08-22', 1, 19.99),
    (20, 4, 44, '2023-08-22', 2, 59.98),
    (12, 14, 40, '2023-08-23', 3, 104.97),
    (0, 5, 17, '2023-08-23', 4, 89.96),
    (14, 2, 48, '2023-08-24', 1, 29.99),
    (16, 6, 26, '2023-08-24', 3, 89.97),
    (0, 13, 39, '2023-08-25', 2, 49.98),
    (18, 10, 41, '2023-08-25', 4, 129.96),
    (15, 3, 11, '2023-08-26', 1, 24.99),
    (0, 9, 5, '2023-08-26', 2, 39.98),
    (13, 8, 30, '2023-08-27', 3, 89.97),
    (0, 14, 7, '2023-08-27', 4, 59.96),
    (3, 11, 18, '2023-08-28', 1, 24.99),
    (7, 6, 4, '2023-08-28', 2, 29.98),
    (0, 5, 42, '2023-08-29', 3, 104.97),
    (19, 10, 33, '2023-08-29', 4, 129.96),
    (8, 1, 9, '2023-08-30', 1, 24.99),
    (0, 3, 12, '2023-08-30', 3, 74.97),
    (20, 8, 50, '2023-08-31', 2, 49.98),
    (11, 7, 2, '2023-08-31', 4, 59.96),
	(0, 6, 26, '2023-09-01', 2, 49.98),
    (13, 3, 14, '2023-09-01', 4, 99.96),
    (0, 12, 35, '2023-09-02', 3, 89.97),
    (20, 7, 22, '2023-09-02', 1, 29.99),
    (10, 5, 43, '2023-09-03', 4, 119.96),
    (0, 8, 19, '2023-09-03', 2, 49.98),
    (7, 2, 6, '2023-09-04', 1, 14.99),
    (0, 1, 17, '2023-09-04', 4, 59.96),
    (3, 11, 11, '2023-09-05', 2, 39.98),
    (20, 4, 8, '2023-09-05', 3, 74.97),
    (0, 13, 24, '2023-09-06', 1, 19.99),
    (9, 7, 32, '2023-09-06', 4, 129.96),
    (0, 5, 5, '2023-09-07', 3, 74.97),
    (18, 6, 38, '2023-09-07', 2, 59.98),
    (14, 3, 33, '2023-09-08', 1, 29.99),
    (0, 9, 10, '2023-09-08', 4, 89.96),
    (20, 12, 28, '2023-09-09', 2, 49.98),
    (8, 5, 50, '2023-09-09', 3, 104.97),
    (0, 14, 7, '2023-09-10', 1, 24.99),
    (13, 3, 27, '2023-09-10', 4, 119.96),
    (0, 11, 23, '2023-09-11', 2, 49.98),
    (15, 10, 36, '2023-09-11', 3, 74.97),
    (0, 6, 12, '2023-09-12', 1, 29.99),
    (19, 8, 46, '2023-09-12', 4, 129.96),
    (3, 7, 28, '2023-09-13', 2, 59.98),
    (0, 5, 33, '2023-09-13', 1, 24.99),
    (8, 2, 14, '2023-09-14', 3, 74.97),
    (0, 12, 19, '2023-09-14', 4, 89.96),
    (20, 6, 9, '2023-09-15', 2, 39.98),
    (0, 14, 16, '2023-09-15', 1, 24.99),
    (7, 4, 43, '2023-09-16', 3, 89.97),
    (0, 13, 17, '2023-09-16', 4, 119.96),
    (19, 9, 6, '2023-09-17', 2, 49.98),
    (13, 11, 21, '2023-09-17', 1, 24.99),
    (0, 3, 32, '2023-09-18', 4, 129.96),
    (15, 8, 22, '2023-09-18', 3, 74.97),
    (0, 7, 38, '2023-09-19', 2, 59.98),
    (20, 5, 30, '2023-09-19', 4, 99.96),
    (8, 12, 5, '2023-09-20', 3, 74.97),
    (0, 10, 25, '2023-09-20', 1, 24.99),
    (3, 1, 18, '2023-09-21', 4, 119.96),
    (0, 14, 11, '2023-09-21', 2, 49.98),
    (19, 6, 8, '2023-09-22', 3, 74.97),
    (0, 5, 14, '2023-09-22', 4, 89.96),
    (7, 9, 33, '2023-09-23', 1, 29.99),
    (0, 10, 45, '2023-09-23', 2, 59.98),
    (18, 4, 30, '2023-09-24', 4, 119.96),
    (13, 8, 13, '2023-09-24', 1, 24.99),
    (3, 12, 16, '2023-09-25', 2, 49.98),
    (0, 6, 12, '2023-09-25', 4, 59.96),
    (20, 7, 28, '2023-09-26', 3, 74.97),
    (15, 5, 33, '2023-09-26', 2, 59.98),
    (0, 1, 50, '2023-09-27', 4, 129.96),
    (13, 9, 39, '2023-09-27', 1, 24.99),
    (0, 10, 24, '2023-09-28', 3, 89.97),
    (20, 6, 22, '2023-09-28', 2, 49.98),
    (8, 4, 31, '2023-09-29', 4, 119.96),
    (0, 14, 17, '2023-09-29', 3, 74.97),
    (7, 11, 23, '2023-09-30', 2, 39.98),
    (0, 6, 37, '2023-09-30', 4, 129.96),
    (0, 10, 5, '2023-09-30', 1, 14.99),
    (20, 4, 12, '2023-09-30', 3, 44.97),
    (10, 5, 17, '2023-09-30', 2, 49.98),
    (0, 7, 33, '2023-10-01', 1, 24.99),
    (13, 2, 22, '2023-10-01', 4, 119.96),
    (0, 6, 19, '2023-10-02', 2, 49.98),
    (15, 8, 50, '2023-10-02', 1, 29.99),
    (0, 10, 43, '2023-10-03', 1, 29.99),
    (18, 7, 28, '2023-10-03', 3, 89.97),
    (0, 4, 33, '2023-10-04', 1, 14.99),
    (19, 12, 22, '2023-10-04', 1, 24.99),
    (0, 11, 25, '2023-10-05', 1, 19.99),
    (7, 5, 39, '2023-10-05', 4, 119.96),
    (0, 9, 15, '2023-10-06', 1, 14.99),
    (20, 3, 44, '2023-10-06', 2, 49.98),
    (0, 14, 27, '2023-10-07', 3, 74.97),
    (8, 2, 18, '2023-10-07', 1, 19.99),
    (0, 7, 6, '2023-10-08', 1, 14.99),
    (13, 6, 32, '2023-10-08', 2, 49.98),
    (0, 12, 34, '2023-10-09', 1, 24.99),
    (7, 4, 9, '2023-10-09', 3, 89.97),
    (0, 5, 50, '2023-10-10', 1, 29.99),
    (20, 3, 30, '2023-10-10', 4, 119.96),
    (10, 8, 43, '2023-10-11', 1, 29.99),
    (0, 14, 27, '2023-10-11', 3, 74.97),
    (19, 9, 15, '2023-10-12', 2, 49.98),
    (0, 13, 29, '2023-10-12', 4, 119.96),
    (7, 2, 25, '2023-10-13', 1, 24.99),
    (0, 11, 44, '2023-10-13', 1, 19.99),
    (18, 4, 33, '2023-10-14', 2, 49.98),
    (0, 5, 39, '2023-10-14', 4, 119.96),
    (13, 7, 42, '2023-10-15', 1, 29.99),
    (0, 10, 19, '2023-10-15', 3, 74.97),
    (20, 12, 36, '2023-10-16', 1, 29.99),
    (0, 4, 38, '2023-10-16', 2, 49.98),
    (19, 6, 20, '2023-10-17', 3, 89.97),
    (0, 9, 7, '2023-10-17', 1, 14.99),
    (7, 11, 33, '2023-10-18', 4, 119.96),
    (0, 3, 31, '2023-10-18', 2, 49.98),
    (20, 5, 44, '2023-10-19', 1, 29.99),
    (0, 12, 11, '2023-10-19', 1, 14.99),
    (19, 7, 50, '2023-10-20', 3, 89.97),
    (0, 8, 9, '2023-10-20', 2, 49.98),
    (15, 13, 22, '2023-10-21', 4, 119.96),
    (0, 2, 38, '2023-10-21', 1, 24.99),
    (7, 9, 33, '2023-10-22', 1, 14.99),
    (0, 14, 5, '2023-10-22', 2, 49.98),
    (20, 6, 16, '2023-10-23', 3, 89.97),
    (0, 3, 50, '2023-10-23', 1, 29.99),
    (13, 11, 40, '2023-10-24', 1, 29.99),
    (0, 9, 19, '2023-10-24', 2, 49.98),
    (0, 10, 35, '2023-10-25', 1, 24.99),
    (19, 7, 9, '2023-10-25', 3, 89.97),
    (0, 2, 20, '2023-10-26', 1, 14.99),
    (7, 5, 30, '2023-10-26', 4, 119.96),
    (0, 6, 50, '2023-10-27', 1, 29.99),
    (13, 9, 15, '2023-10-27', 2, 49.98),
    (0, 12, 33, '2023-10-28', 4, 119.96),
    (7, 4, 39, '2023-10-28', 1, 29.99),
    (0, 10, 22, '2023-10-29', 3, 74.97),
    (19, 5, 12, '2023-10-29', 2, 49.98),
    (0, 14, 26, '2023-10-30', 4, 119.96),
    (20, 3, 29, '2023-10-30', 1, 29.99),
    (0, 8, 27, '2023-10-31', 1, 24.99),
    (7, 11, 13, '2023-10-31', 2, 49.98),
    (0, 4, 12, '2023-10-31', 3, 89.97),
    (19, 10, 6, '2023-11-01', 2, 49.98),
    (0, 3, 29, '2023-11-01', 1, 14.99),
    (7, 6, 45, '2023-11-01', 4, 119.96),
    (20, 5, 22, '2023-11-02', 1, 24.99),
    (0, 8, 41, '2023-11-02', 2, 49.98),
    (13, 7, 38, '2023-11-03', 3, 89.97),
    (0, 12, 47, '2023-11-03', 1, 29.99),
    (19, 9, 18, '2023-11-04', 4, 119.96),
    (0, 14, 50, '2023-11-04', 2, 49.98),
    (7, 10, 3, '2023-11-05', 1, 14.99),
    (0, 11, 31, '2023-11-05', 3, 74.97),
    (20, 12, 44, '2023-11-06', 2, 49.98),
    (0, 4, 21, '2023-11-06', 1, 19.99),
    (19, 5, 34, '2023-11-07', 1, 29.99),
    (0, 6, 30, '2023-11-07', 4, 119.96),
    (7, 3, 9, '2023-11-08', 1, 14.99),
    (0, 7, 19, '2023-11-08', 2, 49.98),
    (13, 4, 40, '2023-11-09', 3, 89.97),
    (0, 5, 15, '2023-11-09', 1, 14.99),
    (20, 9, 8, '2023-11-10', 4, 119.96),
    (0, 2, 37, '2023-11-10', 2, 49.98),
    (19, 10, 5, '2023-11-11', 1, 29.99),
    (0, 8, 32, '2023-11-11', 3, 89.97),
    (7, 11, 16, '2023-11-12', 2, 49.98),
    (0, 3, 28, '2023-11-12', 1, 14.99),
    (20, 6, 13, '2023-11-13', 4, 119.96),
    (0, 14, 49, '2023-11-13', 2, 49.98),
    (19, 5, 12, '2023-11-14', 1, 24.99),
    (0, 6, 43, '2023-11-14', 3, 74.97),
    (7, 9, 35, '2023-11-15', 2, 49.98),
    (0, 10, 26, '2023-11-15', 4, 119.96),
    (13, 7, 21, '2023-11-16', 3, 89.97),
    (0, 2, 48, '2023-11-16', 1, 29.99),
    (20, 5, 14, '2023-11-17', 2, 49.98),
    (0, 4, 36, '2023-11-17', 1, 19.99),
    (19, 8, 23, '2023-11-18', 4, 119.96),
    (0, 11, 33, '2023-11-18', 3, 74.97),
    (7, 9, 30, '2023-11-19', 2, 49.98),
    (0, 5, 7, '2023-11-19', 1, 14.99),
    (13, 6, 27, '2023-11-20', 1, 24.99),
    (0, 12, 16, '2023-11-20', 4, 119.96),
    (20, 8, 11, '2023-11-21', 3, 89.97),
    (0, 4, 42, '2023-11-21', 1, 29.99),
    (19, 2, 39, '2023-11-22', 2, 49.98),
    (0, 9, 5, '2023-11-22', 3, 74.97),
    (7, 5, 25, '2023-11-23', 4, 119.96),
    (0, 8, 44, '2023-11-23', 1, 29.99),
    (13, 7, 46, '2023-11-24', 3, 89.97),
    (0, 6, 24, '2023-11-24', 2, 49.98),
    (20, 12, 33, '2023-11-25', 1, 24.99),
    (0, 2, 29, '2023-11-25', 4, 119.96),
    (19, 10, 14, '2023-11-26', 1, 29.99),
    (0, 3, 39, '2023-11-26', 3, 74.97),
    (7, 11, 50, '2023-11-27', 2, 49.98),
    (0, 12, 31, '2023-11-27', 4, 119.96),
    (13, 9, 21, '2023-11-28', 1, 24.99),
    (0, 10, 44, '2023-11-28', 3, 89.97),
    (20, 8, 7, '2023-11-29', 4, 119.96),
    (0, 6, 35, '2023-11-29', 2, 49.98),
    (19, 5, 42, '2023-11-30', 1, 29.99),
    (20, 7, 5, '2023-12-01', 1, 14.99),
    (0, 9, 34, '2023-12-01', 2, 49.98),
    (13, 3, 18, '2023-12-01', 3, 89.97),
    (0, 11, 25, '2023-12-02', 4, 119.96),
    (19, 5, 30, '2023-12-02', 1, 24.99),
    (0, 8, 48, '2023-12-02', 2, 49.98),
    (7, 10, 14, '2023-12-03', 3, 74.97),
    (0, 4, 40, '2023-12-03', 4, 119.96),
    (20, 12, 6, '2023-12-04', 1, 14.99),
    (0, 3, 32, '2023-12-04', 3, 89.97),
    (13, 7, 26, '2023-12-04', 2, 49.98),
    (0, 9, 47, '2023-12-05', 4, 119.96),
    (19, 11, 21, '2023-12-05', 1, 19.99),
    (0, 5, 41, '2023-12-05', 2, 49.98),
    (7, 8, 20, '2023-12-06', 3, 74.97),
    (0, 6, 37, '2023-12-06', 4, 119.96),
    (20, 4, 12, '2023-12-07', 1, 24.99),
    (0, 10, 44, '2023-12-07', 3, 89.97),
    (13, 2, 15, '2023-12-07', 2, 49.98),
    (0, 12, 29, '2023-12-08', 4, 119.96),
    (19, 7, 9, '2023-12-08', 1, 14.99),
    (0, 5, 45, '2023-12-08', 2, 49.98),
    (7, 3, 39, '2023-12-09', 3, 74.97),
    (0, 8, 27, '2023-12-09', 4, 119.96),
    (20, 9, 18, '2023-12-10', 1, 24.99),
    (0, 6, 50, '2023-12-10', 3, 89.97),
    (13, 11, 16, '2023-12-10', 2, 49.98),
    (0, 4, 23, '2023-12-11', 4, 119.96),
    (19, 10, 35, '2023-12-11', 1, 19.99),
    (0, 2, 33, '2023-12-11', 2, 49.98),
    (7, 12, 19, '2023-12-12', 3, 74.97),
    (0, 8, 24, '2023-12-12', 4, 119.96),
    (20, 6, 28, '2023-12-13', 1, 14.99),
    (0, 7, 43, '2023-12-13', 3, 89.97),
    (13, 9, 22, '2023-12-13', 2, 49.98),
    (0, 5, 46, '2023-12-14', 4, 119.96),
    (19, 4, 11, '2023-12-14', 1, 24.99),
    (0, 10, 31, '2023-12-14', 2, 49.98),
    (7, 3, 48, '2023-12-15', 3, 74.97),
    (0, 12, 36, '2023-12-15', 4, 119.96),
    (20, 8, 15, '2023-12-16', 1, 19.99),
    (0, 2, 44, '2023-12-16', 3, 89.97),
    (13, 7, 14, '2023-12-16', 2, 49.98),
    (0, 9, 21, '2023-12-17', 4, 119.96),
    (19, 5, 18, '2023-12-17', 1, 14.99),
    (0, 6, 30, '2023-12-17', 2, 49.98),
    (7, 11, 42, '2023-12-18', 3, 74.97),
    (0, 4, 29, '2023-12-18', 4, 119.96),
    (20, 10, 5, '2023-12-19', 1, 24.99),
    (0, 3, 34, '2023-12-19', 3, 89.97),
    (13, 7, 46, '2023-12-19', 2, 49.98),
    (0, 12, 39, '2023-12-20', 4, 119.96),
    (19, 8, 25, '2023-12-20', 1, 19.99),
    (0, 9, 22, '2023-12-20', 2, 49.98),
    (7, 5, 41, '2023-12-21', 3, 74.97),
    (0, 6, 37, '2023-12-21', 4, 119.96),
    (20, 11, 13, '2023-12-22', 1, 14.99),
    (0, 4, 28, '2023-12-22', 3, 89.97),
    (13, 10, 31, '2023-12-22', 2, 49.98),
    (0, 3, 45, '2023-12-23', 4, 119.96),
    (19, 9, 17, '2023-12-23', 1, 24.99),
    (0, 7, 38, '2023-12-23', 2, 49.98),
    (7, 5, 33, '2023-12-24', 3, 74.97),
    (0, 8, 30, '2023-12-24', 4, 119.96),
    (20, 2, 10, '2023-12-25', 1, 19.99),
    (0, 11, 49, '2023-12-25', 3, 89.97),
    (13, 6, 23, '2023-12-25', 2, 49.98),
    (0, 12, 24, '2023-12-26', 4, 119.96),
    (19, 4, 13, '2023-12-26', 1, 14.99),
    (0, 9, 43, '2023-12-26', 2, 49.98),
    (7, 3, 18, '2023-12-27', 3, 74.97);

SELECT * FROM Pedidos


-- ANÁLISE DE DADOS

-- ANÁLISE FINACEIRA
-- Qual o Total faturado pela livraria?

SELECT
	SUM(Valor_total)
FROM 
	Pedidos

-- Qual o faturamento por Mês da livraria?

SELECT
	MONTH(Data_pedido),
	SUM(Valor_total)
FROM 
	Pedidos
GROUP BY MONTH(Data_pedido)

-- Qual Gênero literário de livro gera mais receita?

SELECT
	Genero_literario,
	ROUND(SUM(Valor_total),2)
FROM 
	Pedidos
LEFT JOIN Livros 
	ON Pedidos.Livro_id = Livros.Livro_id
GROUP BY Genero_literario
ORDER BY SUM(Valor_total) DESC

-- Qual o ticket médio dos pedidos da livraria?

SELECT
	ROUND(SUM(Valor_total) / COUNT(*), 2) AS Ticket_medio
FROM
	Pedidos

-- ANÁLISE DE PEDIDOS
-- Qual o total de pedidos feitos?

SELECT 
	COUNT(*) AS 'Quantidade de Pedidos'
FROM
	Pedidos

-- Qual a quantidade de pedidos feitos por mês?

SELECT
	MONTH(Data_pedido) AS 'Mês',
	COUNT(*) AS 'Quantidade de Pedidos'
FROM
	Pedidos
GROUP BY MONTH(Data_pedido)

-- Quais os Livros mais vendidos da livraria?  Além da quantidade, mostre o faturamento gerado por esses livros para verificar se os mais vendidos também são os mais lucrativos.

SELECT 
	Livros.Nome,
	Livros.Autor,
	Livros.Genero_literario,
	Livros.Preco,
	SUM(Pedidos.Quantidade) AS 'Quantidade de livros',
	SUM(Pedidos.Valor_total) AS 'Faturamento por Livro'
FROM
	Pedidos
LEFT JOIN Livros 
	ON Pedidos.Livro_id = Livros.Livro_id
GROUP BY Nome, Autor, Genero_literario, Preco
ORDER BY SUM(Pedidos.Quantidade) DESC, SUM(Pedidos.Valor_total) DESC 


-- Qual a média de livros por pedido? E qual a média por genero?

SELECT 
	AVG(Quantidade) AS 'Média de Livros por Pedido'
FROM
	Pedidos

SELECT 
	Livros.Genero_literario,
	AVG(Pedidos.Quantidade) AS 'Média de Livros por Pedido'
FROM
	Pedidos
LEFT JOIN Livros
	ON Pedidos.Livro_id = Livros.Livro_id
GROUP BY Livros.Genero_literario
ORDER BY AVG(Pedidos.Quantidade) DESC

-- ANÁLISE DE ESTOQUE
-- Qual a quantidade total de livros em estoque? E qual o total por Genero literário?

SELECT 
	SUM(Qtd_estoque) AS 'Total em Estoque'
FROM
	Livros


SELECT 
	Genero_literario,
	SUM(Qtd_estoque) AS 'Total em Estoque'
FROM
	Livros
GROUP BY Genero_literario
ORDER BY SUM(Qtd_estoque) DESC

-- Quais os livros que precisam ser comprados neste momento que estão abaixo da quantidade mínima de estoque?

SELECT 
	* 
FROM 
	Livros
WHERE Qtd_estoque < Qtd_minima


-- ANÁLISE DE VENDEDORES E CLIENTES
-- Qual a quantidade de vendedores ativos vs quantidade de vendedores demitidos? Exibir também em formato de porcentagem

SELECT
	SUM(CASE WHEN Data_desligamento IS NULL THEN 1 ELSE 0 END) AS 'Total Vendedores Ativos',
	SUM(CASE WHEN Data_desligamento IS NOT NULL THEN 1 ELSE 0 END) AS 'Total Vendedores Demitidos',
	ROUND(SUM(CASE WHEN Data_desligamento IS NULL THEN 1 ELSE 0 END), 2) * 100 / COUNT(*) AS 'Porcentagem Vendedores Ativos',
	ROUND(SUM(CASE WHEN Data_desligamento IS NOT NULL THEN 1 ELSE 0 END), 2) * 100 / COUNT(*) AS 'Porcentagem Vendedores Demitidos'
FROM
	Vendedores

-- Quais os vendedores que mais venderam? Considerando apenas os vendedores ativos. 

SELECT 
	Vendedores.Vendedor_id,
	Vendedores.Nome,
	COUNT(Pedidos.Pedido_id) AS 'Total Vendas'
FROM
	Pedidos
LEFT JOIN Vendedores 
	ON Pedidos.Vendedor_id = Vendedores.Vendedor_id
WHERE Vendedores.Data_desligamento IS NULL
GROUP BY Vendedores.Vendedor_id, Vendedores.Nome
ORDER BY COUNT(Pedidos.Pedido_id) DESC

-- Qual a quantidade de pedidos feitos com clientes sem cadastros comparado com as que possuem cadastro? Exibir também em formato de porcentagem.

SELECT
	SUM(CASE WHEN Cliente_id = 0 THEN 1 ELSE 0 END) AS 'Qtd Clientes sem cadastro',
	SUM(CASE WHEN Cliente_id <> 0 THEN 1 ELSE 0 END) AS 'Qtd Clientes com cadastro',
    ROUND(SUM(CASE WHEN Cliente_id = 0 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS 'Porcentagem Clientes sem Cadastro',
    ROUND(SUM(CASE WHEN Cliente_id <> 0 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS 'Porcentagem Clientes com Cadastro'
FROM 
    Pedidos

-- Qual o Tempo médio entre compras por cliente ?

WITH Compras AS (
    SELECT 
        Cliente_id, 
        Data_pedido,
        LEAD(Data_pedido) OVER (PARTITION BY Cliente_id ORDER BY Data_pedido) AS Proxima_Compra
    FROM Pedidos
)

SELECT 
    ROUND(AVG(DATEDIFF(DAY, Data_pedido, Proxima_Compra)), 2) AS 'Media Tempo Entre as Compras'
FROM Compras
WHERE Proxima_Compra IS NOT NULL

