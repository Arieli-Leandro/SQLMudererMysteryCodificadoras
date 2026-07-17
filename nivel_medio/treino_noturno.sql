DROP TABLE IF EXISTS relato_cena_crime;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS depoimento;
DROP TABLE IF EXISTS membro_cyber_arena;
DROP TABLE IF EXISTS checkin_cyber_arena;
DROP TABLE IF EXISTS log_acesso;
DROP TABLE IF EXISTS solucao;

CREATE TABLE funcionario (
    id_funcionario INTEGER PRIMARY KEY,
    nome TEXT,
    sobrenome TEXT,
    cargo TEXT,
    numero_predio INTEGER,
    rua TEXT
);

CREATE TABLE relato_cena_crime (
    id_relato INTEGER PRIMARY KEY,
    data TEXT,
    local TEXT,
    descricao TEXT
);

CREATE TABLE depoimento (
    id_funcionario INTEGER PRIMARY KEY,
    transcricao TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE membro_cyber_arena (
    id_membro TEXT PRIMARY KEY,
    id_funcionario INTEGER,
    tipo_plano TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE checkin_cyber_arena (
    id_membro TEXT,
    data_checkin TEXT,
    FOREIGN KEY (id_membro) REFERENCES membro_cyberarena(id_membro)
);

CREATE TABLE log_acesso (
    id_log INTEGER PRIMARY KEY,
    id_funcionario INTEGER,
    sala TEXT,
    data_hora TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE solucao (
    id_funcionario INTEGER,
    mensagem TEXT
);

INSERT INTO funcionario VALUES
(1, 'Marcus', 'Vale', 'CTO', 10, 'Rua da Startup'),
(2, 'Bruno', 'Salles', 'Suporte', 120, 'Rua das Acacias'),
(3, 'Rafael', 'Tanaka', 'Redes', 4231, 'Rua das Acacias'),
(4, 'Carla', 'Nunes', 'Design', 875, 'Rua das Acacias'),
(5, 'Diego', 'Ferraz', 'Infraestrutura', 302, 'Rua Turing'),
(6, 'Vinicius', 'Prado', 'Backend', 88, 'Avenida Byte'),
(7, 'Leandro', 'Aguiar', 'Frontend', 210, 'Avenida Byte'),
(8, 'Otavio', 'Reis', 'DevOps', 45, 'Rua Turing'),
(9, 'Juliana', 'Matos', 'Produto', 340, 'Rua Turing');

INSERT INTO relato_cena_crime VALUES
(1, '2026-01-14', 'Sala de Servidores',
 'Marcus Vale foi encontrado sem vida na Sala de Servidores as 22h40. Uma testemunha foi entrevistada: mora no numero mais alto da Rua das Acacias.');

INSERT INTO depoimento VALUES
(3, 'Eu vi o assassino saindo as pressas. Reconheci o moletom do clube de e-sports Cyber Arena. Sei que ele e membro do plano dourado, e que treinou no clube no dia 09/01/2026.');

INSERT INTO membro_cyber_arena VALUES
('48Z7A', 5, 'dourado'),
('10X3B', 6, 'padrao'),
('48Z2C', 7, 'padrao'),
('99Y48Z', 8, 'dourado'),
('77A11B', 9, 'dourado');

INSERT INTO checkin_cyber_arena VALUES
('48Z7A', '2026-01-09'),
('48Z7A', '2026-01-03'),
('99Y48Z', '2026-01-02'),
('99Y48Z', '2026-01-15'),
('10X3B', '2026-01-09');

INSERT INTO log_acesso VALUES
(1, 5, 'Sala de Servidores', '2026-01-14 22:15'),
(2, 5, 'Sala de Servidores', '2026-01-14 22:50'),
(3, 2, 'Recepcao', '2026-01-14 18:00'),
(4, 1, 'Sala de Servidores', '2026-01-14 21:50');

INSERT INTO solucao VALUES
(5, 'Correto! Diego Ferraz é o assassino. Ele é membro dourado da Cyber Arena, com carteirinha contendo 48Z, e treinou no clube no dia 09/01/2026, mesma data mencionada no depoimento.');
