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
    data_acontecido TEXT,
    local_acontecido TEXT,
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
(6, 'Lara', 'Rodrigues', 'Infraestrutura', 'Infraestrutura', 'vermelho'),
(7, 'Vinicius', 'Prado', 'Backend', 'Engenharia', 'amarelo'),
(8, 'Juliana', 'Matos', 'Produto', 'Produto', 'laranja'),
(9, 'Patricia', 'Souza', 'Recursos Humanos', 'RH', 'rosa'),
(10, 'Eduardo', 'Lima', 'Financeiro', 'Financeiro', 'branco'),
(11, 'Camila', 'Rocha', 'Marketing', 'Marketing', 'cinza'),
(12, 'Jéssica', 'Oliveira', 'Backend', 'Engenharia', 'amarelo');

INSERT INTO relato_cena_crime VALUES
(1, '2026-01-14', 'Sala de Servidores',
 'Marcus Vale foi encontrado sem vida na Sala de Servidores as 22h40. O sistema de crachas registrou a entrada de uma única pessoa na sala entre 22h00 e 22h40, pouco antes do horário estimado da morte. Consulte o log de acesso da sala naquela janela de horário para descobrir quem entrou.'),
(2, '2026-01-14', 'Sala de Servidores',
 'A pericia constatou que a porta da Sala de Servidores estava trancada por dentro, sem sinais de arrombamento. Isso indica que o responsável tinha acesso autorizado via cracha, e não entrou a força.'),
(3, '2026-01-14', 'Corredor do 4 andar',
 'Alguns funcionários que trabalhavam até mais tarde relataram ter ouvido um barulho alto vindo da direção da Sala de Servidores por volta das 22h30, mas ninguém foi verificar na hora por acharem que fosse o ar-condicionado.'),
(4, '2026-01-14', 'Recepcao',
 'A recepcionista do turno da noite confirmou que todos os funcionários listados no log de acesso realmente estavam no prédio naquela noite, e que nenhum visitante externo foi registrado apos as 20h.');

INSERT INTO log_acesso VALUES
(1, 2, 'Recepcao', '2026-01-14 18:00'),
(2, 6, 'Estacionamento', '2026-01-14 19:30'),
(3, 5, 'Sala de Servidores', '2026-01-14 22:15'),
(4, 3, 'Corredor 4 andar', '2026-01-14 21:00'),
(5, 7, 'Sala de Reunioes', '2026-01-14 17:45'),
(6, 4, 'Sala de Design', '2026-01-14 20:10'),
(7, 8, 'RH', '2026-01-14 18:30'),
(8, 9, 'Financeiro', '2026-01-14 19:00'),
(9, 10, 'Sala de Marketing', '2026-01-14 20:45'),
(10, 2, 'TI', '2026-01-14 21:20'),
(11, 5, 'Recepcao', '2026-01-14 21:50'),
(12, 6, 'Sala de Reunioes', '2026-01-14 20:00');

INSERT INTO depoimento VALUES
(2, 'Eu fiquei praticamente a noite toda no setor de TI resolvendo um chamado urgente. Só passei perto da Sala de Servidores por volta das 21h20, mas não entrei.'),
(3, 'Eu vi alguém com cracha vermelho entrando na Sala de Servidores por volta das 22h15. Não lembro o rosto, mas o cracha era bem chamativo.'),
(4, 'Eu não tenho certeza do que aconteceu, mas não ficaria surpresa se fosse o Vinicius. Ele e o Marcus brigaram feio numa reunião semana passada por causa de um grande projeto que foi iniciado pelo Vinicius, mas a diretoria decidiu retirar o Vinicius do projeto e passar para o Marcus.'),
(6, 'Eu sei que a Carla anda espalhando que fui eu, mas isso é implicancia pessoal, a gente nunca se deu bem no trabalho. Na noite do crime eu sai as 19h30 e so voltei ao prédio as 20h para pegar uma coisa na Sala de Reunioes, nem cheguei perto da Sala de Servidores.'),
(7, 'Eu sai bem mais cedo naquele dia, por volta das 17h45, para uma reunião com um cliente. Não vi nada de estranho antes de ir embora.'),
(8, 'O clima no escritorio andava tenso mesmo, tinha bastante fofoca e desavencas entre alguns times, mas eu, sinceramente, não vi nem ouvi nada relacionado ao crime naquela noite.'),
(5, 'Eu cheguei mais tarde naquele dia e fiz apenas uma verificação de rotina nos servidores, como faço toda semana. Não vi nada fora do comum.');

/* INSIRA NA TABELA QUEM FOI O ASSASSINO! */
/* INSERT INTO solucao VALUES (id_funcionario, justificativa)*/
INSERT INTO solucao VALUES ();
