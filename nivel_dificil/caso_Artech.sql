DROP TABLE IF EXISTS relato_cena_crime;
DROP TABLE IF EXISTS perfil_funcionario;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS depoimento;
DROP TABLE IF EXISTS membro_cyber_arena;
DROP TABLE IF EXISTS checkin_cyber_arena;
DROP TABLE IF EXISTS log_acesso;
DROP TABLE IF EXISTS mensagem_interna;
DROP TABLE IF EXISTS salario;
DROP TABLE IF EXISTS solucao;

CREATE TABLE perfil_funcionario (
    id_perfil INTEGER PRIMARY KEY,
    idade INTEGER,
    altura INTEGER,
    genero TEXT,
    olho_cor TEXT,
    cabelo_cor TEXT,
    usa_oculos TEXT,
    linguagem_preferida TEXT,
    cracha_numero TEXT
);

CREATE TABLE funcionario (
    id_funcionario INTEGER PRIMARY KEY,
    nome TEXT,
    sobrenome TEXT,
    cargo TEXT,
    numero_predio INTEGER,
    rua TEXT,
    matricula TEXT,
    id_perfil INTEGER,
    FOREIGN KEY (id_perfil) REFERENCES perfil_funcionario(id_perfil)
);

CREATE TABLE relato_cena_crime (
    id_relato INTEGER PRIMARY KEY,
    data TEXT,
    tipo TEXT,
    cidade TEXT,
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
    nome_clube TEXT,
    data_adesao TEXT,
    tipo_plano TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE checkin_cyber_arena (
    id_membro TEXT,
    data_checkin TEXT,
    hora_entrada TEXT,
    hora_saida TEXT,
    FOREIGN KEY (id_membro) REFERENCES membro_cyberarena(id_membro)
);

CREATE TABLE log_acesso (
    id_log INTEGER PRIMARY KEY,
    id_funcionario INTEGER,
    porta TEXT,
    data_hora TEXT,
    tipo_acesso TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE mensagem_interna (
    id_mensagem INTEGER PRIMARY KEY,
    remetente_id INTEGER,
    destinatario_id INTEGER,
    data_hora TEXT,
    conteudo TEXT,
    FOREIGN KEY (remetente_id) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (destinatario_id) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE salario (
    id_funcionario INTEGER PRIMARY KEY,
    salario_anual INTEGER,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE solucao (
    id_funcionario INTEGER,
    mensagem TEXT
);

INSERT INTO relato_cena_crime VALUES
(1, '2026-01-14', 'assassinato', 'Sao Paulo',
 'Marcus Vale, CTO da TechCorp, foi encontrado sem vida na Sala de Servidores por volta das 22h40, na vespera do lancamento do sistema Artech. As cameras do corredor foram desligadas minutos antes. Duas pessoas foram entrevistadas como testemunhas: a primeira mora no numero mais alto da Rua das Acacias; a segunda se chama Annelise e mora em algum lugar na Rua dos Engenheiros.');

INSERT INTO perfil_funcionario VALUES
(1, 41, 175, 'M', 'castanho', 'grisalho', 'Sim', 'Java', 'TC-1001'),
(2, 33, 168, 'M', 'preto', 'preto', 'Nao', 'Python', 'TC-1022'),
(3, 27, 172, 'F', 'castanho', 'castanho', 'Sim', 'JavaScript', 'TC-1044'),
(4, 30, 160, 'F', 'verde', 'ruivo', 'Nao', 'Python', 'TC-1055'),
(5, 29, 181, 'M', 'castanho', 'preto', 'Nao', 'Rust', 'TC-4821'),
(6, 36, 178, 'M', 'azul', 'loiro', 'Sim', 'Go', 'TC-2290'),
(7, 45, 174, 'M', 'castanho', 'preto', 'Nao', 'C++', 'TC-3311'),
(8, 31, 183, 'M', 'verde', 'castanho', 'Nao', 'Go', 'TC-5567'),
(9, 26, 165, 'F', 'castanho', 'preto', 'Sim', 'Python', 'TC-6678'),
(10, 48, 170, 'F', 'preto', 'preto', 'Nao', 'SQL', 'TC-0001');

INSERT INTO funcionario VALUES
(100, 'Marcus', 'Vale', 'CTO', 10, 'Rua da Startup', 'MAT-0100', 1),
(101, 'Bruno', 'Salles', 'Analista de Suporte', 120, 'Rua das Acacias', 'MAT-0101', 2),
(102, 'Rafael', 'Tanaka', 'Engenheiro de Redes', 4231, 'Rua das Acacias', 'MAT-0102', 6),
(103, 'Carla', 'Nunes', 'Designer', 875, 'Rua das Acacias', 'MAT-0103', 3),
(104, 'Annelise', 'Duarte', 'Engenheira de Dados', 55, 'Rua dos Engenheiros', 'MAT-0104', 4),
(105, 'Diego', 'Ferraz', 'Engenheiro de Infraestrutura', 302, 'Rua Turing', 'MAT-0105', 5),
(106, 'Vinicius', 'Prado', 'Dev Backend', 88, 'Avenida Byte', 'MAT-0106', 7),
(107, 'Leandro', 'Aguiar', 'Dev Frontend', 210, 'Avenida Byte', 'MAT-0107', 8),
(108, 'Otavio', 'Reis', 'DevOps', 45, 'Rua Turing', 'MAT-0108', 9),
(109, 'Juliana', 'Matos', 'Product Manager', 340, 'Rua Turing', 'MAT-0109', 3),
(110, 'Helena', 'Cardoso', 'CEO', 1, 'Rua da Startup', 'MAT-0110', 10);

INSERT INTO depoimento VALUES
(102, 'Eu estava no corredor perto da Sala de Servidores por volta das 22h40 quando ouvi um barulho alto. Vi um vulto saindo as pressas pela porta de emergencia, usando um moletom com o logo do clube de e-sports Cyber Arena, mas nao consegui ver o rosto com clareza.'),
(104, 'Eu reconheco o assassino do meu clube de e-sports, a Cyber Arena. Treinamos juntos no dia 09/01/2026. Sei que ele tem o plano de membro dourado, e o numero da carteirinha dele contem a sequencia 48Z.');

INSERT INTO membro_cyber_arena VALUES
('48Z7A', 105, 'Cyber Arena', '2024-03-01', 'dourado'),
('10X3B', 106, 'Cyber Arena', '2023-11-11', 'padrao'),
('48Z2C', 107, 'Cyber Arena', '2022-05-20', 'padrao'),
('99Y48Z', 108, 'Cyber Arena', '2024-01-15', 'dourado'),
('77A11B', 109, 'Cyber Arena', '2021-07-07', 'dourado'),
('AN551X', 104, 'Cyber Arena', '2023-02-02', 'padrao');

INSERT INTO checkin_cyber_arena VALUES
('48Z7A', '2026-01-09', '18:00', '19:30'),
('48Z7A', '2026-01-03', '10:00', '11:00'),
('99Y48Z', '2026-01-02', '09:00', '10:00'),
('99Y48Z', '2026-01-15', '08:00', '09:00'),
('10X3B', '2026-01-09', '12:00', '13:00'),
('AN551X', '2026-01-09', '18:05', '19:20');

INSERT INTO log_acesso VALUES
(1, 105, 'Sala de Servidores', '2026-01-14 22:15', 'entrada'),
(2, 105, 'Sala de Servidores', '2026-01-14 22:50', 'saida'),
(3, 101, 'Recepcao', '2026-01-14 18:00', 'saida'),
(4, 106, 'Estacionamento', '2026-01-14 19:30', 'saida'),
(5, 100, 'Sala de Servidores', '2026-01-14 21:50', 'entrada'),
(6, 102, 'Corredor 4 andar', '2026-01-14 22:40', 'entrada');

INSERT INTO mensagem_interna VALUES
(1, 110, 105, '2026-01-10 23:10', 'O lancamento do Artech nao pode acontecer enquanto Marcus insistir em revelar as falhas de seguranca ao conselho. Resolva isso antes de sexta. O pagamento cai na conta de sempre.'),
(2, 105, 110, '2026-01-11 07:40', 'Entendido. Vou usar meu acesso a sala de servidores no fim do expediente, sera tratado como acidente.'),
(3, 101, 103, '2026-01-12 09:00', 'Voce viu o novo layout da tela de login do Artech?'),
(4, 106, 107, '2026-01-13 15:20', 'Bora almocar depois do deploy?');

INSERT INTO salario VALUES
(105, 210000),
(106, 190000),
(107, 185000),
(108, 205000),
(109, 240000),
(110, 980000);

INSERT INTO solucao VALUES
(105, 'Correto! Diego Ferraz e o assassino. Mas a investigacao nao termina aqui: consulte a tabela mensagem_interna para descobrir quem mandou matar Marcus Vale.');
