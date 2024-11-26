create DATABASE alendavista;
DROP DATABASE alendavista;
use alendavista;

/* Lógico_1: */

CREATE TABLE Candidato_ (
    id_candidato INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11),
    data_nascimento_ DATE,
    cota VARCHAR(20),
    Email VARCHAR(100),
    Endereco VARCHAR(150),
    telefone CHAR(11)
);

CREATE TABLE Administrador (
    id_Administrador_ INT PRIMARY KEY,
    Nome VARCHAR(100),
    fk_Processo_seletivo_Equipe_id_processo INT,
    fk_Processo_seletivo_Equipe_id_equipe INT
);

CREATE TABLE Processo_seletivo_Equipe (
    id_processo INT,
    Cota_ VARCHAR(20),
    Vagas INT,
    id_equipe INT,
    Nome_equipe VARCHAR(100),
    PRIMARY KEY (id_processo, id_equipe)
);

CREATE TABLE Concorre (
    fk_Candidato__id_candidato INT,
    fk_Processo_seletivo_Equipe_id_processo INT
);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe)
    REFERENCES Processo_seletivo_Equipe (id_processo, id_equipe)
    ON DELETE RESTRICT;
 
ALTER TABLE Concorre ADD CONSTRAINT FK_Concorre_1
    FOREIGN KEY (fk_Candidato__id_candidato)
    REFERENCES Candidato_ (id_candidato)
    ON DELETE RESTRICT;
 
ALTER TABLE Concorre ADD CONSTRAINT FK_Concorre_2
    FOREIGN KEY (fk_Processo_seletivo_Equipe_id_processo)
    REFERENCES Processo_seletivo_Equipe (id_processo)
    ON DELETE RESTRICT;
    
    INSERT INTO Candidato_ (id_candidato, Nome, CPF, data_nascimento_, cota, Email, Endereco, telefone) 
VALUES 
(1, 'João Silva', '12345678901', '1990-05-15', 'Ampla', 'joao.silva@email.com', 'Rua A, 123, Bairro X', '11987654321'),
(2, 'Maria Oliveira', '98765432109', '1995-08-25', 'PNE', 'maria.oliveira@email.com', 'Rua B, 456, Bairro Y', '11976543210'),
(3, 'Carlos Pereira', '19283746501', '1987-02-10', 'Ampla', 'carlos.pereira@email.com', 'Rua C, 789, Bairro Z', '11987654322');

-- Inserindo dados na tabela Processo_seletivo_Equipe
INSERT INTO Processo_seletivo_Equipe (id_processo, Cota_, Vagas, id_equipe, Nome_equipe)
VALUES
(1, 'Ampla', 5, 1, 'Equipe A'),
(2, 'PNE', 3, 1, 'Equipe B'),
(3, 'Ampla', 4, 2, 'Equipe C'),
(4, 'L1', 6, 2, 'Equipe D'),
(5, 'Ampla', 2, 3, 'Equipe E');

-- Inserindo administradores na tabela Administrador
INSERT INTO Administrador (id_Administrador_, Nome, fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe) 
VALUES 
(1, 'Pedro Gomes', 1, 1),  -- Pedro Gomes, responsável pelo processo 1, equipe 1
(2, 'Fernanda Souza', 2, 1); -- Fernanda Souza, responsável pelo processo 2, equipe 1
SELECT * FROM Processo_seletivo_Equipe;
