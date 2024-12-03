-- Criação do MER--

-ENTIDADES:

carreiras, simulados, dicas, autores, entrevistas,
notícias, criadores.

-ATRIBUTOS:

Carreiras:
id_carreira (PK)
Título 
Descrição 
Data_Publicacao 

simulados:
id_simulado (PK)
titulo
duracao
nivel
link_questoes

dicas:
id_Dica (PK)      
Título
Resumo
url
id_autor (FK)

autores:
id_autor (PK)
Nome

entrevistas:
id_Entrada (PK)
Título
Resumo
Data_Publicacao
ID_Autor (FK)
url

noticias:
id_noticia (PK)
titulo
conteudo
data_publicacao
id_autor (FK)
url

criadores:
id_criador (PK)
nome
papel_grupo
habilidades
email
url

-Relacionamentos:
-- AUTORES - NOTÍCIAS
Um autor pode produzir várias notícias: (1, N)
Cada notícia é escrita por um único autor: (1, 1)

-- AUTORES - ENTREVISTAS
Um autor conduz várias entrevistas: (1, N)
Cada entrevista é conduzida por um único autor: (1, 1)

-- AUTORES - DICAS
Um autor pode criar várias dicas: (1, N)
Cada dica é criada por um vários autores: (1, N)

-- FUNÇÕES SCRUM - CRIADORES
 Um criador poder ter no minimo 1 e no maximo 1 função: (1, 1)
 Uma função tem no minimo 1 e no maximo N criador: (1, N);



-- Querys para criação das tabelas

CREATE DATABASE site_historia;
\c site_historia;

CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT
);

INSERT INTO carreiras (titulo, descricao) VALUES
('Pesquisa Acadêmica', 'Pesquisadores acadêmicos dedicam-se ao estudo aprofundado em áreas específicas, produzindo artigos, trabalhos e avaliações e análises científicas.'),
('Arqueologia', 'A arqueologia envolve o estudo de civilizações antigas através da excavação e análise de artefatos.'),
('Jornalismo e Comunicação', 'Jornalistas e comunicadores trabalham na coleta, redação e transmissão de notícias e informações.'),
('Consultoria Histórica', 'Consultores históricos ajudam a fornecer contextos e a aconselhamento em projetos que prezam a pesquisa histórica.'),
('Gestão de Patrimônio', 'Gestores de patrimônio cultural se responsabilizam por preservar, gerenciar e promover o patrimônio histórico e cultural.');

CREATE TABLE simulado (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    nivel INT NOT NULL,
    link_questoes TEXT NOT NULL,
    duracao TIME NOT NULL
);

INSERT INTO simulado (titulo, nivel, link_questoes, duracao) VALUES
('Simulado Nível 1', 1, 'https://www.jotform.com/form/243036863744057', '02:00:00'),
('Simulado Nível 2', 2, 'https://www.jotform.com/form/243037604836053', '03:00:00'),
('Simulado Nível 3', 3, 'https://www.jotform.com/form/243036925762056', '04:00:00'),
('Simulado Nível 4', 4, 'https://www.jotform.com/form/243037164246049', '05:00:00'),
('Simulado Nível 5', 5, 'https://www.jotform.com/form/243036947508058', '06:00:00'),
('Teste suas Capacidades', 0, 'https://cursoenemgratuito.com.br/simulado-geral-de-historia-para-o-enem/', '07:00:00');

SELECT titulo, duracao 
FROM simulado
WHERE duracao > '03:00:00';



 CREATE TABLE FuncoesScrum (
    id_funcao SERIAL PRIMARY KEY,
    funcao VARCHAR (200) UNIQUE NOT NULL
 );

INSERT INTO FuncoesScrum (funcao) VALUES 
('Product Owner'), 
('Scrum Master'),
('Membro Desenvolvedor');

SELECT * FROM FuncoesScrum;

 CREATE TABLE Criadores (
    id_criador SERIAL PRIMARY KEY,
    id_funcao INT NOT NULL,
    nome VARCHAR (200) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    fotoUrl VARCHAR(500) UNIQUE,
    CONSTRAINT fk_funcao
        FOREIGN KEY (id_funcao)
        REFERENCES FuncoesScrum (id_funcao)
 );

