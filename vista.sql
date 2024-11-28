CREATE DATABASE alendavista;
DROP DATABASE alendavista;
USE alendavista;

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
    fk_Processo_seletivo_Equipe_id_equipe INT,
    CONSTRAINT FK_Administrador_2 FOREIGN KEY (fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe)
    REFERENCES Processo_seletivo_Equipe (id_processo, id_equipe)
    ON DELETE RESTRICT
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
    fk_Processo_seletivo_Equipe_id_processo INT,
    fk_Processo_seletivo_Equipe_id_equipe INT,
    PRIMARY KEY (fk_Candidato__id_candidato, fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe),
    CONSTRAINT FK_Concorre_1 FOREIGN KEY (fk_Candidato__id_candidato)
    REFERENCES Candidato_ (id_candidato)
    ON DELETE RESTRICT,
    CONSTRAINT FK_Concorre_2 FOREIGN KEY (fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe)
    REFERENCES Processo_seletivo_Equipe (id_processo, id_equipe)
    ON DELETE RESTRICT
);

-- Inserindo dados na tabela Candidato_
INSERT INTO Candidato_ (id_candidato, Nome, CPF, data_nascimento_, cota, Email, Endereco, telefone) 
VALUES 
(1, 'João Silva', '12345678901', '1990-05-15', 'LGBTQIA+', 'joao.silva@email.com', 'Rua A, 123, Bairro X', '11987654321'),
(2, 'Maria Oliveira', '98765432109', '1995-08-25', 'PNI', 'maria.oliveira@email.com', 'Rua B, 456, Bairro Y', '11976543210'),
(3, 'Carlos Pereira', '19283746501', '1987-02-10', 'PERIFERIA', 'carlos.pereira@email.com', 'Rua C, 789, Bairro Z', '11987654322'),
(4, 'Ana Costa', '11223344556', '1992-11-05', 'PCD', 'ana.costa@email.com', 'Rua D, 101, Bairro W', '11965432100'),
(5, 'Lucas Souza', '22334455667', '1985-03-30', 'LGBTQIA+', 'lucas.souza@email.com', 'Rua E, 202, Bairro V', '11965432101'),
(6, 'Fernanda Lima', '33445566778', '1993-07-20', 'PNI', 'fernanda.lima@email.com', 'Rua F, 303, Bairro U', '11965432102'),
(7, 'Roberto Santos', '44556677889', '1980-12-15', 'PERIFERIA', 'roberto.santos@email.com', 'Rua G, 404, Bairro T', '11965432103'),
(8, 'Patrícia Alves', '55667788990', '1997-09-10', 'PCD', 'patricia.alves@email.com', 'Rua H, 505, Bairro S', '11965432104'),
(9, 'Eduardo Martins', '66778899001', '1990-01-25', 'LGBTQIA+', 'eduardo.martins@email.com', 'Rua I, 606, Bairro R', '11965432105'),
(10, 'Juliana Rocha', '77889900112', '1994-04-12', 'PNI', 'juliana.rocha@email.com', 'Rua J, 707, Bairro Q', '11965432106'),
(11, 'Tiago Ferreira', '88990011223', '1988-02-18', 'PERIFERIA', 'tiago.ferreira@email.com', 'Rua K, 808, Bairro P', '11965432107'),
(12, 'Camila Silva', '99001122334', '1996-10-30', 'PCD', 'camila.silva@email.com', 'Rua L, 909, Bairro O', '11965432108'),
(13, 'Rafael Oliveira', '10122334445', '1982-05-05', 'LGBTQIA+', 'rafael.oliveira@email.com', 'Rua M, 110, Bairro N', '11965432109');

-- Inserindo dados na tabela Processo_seletivo_Equipe
INSERT INTO Processo_seletivo_Equipe (id_processo, Cota_, Vagas, id_equipe, Nome_equipe)
VALUES
(1, 'LGBTIA+', 25, 1, 'Equipe A'),
(2, 'PNE', 3, 1, 'Equipe B'),
(3, 'PERIFERIA', 25, 2, 'Equipe C'),
(4, 'PCD', 6, 1, 'Equipe D');

-- Inserindo administradores na tabela Administrador
INSERT INTO Administrador (id_Administrador_, Nome, fk_Processo_seletivo_Equipe_id_processo, fk_Processo_seletivo_Equipe_id_equipe) 
VALUES 
(1, 'Pedro Gomes', 2, 1),  -- Pedro Gomes, responsável pelo processo 2, equipe 1
(2, 'Fernanda Souza', 1, 1); -- Fernanda Souza, responsável pelo processo 1, equipe 1

-- Consultando os dados da tabela Administrador
SELECT * FROM Processo_seletivo_Equipe;

