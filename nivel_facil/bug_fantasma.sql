DROP TABLE IF EXISTS relato_cena_crime;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS depoimento;
DROP TABLE IF EXISTS log_acesso;
DROP TABLE IF EXISTS solucao;

CREATE TABLE funcionario (
    id_funcionario INTEGER PRIMARY KEY,
    nome TEXT,
    sobrenome TEXT,
    cargo TEXT,
    departamento TEXT,
    cor_cracha TEXT
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
(1, 'Marcus', 'Vale', 'CTO', 'Diretoria', NULL),
(2, 'Bruno', 'Salles', 'Suporte', 'TI', 'azul'),
(3, 'Rafael', 'Tanaka', 'Redes', 'Infraestrutura', 'verde'),
(4, 'Carla', 'Nunes', 'Design', 'Produto', 'roxo'),
(5, 'Diego', 'Ferraz', 'Infraestrutura', 'Infraestrutura', 'vermelho'),
(6, 'Vinicius', 'Prado', 'Backend', 'Engenharia', 'amarelo'),
(7, 'Juliana', 'Matos', 'Produto', 'Produto', 'laranja');

INSERT INTO relato_cena_crime VALUES
(1, '2026-01-14', 'Sala de Servidores',
 'Marcus Vale foi encontrado sem vida na Sala de Servidores as 22h40. O sistema de crachas registrou a entrada de uma unica pessoa na sala entre 22h00 e 22h40, pouco antes do horario estimado da morte. Consulte o log de acesso da sala naquela janela de horario para descobrir quem entrou.');

INSERT INTO log_acesso VALUES
(1, 2, 'Recepcao', '2026-01-14 18:00'),
(2, 6, 'Estacionamento', '2026-01-14 19:30'),
(3, 5, 'Sala de Servidores', '2026-01-14 22:15'),
(4, 3, 'Corredor 4 andar', '2026-01-14 21:00'),
(5, 7, 'Sala de Reunioes', '2026-01-14 17:45'),
(6, 4, 'Sala de Design', '2026-01-14 20:10');

INSERT INTO depoimento VALUES
(3, 'Eu vi alguem com cracha vermelho entrando na Sala de Servidores por volta das 22h15. Nao lembro o rosto, mas o cracha era bem chamativo.');

INSERT INTO solucao VALUES
(5, 'Correto! Diego Ferraz e o culpado. Ele foi o unico a acessar a Sala de Servidores na janela de horario do crime, e a cor do cracha (vermelho) bate com o depoimento da testemunha.');