INSERT INTO Criadores (id_funcao , nome , idade, email, fotoUrl ) VALUES 
('1', 'Vinicius Rocha' , 17 , 'vinicius.a.rocha8@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Rocha.png'),
('2', 'Alexandra Aversani' , 17 , 'alexandra.aversani@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Alexandra.png'),
('3', 'Gabriela Barbosa' , 17 , 'gabriela.f.barbosa@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Gabi.png'),
('3', 'Julia Martins' , 16 , 'Julia.martins7@aluno.senai.br', 'https://site-historia-six.vercel.app/image/juls.jfif'),
('3', 'Matheus Marcelino' , 17 , 'mateus.marcelino@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/marcelino.png'),
('3', 'Nathalia Santos' , 17 , 'nathalia.ferreira7629@gmail.com', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Nathalia.png');



SELECT c.nome AS criador, f.funcao , c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Product Owner';


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Scrum Master';


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Membro Desenvolvedor';


SELECT c.nome AS criador, f.funcao
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.idade DESC;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.nome ASC;

-- Seleciona o criador mais velho
SELECT c.nome, f.funcao, c.idade
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE c.idade >= 17;



CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO autores (nome) VALUES 
('Agda Aparecida Serpentini'),
('Alexandre Costa'),
('Débora Aladim'),
('Amanda de Souza'),
('Sara de Souza Costa');

SELECT * FROM autores;

INSERT INTO autores (nome)
VALUES ('Novo Autor');


CREATE TABLE dicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT,
    url  VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO dicas (titulo, conteudo, url, id_autor) VALUES
('Quais conteúdos devo estudar?', 'História Antiga, História Medieval,História Moderna, História Contemporânea', 'http://127.0.0.1:5505/image/dicas/imgdicasUM.png', 3),
('Plano de estudos', 'cronograma de estudos', 'http://127.0.0.1:5505/image/dicas2/imagem%20dicas%2002.png', 4),
('Quais são os métodos de estudos?', 'Mapa mental, Resumos, Técnica Pomodoro, A auto explicação e a auto interrogação, Mnemônica, Jogos, Anotações Cornell', 'http://127.0.0.1:5505/image/dicas03/banner.png', 1),
('O que não levar para o Enem?', 'Aparelhos Eletrônicos, Livros e Anotações, Bonés, Chapéus e Óculos Escuros, Relógios Inteligentes', 'http://127.0.0.1:5505/image/dicas04/banner.png', 5),
('Planilha de estudos', 'organização dos dias da semana para estudar', 'http://127.0.0.1:5505/image/dicas05/planilha%20de%20estudos.jpg', 2),
('Planilha de estudos-Humanas', 'Cronograma Completo, Conteúdos mais cobrados, divisão dos conteudos,importância de estudar', 'http://127.0.0.1:5505/image/dicas6/pngtree-principal-office-and-teachers-png-image_11672526-removebg-preview.png', 1);

SELECT * FROM dicas;
SELECT titulo, url 
FROM dicas;


-- INNER JOIN (para obter uma lista de dicas que esteja relacionada a seus autores)
SELECT d.titulo, d.conteudo, d.url, a.nome
FROM dicas d
JOIN autores a ON d.id_autor = a.id_autor;


CREATE TABLE noticias (
    id_noticia SERIAL PRIMARY KEY,
    titulo VARCHAR(100) UNIQUE NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATE NOT NULL,
    id_autor INT NOT NULL
);

INSERT INTO noticias (titulo, conteudo, data_publicacao, id_autor) VALUES
('ENEM 2024: O que Esperar das Provas e Como se Preparar com Eficácia', 'O Exame Nacional do Ensino Médio (ENEM) de 2024 promete ser um desafio importante para os estudantes, com mudanças que podem afetar tanto a estrutura das provas quanto a forma de avaliação. Neste ano, espera-se que o exame continue a focar no desenvolvimento de habilidades de leitura e interpretação, além de abordar questões interdisciplinares que exigem uma compreensão aprofundada dos temas. Para se sair bem, é fundamental que os candidatos fiquem atentos às atualizações sobre os conteúdos cobrados e ajustem seus estudos de acordo com as novas exigências. O domínio de temas atuais, como os desafios globais e as questões socioambientais, também deve ser um diferencial importante na prova.
Uma boa preparação para o ENEM 2024 envolve mais do que apenas revisar conteúdos acadêmicos. Estratégias como a resolução de provas anteriores, a prática constante de redação e o estudo de técnicas de gestão de tempo são essenciais para garantir um bom desempenho. Além disso, a organização dos horários de estudo e a adoção de uma rotina equilibrada, com momentos para descanso e lazer, são fundamentais para manter o foco durante a maratona de preparação. Com disciplina e planejamento, é possível alcançar os resultados desejados e conquistar uma vaga na universidade dos sonhos.', '2024-12-03', 1),
('História no Vestibular: Dicas de Como Estudar os Principais Temas', 'A disciplina de História é uma das mais recorrentes nos vestibulares de todo o Brasil, sendo essencial para os candidatos que buscam garantir uma boa pontuação. Para estudar de maneira eficiente, é importante focar nos principais períodos históricos que costumam ser cobrados nas provas, como a História do Brasil, a Idade Média, a Revolução Industrial e as Guerras Mundiais. Além disso, temas como a escravidão no Brasil, o período colonial, as ditaduras do século XX e a Era Vargas são frequentemente abordados. O estudo dos processos históricos, das transformações sociais e das consequências de certos eventos também é crucial, pois essas questões exigem mais do que memorização: é necessário compreender as inter-relações entre os diferentes acontecimentos.
Uma boa estratégia para se preparar para as provas de História no vestibular é a utilização de mapas mentais e resumos que ajudem a sintetizar os principais pontos de cada período estudado. Outra dica importante é acompanhar as atualidades, pois muitos vestibulares fazem conexões entre eventos históricos e questões contemporâneas, testando a capacidade do aluno de perceber como o passado influencia o presente. Resolver provas de vestibulares anteriores também é uma excelente maneira de treinar para os tipos de questões que podem ser cobradas, além de auxiliar na gestão do tempo durante a prova. Com essas estratégias, é possível dominar a disciplina e alcançar um bom desempenho.', '2024-12-03', 2),
('Estratégias para Conquistar uma Boa Nota no ENEM: Planeje sua Preparação!', 'Conquistar uma boa nota no ENEM exige mais do que apenas estudar intensivamente nas semanas que antecedem o exame. A chave para o sucesso está no planejamento e na constância ao longo do ano. Comece estabelecendo um cronograma de estudos realista, que contemple todas as áreas do conhecimento e também momentos para revisar conteúdos. Além disso, reserve tempo para se familiarizar com o estilo de questões do ENEM, especialmente nas provas de Linguagens, Ciências Humanas, Ciências da Natureza e Matemática. A prática constante de redação também é essencial, uma vez que essa é uma das partes mais desafiadoras do exame e exige uma boa capacidade de argumentação e domínio de temas atuais.
Além do estudo, é importante adotar uma abordagem equilibrada e saudável durante a preparação para o ENEM. Manter uma rotina de sono adequada, praticar atividades físicas e garantir momentos de lazer são essenciais para o bem-estar mental e físico, o que contribui para um melhor desempenho nos estudos e nas provas. Outra estratégia importante é resolver provas anteriores para entender os padrões das questões e melhorar a gestão do tempo durante o exame. Com dedicação e disciplina, qualquer candidato pode aumentar suas chances de alcançar a nota desejada e garantir uma vaga na universidade de sua escolha.', '2024-12-03', 3),
('Vestibular e ENEM: Qual a Diferença e Como Escolher o Melhor Caminho?', 'Muitos estudantes ficam em dúvida entre fazer o vestibular ou o ENEM, pois ambos são caminhos válidos para ingressar no ensino superior, mas com características distintas. O ENEM, por ser um exame nacional, oferece a vantagem de ser aceito em diversas universidades públicas e privadas por meio do Sistema de Seleção Unificada (SISU), além de ser utilizado para programas como o ProUni e o FIES. Já o vestibular, apesar de ser mais específico para cada instituição, pode oferecer provas personalizadas, com conteúdos e formatos de questões que variam de acordo com o foco da universidade. Portanto, a escolha entre o ENEM e o vestibular depende dos objetivos do estudante e do perfil das universidades que ele deseja acessar.
A decisão de qual caminho seguir pode ser influenciada por vários fatores, como o estilo de prova e os requisitos das instituições de ensino. Para aqueles que buscam mais flexibilidade e a possibilidade de tentar várias opções com um único exame, o ENEM pode ser a melhor escolha. Por outro lado, quem tem um objetivo claro de ingressar em uma universidade específica que adota seu próprio vestibular pode optar por esse exame, especialmente se ele oferece uma avaliação mais aprofundada nos temas de interesse. O ideal é que o estudante pesquise sobre as modalidades de ingresso nas instituições que deseja e se prepare de acordo com o tipo de exame escolhido, garantindo que seu esforço seja focado e direcionado.', '2024-12-03', 4),
('A Evolução do Ensino no Brasil: Uma Viagem pela História do Vestibular', 'A história do vestibular no Brasil é marcada por mudanças significativas que refletem a evolução do sistema educacional no país. O vestibular, como forma de seleção para o ensino superior, surgiu no Brasil no final do século XIX, com o objetivo de substituir os antigos exames de admissão realizados pelas universidades. No início, o processo seletivo era restrito e voltado para uma elite, mas ao longo dos anos, com o crescimento da população estudantil e as demandas por maior democratização do ensino, o vestibular passou a ser uma ferramenta mais acessível, com a inclusão de mais questões e maior diversidade de instituições. Além disso, com a implementação do ENEM, surgiram novas formas de acesso ao ensino superior, trazendo ainda mais diversidade às opções de ingresso.
Ao longo das décadas, o vestibular se adaptou às mudanças sociais e políticas do país. Na década de 1990, por exemplo, a criação do Sistema de Seleção Unificada (SISU) e o fortalecimento do ENEM alteraram profundamente a dinâmica dos processos seletivos, permitindo que estudantes de todo o Brasil pudessem concorrer a vagas em universidades federais de forma mais democrática. A introdução de novas tecnologias também transformou o ensino preparatório para o vestibular, com cursos online, simulados e materiais didáticos mais acessíveis. Essa evolução continua a impactar a forma como o ensino superior é acessado no Brasil, mostrando como o vestibular se tornou uma peça fundamental na história educacional do país.', '2024-12-03', 5),
('Como a História do Brasil Cai no ENEM: Principais Temas e Questões', 'A História do Brasil é uma das matérias mais cobradas no ENEM, e os candidatos devem estar preparados para lidar com temas que abrangem desde o período colonial até a história contemporânea. Entre os tópicos mais recorrentes estão a colonização, a escravidão, as independências, as repúblicas, os governos militares e a redemocratização. O exame costuma abordar essas temáticas de forma interligada, buscando que o estudante consiga entender as transformações sociais, econômicas e políticas que marcaram o país ao longo dos séculos. Além disso, questões sobre a influência das questões indígenas, africanas e a construção da identidade nacional também são frequentemente cobradas, exigindo que o aluno desenvolva uma visão crítica e analítica do processo histórico brasileiro.
É importante que os candidatos estudem não apenas os acontecimentos, mas também as consequências dessas transformações para a sociedade brasileira. O ENEM busca avaliar a capacidade do estudante de compreender os impactos dos eventos históricos na vida cotidiana das pessoas, por isso, temas como as lutas sociais, os movimentos populares e as mudanças nas estruturas de poder devem ser aprofundados. Uma dica crucial para a preparação é praticar a interpretação de textos históricos, que muitas vezes são apresentados no formato de fontes primárias ou documentos de época, pois isso ajuda o aluno a desenvolver a habilidade de analisar e contextualizar os eventos dentro do cenário atual. Com esse enfoque, o estudante estará mais preparado para enfrentar as questões de História do Brasil no ENEM com confiança e clareza.', '2024-12-03', 6),
('7 Erros Comuns nas Provas de História do Vestibular (e Como Evitá-los)', 'Os erros mais comuns nas provas de História do vestibular podem comprometer significativamente o desempenho dos candidatos. Um dos principais equívocos é a falta de atenção ao enunciado da questão, o que pode levar a respostas que não se alinham com o que está sendo solicitado. Muitos estudantes, por exemplo, confundem datas, contextos históricos ou ainda relacionam acontecimentos que não se correspondem, o que prejudica a argumentação nas questões dissertativas. Outro erro frequente é a interpretação superficial das perguntas, o que pode resultar em respostas vagas ou incompletas, especialmente quando se trata de temas que exigem análise crítica e reflexão sobre as consequências dos eventos históricos.
Para evitar esses erros, a primeira recomendação é ler as questões com calma e fazer uma análise cuidadosa de todos os detalhes do enunciado. Além disso, os candidatos devem dedicar tempo para revisar as principais datas, fatos e personagens da história, sem cair na armadilha da memorização pura, priorizando a compreensão das relações entre os eventos. Outra dica é praticar a resolução de provas anteriores, o que ajuda a entender o estilo das questões e o nível de profundidade exigido em cada uma. Com um estudo focado na interpretação e no domínio do conteúdo, os candidatos estarão mais preparados para evitar esses erros e garantir uma boa performance nas provas de História do vestibular.', '2024-12-03', 7),
('O Impacto da Redação no ENEM: Dicas para Garantir uma Boa Nota', 'A redação do ENEM tem um peso significativo na nota final do exame, sendo responsável por uma parte considerável da pontuação total. Por isso, saber como abordá-la corretamente é crucial para os candidatos. A proposta de redação do ENEM sempre exige uma dissertação argumentativa, na qual o estudante precisa apresentar uma tese sobre um tema atual e defendê-la com base em argumentos sólidos, utilizando conhecimentos de diversas áreas. Além disso, o domínio da norma culta da língua portuguesa e a capacidade de articular ideias de forma clara e coesa são fundamentais para uma boa pontuação. Muitas vezes, os alunos pecam por não desenvolverem suficientemente a argumentação ou por falharem em apresentar uma conclusão bem estruturada, pontos que são avaliados com rigor pelos corretores.
Para garantir uma boa nota na redação, a primeira dica é praticar frequentemente a escrita sobre temas propostos, buscando desenvolver uma argumentação consistente e estruturada. Além disso, é importante se atualizar sobre os principais problemas sociais, políticos e culturais que envolvem o Brasil e o mundo, pois esses tópicos são frequentemente abordados no exame. Outro ponto crucial é a revisão: antes de entregar a redação, o candidato deve revisá-la para corrigir erros gramaticais e de digitação, além de verificar se a estrutura do texto está clara e lógica. Com o devido treinamento e preparação, é possível melhorar a redação e alcançar uma pontuação expressiva no ENEM.', '2024-12-03', 8),
('Vestibular e ENEM 2024: As Novidades que Você Precisa Saber', 'O ano de 2024 traz algumas mudanças importantes tanto no vestibular quanto no ENEM, que devem impactar a forma como os estudantes se preparam para os exames. No ENEM, por exemplo, espera-se uma maior ênfase em temas de atualidades, com questões que exigem uma análise crítica e uma conexão mais profunda com os desafios contemporâneos, como questões ambientais, sociais e políticas. Além disso, a prova de redação também pode ser mais exigente, cobrando argumentações mais detalhadas e com um foco em soluções práticas para problemas globais. Para o vestibular, algumas universidades têm adotado novas abordagens, como a inclusão de mais questões interdisciplinares, o que exige que os candidatos estejam preparados para integrar diferentes áreas do conhecimento.
Essas mudanças reforçam a necessidade de um planejamento de estudos mais estratégico e flexível. Para se preparar para o ENEM e os vestibulares de 2024, os estudantes devem focar não apenas em memorizar conteúdos, mas também em desenvolver habilidades de interpretação e análise crítica. Manter-se atualizado com as principais questões que afetam a sociedade brasileira e mundial pode ser um diferencial importante. Resolver provas anteriores e simulados também é uma excelente forma de treinar para essas novas demandas, além de garantir um bom controle de tempo e familiaridade com os tipos de questões que serão cobradas. Com foco e adaptação às novas exigências, os candidatos poderão se sair bem nas provas e conquistar a vaga desejada.', '2024-12-03', 9),
('Tendências do Vestibular: O Que Esperar das Provas nos Próximos Anos', 'As tendências dos vestibulares têm mostrado uma mudança significativa nos últimos anos, com uma crescente ênfase em habilidades além do simples conhecimento de conteúdos. Nos próximos anos, espera-se que as provas se tornem cada vez mais interdisciplinares, exigindo que os candidatos façam conexões entre diferentes áreas do saber, como matemática, ciências humanas e linguagens. A capacidade de interpretar textos, gráficos, e resolver questões que envolvem situações do cotidiano tende a ser mais valorizada. As universidades estão se adaptando a essas mudanças, tentando selecionar estudantes não apenas com bons conhecimentos teóricos, mas também com habilidades práticas e de resolução de problemas. Outra tendência crescente é o uso de tecnologias, com provas cada vez mais digitalizadas e recursos como simulados online sendo cada vez mais comuns.
Além disso, a personalização das provas também está ganhando espaço. Algumas instituições estão adotando o modelo de provas mais específicas para cursos, o que pode trazer uma experiência mais ajustada às habilidades necessárias para a área escolhida pelo candidato. Isso significa que as provas de vestibular, nos próximos anos, poderão ser mais direcionadas a áreas específicas de conhecimento, com questões que explorem a profundidade do conteúdo e não apenas a superficialidade. Estudantes que buscarem se destacar precisarão se adaptar a esse novo formato, que exige um estudo mais focado e uma preparação que integre diferentes habilidades. Manter-se atualizado com essas tendências e ajustar o planejamento de estudo será fundamental para os candidatos que almejam se destacar nas provas de vestibular nos próximos anos.', '2024-12-03', 10),
('A História por Trás das Provas de Vestibular: Como Surgiram os Exames', 'Os vestibulares, como conhecemos hoje, têm uma história que remonta ao século XIX, quando o sistema educacional brasileiro começou a se organizar de forma mais formal. Inicialmente, a seleção para o ingresso nas universidades era feita de maneira bastante restrita, com exames de admissão que favoreciam a elite da sociedade. As primeiras provas de vestibular surgiram com o objetivo de medir o conhecimento dos candidatos, que, até então, eram admitidos por meio de recomendações ou escolhas diretas de professores e instituições. Ao longo do tempo, o vestibular foi se tornando mais inclusivo e padronizado, especialmente com a criação das universidades públicas no Brasil, nas décadas de 1930 e 1940, quando as provas começaram a ser adotadas de forma mais ampla e com um formato mais estruturado.
Durante a segunda metade do século XX, os vestibulares se consolidaram como a principal forma de ingresso no ensino superior no Brasil, refletindo as mudanças na sociedade e nas políticas educacionais. Nos anos 1990, com a criação do Exame Nacional do Ensino Médio (ENEM), o sistema de vestibular sofreu uma transformação importante, pois o ENEM passou a ser utilizado como uma forma de seleção para as universidades, além de ser uma ferramenta para acessar programas como o ProUni e o FIES. O vestibular continuou a evoluir com o tempo, adaptando-se às novas demandas educacionais e ao perfil dos candidatos, mas sua história permanece como um reflexo das transformações sociais e educacionais do país, evidenciando a busca por um modelo mais democrático e acessível de ingresso ao ensino superior.', '2024-12-03', 11),
('Dicas para Estudar História para o ENEM: Como Organizar o Conteúdo', 'A globalização tem impactado profundamente os processos seletivos do vestibular e do ENEM, trazendo uma série de desafios e oportunidades para os estudantes. À medida que o mundo se torna cada vez mais interconectado, as questões cobradas nos exames têm refletido essa realidade globalizada, com temas que envolvem tanto o contexto nacional quanto o internacional. O ENEM, por exemplo, costuma abordar tópicos como mudanças climáticas, crises migratórias, globalização econômica e direitos humanos, exigindo que os candidatos tenham uma visão ampla e crítica dos fenômenos globais. Essa tendência tem se expandido também nos vestibulares, que estão incorporando questões sobre a influência de fatores globais nas esferas social, política e econômica do Brasil.
Além disso, a globalização trouxe consigo o aumento do uso de tecnologias, o que tem transformado a forma como os exames são aplicados e preparados. O acesso a conteúdos online, simulados e plataformas de aprendizado digital tornou o estudo para o vestibular e o ENEM mais dinâmico e acessível, permitindo que estudantes de diferentes partes do Brasil e do mundo possam se preparar de forma mais eficiente. No entanto, isso também aumentou a competitividade, já que todos têm acesso às mesmas ferramentas e informações. Por isso, é essencial que os candidatos se adaptem a essas mudanças, ampliando seus conhecimentos sobre questões globais e utilizando a tecnologia para otimizar sua preparação para os exames.', '2024-12-03', 12),
('Como a História Contemporânea Pode Ser a Chave para o ENEM 2024', 'As recentes reformas no Ensino Médio têm provocado uma série de mudanças significativas que afetam diretamente os processos seletivos do vestibular e do ENEM. A implementação da Base Nacional Comum Curricular (BNCC) e a introdução do Novo Ensino Médio trouxeram uma reorganização dos conteúdos programáticos, com maior ênfase em disciplinas como linguagens, matemática, ciências da natureza e ciências humanas. Essas mudanças alteraram a forma como os alunos se preparam para os exames, exigindo mais habilidades interdisciplinares e conhecimentos aprofundados. Além disso, a flexibilização do currículo no Ensino Médio, que permite aos estudantes escolherem itinerários formativos, está afetando a preparação, uma vez que nem todos terão o mesmo foco de estudo, o que pode gerar diferentes desafios no momento de enfrentar as provas.
No ENEM, por exemplo, o novo formato reflete as transformações ocorridas no Ensino Médio, cobrando mais capacidade dos candidatos para integrar conteúdos e aplicar conhecimentos em situações práticas. Questões interdisciplinares, que exigem habilidades de leitura crítica e análise, estão cada vez mais presentes. Os vestibulares, por sua vez, também têm adaptado seus exames para se alinhar a essas mudanças, muitas vezes incorporando questões que exigem mais do que o simples conhecimento factual, priorizando a reflexão e a capacidade de resolver problemas complexos. Para os estudantes, isso significa que a preparação precisa ser mais abrangente, com foco não só na memorização, mas no desenvolvimento de competências que podem ser aplicadas em diferentes contextos, tanto acadêmicos quanto profissionais.', '2024-12-03', 13),
('Provas de História no Vestibular: Como se Preparar para os Desafios', 'As tecnologias têm desempenhado um papel cada vez mais central na preparação para o vestibular e o ENEM, transformando a maneira como os estudantes acessam conteúdos e treinam para as provas. Plataformas de ensino online, aplicativos de estudo e simulados digitais tornaram o acesso à educação mais democrático, permitindo que alunos de diferentes regiões e realidades possam se preparar com materiais de alta qualidade. Além disso, a internet facilita o acesso a vídeos explicativos, aulas ao vivo e fóruns de discussão, que ajudam a esclarecer dúvidas e a aprofundar os conhecimentos. O uso dessas ferramentas tem sido essencial, especialmente para aqueles que buscam uma preparação mais flexível, no seu próprio ritmo e de acordo com suas necessidades.
Porém, o aumento da utilização das tecnologias também apresenta desafios. A grande quantidade de conteúdos disponíveis pode gerar uma sobrecarga de informações, o que exige que o estudante saiba selecionar as fontes mais confiáveis e relevantes para seu estudo. Além disso, o uso excessivo de dispositivos digitais pode levar à dispersão e falta de foco, tornando fundamental o equilíbrio entre o uso da tecnologia e a criação de hábitos de estudo tradicionais, como leitura de livros e resolução de exercícios. A chave para uma preparação eficaz no vestibular e no ENEM é integrar o melhor das ferramentas tecnológicas com métodos mais tradicionais, garantindo que o aluno desenvolva não apenas o conhecimento teórico, mas também habilidades de concentração e organização.', '2024-12-03', 14),
('História e Cultura Brasileira: O que Cairá nas Provas de Vestibular em 2024', 'As políticas de ações afirmativas têm se mostrado fundamentais para promover a inclusão social e racial no acesso ao ensino superior no Brasil. No contexto do vestibular e do ENEM, essas políticas buscam garantir que grupos historicamente marginalizados, como negros, indígenas e estudantes de escolas públicas, tenham mais oportunidades de ingressar nas universidades. A partir da implementação de cotas, que destinam uma parte das vagas a esses grupos, tem-se observado um aumento no número de ingressantes de diferentes perfis socioeconômicos, contribuindo para a diversidade nas instituições de ensino superior. Além disso, o ENEM tem sido um dos principais meios para o acesso a essas vagas, com os candidatos podendo se beneficiar do sistema de cotas através das notas obtidas no exame.
As ações afirmativas não apenas ampliam o acesso, mas também trazem uma transformação significativa no ambiente universitário, ao promover uma convivência mais plural e diversificada. Para os estudantes, essas políticas representam uma oportunidade de acesso à educação de qualidade e uma chance de superar barreiras históricas de desigualdade. Contudo, a implementação dessas ações também levanta debates sobre justiça social e a melhor forma de garantir a igualdade de oportunidades para todos. O importante é que as ações afirmativas continuam a ser um tema central no processo de democratização do ensino superior no Brasil, e sua evolução vai continuar a moldar os processos seletivos, incluindo os vestibulares e o ENEM, nos próximos anos.', '2024-12-03', 15);

SELECT titulo, conteudo, data_publicacao 
FROM noticias
WHERE data_publicacao < '2022-01-01';


-- Procura o nome do autor com a entrevista
SELECT n.titulo, n.conteudo, n.data_publicacao, a.nome AS autor
FROM noticias n
JOIN autores a ON n.id_autor = a.id_autor;

