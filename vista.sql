

USE alendavista;

/* Lógico_1: */


-- Tabela de Candidatos
CREATE TABLE Candidato (
    candidato_id INT PRIMARY KEY, -- id_candidato -> candidato_id
    nome VARCHAR(100), -- Nome -> nome
    cpf CHAR(11), -- CPF -> cpf
    data_nascimento DATE, -- data_nascimento_ -> data_nascimento
    cota_candidato VARCHAR(20), -- cota -> cota_candidato
    email VARCHAR(100), -- Email -> email
    endereco VARCHAR(150), -- Endereco -> endereco
    telefone CHAR(11) -- telefone -> telefone
);

-- Tabela de Administradores
CREATE TABLE Administrador (
    administrador_id INT PRIMARY KEY, -- id_Administrador_ -> administrador_id
    nome VARCHAR(100), -- Nome -> nome
    processo_seletivo_id INT, -- fk_Processo_seletivo_Equipe_id_processo -> processo_seletivo_id
    equipe_id INT, -- fk_Processo_seletivo_Equipe_id_equipe -> equipe_id
    CONSTRAINT fk_Administrador_Equipe FOREIGN KEY (processo_seletivo_id, equipe_id)
        REFERENCES Processo_Seletivo_Equipe (processo_seletivo_id, equipe_id)
        ON DELETE RESTRICT
);

-- Tabela de Processos Seletivos e Equipes
CREATE TABLE Processo_Seletivo_Equipe (
    processo_seletivo_id INT, -- id_processo -> processo_seletivo_id
    cota_equipe VARCHAR(20), -- Cota_ -> cota_equipe
    vagas INT, -- Vagas -> vagas
    equipe_id INT, -- id_equipe -> equipe_id
    nome_equipe VARCHAR(100), -- Nome_equipe -> nome_equipe
    PRIMARY KEY (processo_seletivo_id, equipe_id) -- Chave primária composta
);

-- Inserindo dados na tabela Processo_Seletivo_Equipe
INSERT INTO Processo_Seletivo_Equipe (processo_seletivo_id, cota_equipe, vagas, equipe_id, nome_equipe)
VALUES
(1, 'LGBTIA+', 25, 1, 'Equipe A'),
(2, 'PNE', 3, 1, 'Equipe B'),
(3, 'PERIFERIA', 25, 2, 'Equipe C'),
(4, 'PCD', 6, 1, 'Equipe D');

-- Inserindo administradores na tabela Administrador
INSERT INTO Administrador (administrador_id, nome, processo_seletivo_id, equipe_id) 
VALUES 
(1, 'Pedro Gomes', 2, 1),  -- Pedro Gomes, responsável pelo processo 2, equipe 1
(2, 'Fernanda Souza', 1, 1); -- Fernanda Souza, responsável pelo processo 1, equipe 1


-- Consultando os dados da tabela Administrador
SELECT * FROM Processo_seletivo_Equipe;

set foreign_key_checks=1;
drop table Candidato_;


