-- ============================================================
-- Migration: Import SISPET legacy tutores e pets
-- Fonte: Y:\caoramelo sistemas\enderecos.html
-- Gerado: 2026-05-12
-- 406 tutores · 532 pets
-- ============================================================

BEGIN;

CREATE TEMP TABLE _tutor_map (idx INT PRIMARY KEY, tutor_uuid UUID);

-- ============ TUTORES ============

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosângela Benites', '67991013603', 'Rua Itajubá, 420, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 0, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ademir Boere', '67992921525', 'Rua Soez, 46, Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 1, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Admilson Silva', '67991503621', 'Rua João Pessoa, 430, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 2, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Adriana Gama', '67992613000', 'Rua Marli, 800, Vila Marli, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 3, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Adriana Sampaio Reinheimer', '67984721594', 'Av João Rosa Pires, 641, Apt 702, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 4, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Adriano Lima Garcia', '67981344006', 'Rua Plínio Bittencourt, 267, Jd Botânico, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 5, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Adrielly Santos', '67992349665', 'Eduardo Santos Pereira, 1256, Apt 1103, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 6, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Afonso Cunha', '16991780194', 'Rua Afro Puga, 0, Mata do Jacinto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 7, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Aide Andreza', '67993318488', 'Avenida Rodoviária, 1486, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 8, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Aires Prado', '67992727666', 'João Jacinto Camara, 212, Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 9, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alan Weasel', '67981600021', 'Afonso Pena, 2764, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 10, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alcides Victorio', '68999326307', 'Rua Pernambuco, 3279, Jd Autonomista, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 11, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alda Domingos', '67981611650', 'Avenida América, 190, Vila Planalto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 12, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alessandra Moraes', '67992874343', 'Rua Joao Akamine, 570, Santa Fé, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 13, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alessandro Jacometo', '67991267600', 'Arthur Jorge, 2239, Apt 503, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 14, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Alzir Leite Reinoso', '67999009556', 'Rua 14 de Julho, 5093, Bl 23 - Apt 12, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 15, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Amanda Barbosa Pereira', '67991278396', 'Rua União, 365, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 16, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Amanda Cristina Nascimento dos Santos Oliveira', '67982005322', 'Rua Sunko Yonamine, 400, Mata do Segredo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 17, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Amélia Pinheiro de Siqueira', '67992642618', 'Rua Gravataí, 362, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 18, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Beatriz Matsumoto', '67999375637', 'Rua Laguna, 117, Cabreuva, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 19, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Camila Rodrigues Alonso', '67982050172', 'Rua Delcides Mariano, 958, Rita Vieira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 20, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Campos', '67982144276', 'Júlio Dittmar, 1108, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 21, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Carolina Louveira Motti', '67999567199', 'Rua Alegrete, 5, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 22, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Caroline Alves', '21959021257', 'Avenida dos Crisantemos, 490, Bl B1 - Apt 22, Vila Sobrinho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 23, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Caroline de Lima Santana', '67981388310', 'Rua Ciro Macuco, 61, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 24, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Flávia Figueiredo Maciel', '67998416453', 'Aloízio de Azevedo, 386, Monte Líbano, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 25, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Gomes', '67992214775', '25 de Dezembro, ., ., Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 26, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Karoline Sandim', '67999292712', 'Santa Isabel, 152, Santa Luzia, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 27, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Maria Calixto', '11996140032', 'Dr Arthur Jorge, 2403, Apt 201, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 28, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Paula Lazarin de Goehr', '67996111467', 'Rua Amazonas, 947, Apt 204, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 29, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Paula Martinez', '67992162858', 'Rua Julio Barone, 437, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 30, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ana Vitória', '67996863261', 'Rua Padre João Crippa, 3299, Apt 202, Monte Líbano, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 31, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Anahilda Cameschi Braz', '65999819904', 'Rua Aniceto da Costa Rondon, 78, Caiçara, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 32, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Anderson Diógenes', '67999995943', 'Av Júlia Maksoud, 471, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 33, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Andreia', '67999235762', 'Rua Padre Joao Crippa, 3510, Apt 1703, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 34, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Andressa do Carmo', '67991568694', 'Rua Pedro Celestino, 3848, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 35, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Andreza Amaral', '67998944619', 'Avenida Prefeito Heráclito Diniz de Figueiredo, 815, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 36, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Angélica', '67999844850', 'Dr Arthur Jorge, 2117, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 37, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('ANIMAL PET - MORENINHAS', '67999443682', 'Rua Anacá, 542, Moreninhas 3, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 38, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Anna Flávia Montalvão', '11951616962', 'Rua João Felix Gonçalves, 107, Vila do Polones, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 39, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Anna Vitoria da Costa Lopes Dutra', '67981486390', 'Rua Sombreiro, 358, Carandá Bosque, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 40, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Antônio Carlos', '67981677930', 'Rua Celso Maia, 103, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 41, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Antonio Jose de Albuquerque', '92984671116', 'Rua Nhambiquara, 256, casa 1, Tijuca, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 42, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Aquila Pereira', '67996210187', 'Rua Colorado, 43, Vila Almeida, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 43, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ariane Nogueira Bertoldo', '67991416352', 'Rua Pernambuco, 3240, Jd Autonomista, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 44, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Arleth Ruiz dias', '67981008591', 'Rua Americo Brasiliense, 1449, Vila Almeida, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 45, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Beatriz Cristo', '41995530903', 'Rua 14 de Julho, 4721, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 46, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bianca Borges Avelino', '67992161092', 'Rua Engenheiro Victor Penteado Cunha, 461, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 47, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bianca Franca', '67992100098', 'Rua Doutor Dolor Ferreira da Andrade, 488, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 48, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Brenda Mikaela Evangelista', '67996979872', 'Avenida Rachid Neder, 300, Apt 202, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 49, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bruna', '67992938013', 'Rua Orquídea, 122, Parque Novos Estados, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 50, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bruna Cruzeiros', '67981282788', 'Marques De Lavradio, 0, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 51, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bruna Dequech', '67999696157', 'Rua Coronel Zózimo, 220, Bl M Apt 03, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 52, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Bruna Mello', '67999967642', 'Avenida Rachid Neder, 300, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 53, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Barreto Fernandes', '67992579503', 'Rua Helena Beruck, 519, Nova Lima, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 54, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Cristina Barbosa Orlandi', '67996687164', 'Rua dos Arquipélagos, 915, Coophavila II, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 55, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Freitas', '67984052939', 'Rua Nova Era, 301, Apt 1604, Itanhangá Park, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 56, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Maria Barros de Araujo Costa', '86999545318', 'Rua da Graciosa, 61, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 57, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Pinto', '18996841515', 'Rachid Neder, 300, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 58, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Camila Ribeiro', '67998364811', 'Avenida Rachid Neder, 300, Apt 204, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 59, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carla Figueiredo', '67999000554', 'Rua São Paulo, 526, Apt 202, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 60, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carlota Alencar Ennes', '67999835356', 'Dr Arthur Jorge, 2165, Apt 1001, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 61, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carmen Marise de Oliveira Adania', '67992055107', 'Travessa dos carroceiros, 41, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 62, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carolina Garcia de Castro Martins', '67981822487', 'Rua Fernando Luis Fernandes, 231, Lar do Trabalhador, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 63, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carolina Greco', '67992835153', 'Av Marques de Pombal, 2520, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 64, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Carolinne Abreu', '67981181254', 'Rua João Pessoa, 682, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 65, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Cenze Comércio de Combustíveis e Lubrificantes', '67991603360', 'Avenida Duque de Caxias, 5698, Vila Eliane, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 66, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('César Mesquita', '67998750000', 'Barão de Melgaço, 0, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 67, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Cidelha Tamazato', '67999825075', 'Rua Jaguarão, 30, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 68, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Claudenice de Oliveira', '67996084925', 'Rua Monte Moriá, 94, Residencial Oití, Maria Aparecida Pedrossian, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 69, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Claudia Gregorato', '67996565492', 'Rua União, 239, Água Limpa Park, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 70, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Creuza Moreira Xavier', '6799024511', 'Rua jacamim, 215, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 71, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Cristina Vilamayor', '67996741291', 'Rua Abarao Juio Rahe, 1746, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 72, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Daiana Violante', '67992162551', 'Rua São Felipe, 34, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 73, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Daiane Curan', '67999275066', 'Rua Júlio Barone, 607, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 74, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Daiane Luiz', '67999095593', 'Rua Baboa, 27, Q03 L01C, Jd Inápolis - Indubrasil, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 75, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Daniele de Azevedo', '67992902985', 'Rua da Liberdade, 990, Vila Eliane, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 76, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Danieli Dolci', '67996331972', 'Rua Dr Arthur Jorge, 2631, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 77, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Danielle Francisca Jacob Martins', '67992995285', 'Rua Ciro Macuco, 175, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 78, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Danielle Madeleine', '67998867753', 'Rua Porto Seguro, 37, Vila Planalto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 79, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Danielly Palomares', '67996582305', 'Rua doutor Arthur Jorge, 2403, Apt 1602, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 80, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Danúbia Tavares Vilaça', '37991418807', 'Rua 14 de Julho, 5180, Bl 08 - Apt 34, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 81, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Darci Bordim', '67999818569', 'Rua Caxambu, 147, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 82, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Darla Doretto Boreggio', '67981116551', 'Rua Assunção, 288, Casa 44, Vila Morumbi, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 83, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Dayane Cristine Duarte da Silva', '67991247555', 'Rua Francisco Antônio de Souza, 765, Portal Caiobá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 84, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Dayse Liz Ferreira', '67993410116', 'Rua José Oliva, 364, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 85, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Deise Tokuy', '67984076561', 'Rua Arthur Jorge, 2869, Apt 204, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 86, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Deivide Diogo Ribeiro Bandeira', '67991425981', 'Avenida Rodoviária, 1486, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 87, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Dereck Angeli Fernandes', '67991332079', 'Avenida Senador Antônio Mendes Canale, 1299, Bl 02 Apt 103, Pioneiros, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 88, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Diane Regina', '6796254964', 'Rua Marli, 604, Vila Marli, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 89, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Dina Bewiahn', '67991719215', 'Rua José Antônio, 2842, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 90, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Divino', '67991464863', 'Rua Brasil, 689, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 91, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Doryssany Balbuena França Galvão', '67981228796', 'Rua Frutal, 57, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 92, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('EA7 SISTEMAS - SISPET', '41992380219', 'R REVERENDO RAUL RODRIGUES DE CASTRO, 11, CAJURU, Curitiba, PR')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 93, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Edimilson Junio de Oliveira Silva', '66996093787', 'Rua Ibirapuera, 427, Casa C, Jd São Lourenço, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 94, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Edna Guimarães de Campos', '67999601961', 'Rua Ari Coelho de Oliveira Neto, 279, Jd Auxiliadora, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 95, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Edna Teodoro', '67991531792', 'Rua Ivinhema, 288, Vila Sobrinho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 96, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Elisabeth Maria Seabra Pereira', '67999128230', 'Rua 15 de novembro, 230, Apt 22, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 97, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Elizabeth Vollkopf', '67992662058', 'Rua Arthur Jorge, 2165, Apt 1002, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 98, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Elizete Vieira Carneiro', '67992132641', 'Rua Ferreira de Andrade, 1289, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 99, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Emilia', '67996110312', 'Rua Dolor Ferreira de Andrade, ., Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 100, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Emílio Flávio Vieira', '67998435343', 'Rua Nhambiquara, 1571, Tijuca, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 101, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Emilly Lopes', '67999536546', 'Rua Macunaíma, 920, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 102, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Emilly Mendonça Albuquerque Xavier', '67991480575', 'Rua Germana ferreira de Jesus, 274, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 103, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Erica Dias Lopes', '67991045533', 'Rachid Neder, 1330, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 104, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Éricka Harumi Matumoto', '67992437821', 'Rua Suécia 259, 259, Vila Planalto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 105, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Éricka Montalvani', '67992420556', 'Rua Bororos, ., Tijuca, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 106, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Erika Cardoso do Nascimento Nepomuceno da Rosa', '67999916291', 'Av Afonso Pena, 2081, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 107, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Esteffany Sales', '67984249052', 'Rua Bentevi, 176, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 108, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Eva Costa Vale', '67998719681', 'Rua Antônio João Ferreira, 361, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 109, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Evair Santiago', '67992190178', 'Rua Santana, 244, Bl D - Apt 14, Jd TV Morena, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 110, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Evelyn Martins', '67998736444', 'Rua Presidente Dutra, 1782, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 111, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fábia Campos Belo', '67991719573', 'Rua Petropolis, 1650, Bl 08 Apt 404, União, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 112, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fabiana Laburu', '67984256848', 'Travessa Continental, 104, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 113, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fabiane Barbosa da Silva', '67992958217', 'Rua Júlio Dittmar, 219, Apto 03, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 114, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fábio Correa Chaves', '67981239402', 'Rua São Judas Tadeu, 96, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 115, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fabíola Abreu', '67996233971', 'Rua Anita Garibaldi, 757, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 116, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fabrícia Nogueira de Abreu', '67984848214', 'Rua Barão de Mauá, 575, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 117, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fabrine Taíra', '67992440408', 'Rua Rogelio Casal Caminha, 584, Bl 7 Apt 103, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 118, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fátima Gauze', '67998352230', 'Rua José Oliva, 522, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 119, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fernanda Lima', '67998253014', 'Rua Jaguarão, 723, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 120, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Fernando dos Santos Pereira', '67992806234', 'Rua do Seminário, 1194, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 121, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Flávia Nezi', '46991173912', 'Rua Cascudo, 182, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 122, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Franciane Perez', '67992645175', 'Rua Amazonas, 947, Apt 304, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 123, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Franciele Prolo', '67991497301', 'Rua Lenir Flores Bergonzi, 442, Jardim Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 124, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Franco Santana Treu', '67981556897', 'Rua 13 de Junho, 2244, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 125, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriel Braga de Arruda', '67999460681', 'Rua das Paineras, 304, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 126, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriela Freitas', '67992056665', 'Rua das Paineiras, 1343, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 127, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriela Lescano', '67991434295', 'Rua Dionysos, 298, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 128, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriela Renesto', '67981858545', 'Rua Sacadura Cabral, 750, Jd Veraneio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 129, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriele Veron', '67998555398', 'Rua Lourdes Maluf, 27, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 130, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabriella Almeida', '67982192922', 'Rua Luis Coutinho Alencar, 94, Vilas Boas, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 131, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabrielle Gusmão', '67984670021', 'Rua Tabelião Murilo Rolim, 114, Torre A - Apt 214, Vivenda do Bosque, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 132, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gabrielly Dias Petersen', '67993037781', 'Avenida Prefeito Heraclito José Diniz de Figueiredo, 815, Apt 102 bl 45, Bairro Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 133, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gemima de Oliveira Moreira', '67982059997', 'Rua Xingu, 150, Vila Rica, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 134, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Geovana Regina Santos', '81991237817', 'Rua trindade, 581, Jd Paulista, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 135, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gianna da Cunha Piotti', '11983568357', 'Rua 13 de junho, 1383, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 136, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gilma Lira', '67992166543', 'Rua Afrânio Peixoto, 657, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 137, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gilneide Helena Ferreira', '62985475036', 'Rua Caroa, 32, Chácara Cachoeira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 138, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Giovana Valdez Motti', '67999558181', 'Rua Brasil, 1678, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 139, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gislaine Lopes', '69999677691', 'Rua das Garças, 854, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 140, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gleiciane Coimbra Barreiros', '67991013383', 'Pedro Celestino, 3021, Fundos, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 141, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gracieiry Arruda Ferreira', '67992674022', 'Rua Rio de Janeiro, 158, Casa 42, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 142, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Graciela Bewiahn', '67991719215', 'Rua José Antônio, 2842, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 143, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gracielly Ribeiro do Nascimento', '62996839388', 'Rua Coronel Zózimo, 35, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 144, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Graziela Bernardo', '67991877616', 'Rua Caxambu, 535, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 145, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Graziela Viviane Ratts', '31998639585', 'Rua 14 de Julhoapto 707, bloco 07, 4721, Bl 07 Apt 707, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 146, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Greice Oliveira De Carvalho Moreira', '67996982230', 'Avenida Padre João Falco, 1153, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 147, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Guilherme Borba', '67999012565', 'Rua Coronel Zozimo, 220, Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 148, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Guilherme Queiroz', '67981648184', 'Av. Rita Vieira de Andrade, 658, Rita Vieira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 149, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Gustavo Ferrero Marquiza', '67992613392', 'Av. dos Crisântemos, 490, Vila Sobrinho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 150, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Hyago Antônio Nascimento', '33998311179', 'Rua 14 de Julho, 4721, Bl 06 - Apt 604, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 151, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Iahnara Vasques', '11930882293', 'Rua Padre João Crippa, 3506, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 152, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ilson da Costa Benites', '67992242116', 'Rua Itajubá, 410, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 153, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Inajá Barrios', '67991870832', 'Rua Cascudo, 182, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 154, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Inês Oliveira', '67999444281', 'Rua José da Costa Feliz, 27, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 155, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabela Fonseca de Mello', '67991091669', 'Rua Lindóia, 1812, Vila Marli, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 156, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabela Gabriela', '67992114163', 'Rua 13 de Junho, 2319, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 157, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabella Borges Silva', '67999122202', 'Rua Dalila Araújo Garcia, 327, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 158, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabella Zigart Marão', '67998130082', 'Rua Hanna Abdulahad, 217, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 159, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabelle Secchin Graton', '34999269998', 'Rua Rezala Simão, ., Portão, Curitiba, PR')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 160, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isabelli Pereira Nelvo', '67998822722', 'Rua João Félix Gonçalves, 101, Vila do Polones, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 161, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isaura Fasciani', '', 'Av. Afonso Pena, 4730, Chácara Cachoeira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 162, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Isis Sodré', '67981738140', 'Rua Sacramento, 320, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 163, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Izadora Cruz', '67992547773', 'Rua Aporé, 265, Amambai, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 164, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jadir Dantas', '67992107626', 'Rua São Judas Tadeu, 57, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 165, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jamille de Moraes', '67992165592', 'Rua Quatorze de Julho, 5093, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 166, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janaína Frazão', '67996879708', 'Júlia Maksoud, 1374, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 167, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janaina Vargas', '67993079310', 'Rua Antonina de Castro Faria, 1261, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 168, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janaína Vargas Galo', '67996101459', 'Rua Brisas de Zaragoza, 100, Bl 400 Apt 452, Mato do Segredo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 169, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janaína Vargas Galo', '67996101459', 'Av Júlia Maksoud, 1374, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 170, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janayna Patrícia da Silva Leitum', '67981112786', 'Rua Amazonas, 947, Apt 704, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 171, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janine Miranda', '67998847279', 'Rua Emidgio de Campo Widal, 705, Alves Pereira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 172, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janine Vilharba', '67991727147', 'Rua 14 de Julho, 4585, Casa 13, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 173, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Janusa Soares de Araújo', '84988113893', 'Rua Dr Arthur Jorge, 2403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 174, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jaqueline', '67998194470', '14 de Julho, 4936, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 175, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jaqueline Monteiro', '67996621299', 'Ataulfo Paiva, 331, Jd Noroeste, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 176, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jardel de Carvalho', '67992595755', 'Rua Brasil, 1168, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 177, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jennyffer Toffoli', '67992529598', 'Rua Julio Dittmar, 898, Casa 6, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 178, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jéssica de Ávila Souza', '67992782973', 'Rua Dr dolor Ferreira de Andrade, 1587, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 179, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jéssica Silva', '67999453252', 'Rua Cebolinha, 1007, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 180, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jhenifer Cavali', '67992332798', 'Travessa Silvino Mendes, 18, Mato do Jacinto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 181, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jhully Ostenberg', '67984079969', 'Rua Julio Dittmar, 1196, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 182, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('João Firmino de Freitas', '67981341158', 'Rua Amélia Gelelaite Mônaco, 446, Sírio Libanês 2, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 183, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Joelcio Gonçalves da Silva', '67992624616', 'Rua Dona Idalina, 86, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 184, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Joelma', '67998411308', 'Dr Arthur Jorge, 2403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 185, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jordana Batista de Carvalho', '67999506598', 'Rua Ipiranga, 1590, Centro, Fátima do Sul, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 186, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Jorge Gabriel', '67992210032', 'Rua João Pessoa, 654, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 187, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('José Adelar Cuty da Silva', '67981121876', 'Rua Dolor Ferreira de Andrade, 678, Apt 43, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 188, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('José Arimatéia Alves Bezerra', '67982153004', 'Rua Treze de Junho, 3035, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 189, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('José Nilo', '67999522423', 'Rua Angela Abdulahad, 167, Residencial Virginia - Bloco D - Apt 05, Jd Paradiso, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 190, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Judith Willemann flor', '67991384774', 'Avenida Prefeito Heráclito José Diniz de Figueiredo, 815, Bl 5 Apt 204, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 191, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Julia Falcão', '67996355779', 'Rua Desembargador Leão Neto do Carmo, ., Jd Veraneio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 192, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Julia Mendes', '67999511704', 'Rua da Paz, 337, Apt 1102, Jd dos Estados, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 193, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Juliana Practos de Almeida', '67991350621', 'Sebastião Taveira, 511, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 194, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Juliane de Paula Fonseca', '67981408725', 'Rua 34, ., Nova Campo Grande, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 195, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Juracy Rodrigues da Silva', '67999585210', 'Rua Amazonas, 1228, Apt 404, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 196, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Karen', '996587429', 'Av Joaquim Dornelas, 1147, Vila Bandeirante, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 197, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Karimy Abdala', '67999525057', 'Rua Sete de Setembro, 2008, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 198, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Karine Nogueira Gomes de Miranda', '67997495170', 'Rua das Américas, 264, Vila Margarida, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 199, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Karla Hermosa', '68991427627', 'Rua Presidente Dutra, 264, Casa 3, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 200, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Karoline Vieira de Macedo', '67996318664', 'Rua Amazonas, 947, Apt 604, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 201, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Kátia Anffe', '67993122424', 'Rua Dolor de Andrade, 615, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 202, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Katia Flávia Rocha', '67996624269', 'Rua pocrane, 595, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 203, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Kerollen Silva Queiroz', '67991129014', 'Ciro Macuco, --, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 204, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Kézia Fernandes', '67992081262', 'Av Presidente Ernesto Geisel, 7312, Torre 02 - Apt 905, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 205, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Laine Paes de Matos', '67996118227', 'Rua José Olivas, 488, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 206, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lara Camila Lopes de Souza', '', 'Rua 14 de julho, 4721, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 207, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Larissa dos Santos Nascimento', '67992373073', 'Rua itacaja, 6, Casa 26, Tijuca, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 208, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Larissa Pires', '67991826888', 'Rua Brisas de Zaragoza, 100, Mato do Segredo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 209, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Laura Viveiros', '67991094036', 'Rua Prefeito Deusdeth de Carvalho, 37, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 210, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Laynara Denadai Raffa Faria', '67996690544', 'Rua Cora Coralina, 85, Casa 8, Cidade Jardim, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 211, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lázaro Motti', '67999840428', 'Rua Alegrete, 57, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 212, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Leila Maciel do Nascimento', '67991699135', 'Rua Ciro macuco, 61, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 213, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lenize Baracho', '67991977831', 'Rua Ariramba, 315, Otávio Pécora, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 214, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Leonidas Gomes de Oliveira Junior', '67999835210', 'Rua José Antonio Pereira, 2743, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 215, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Leonilda Riqueti', '67999330115', 'Rua Anita Garibaldi, 1996, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 216, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Letícia Caldeira Dominato', '17991214580', 'Rua Pocrena, 595, Casa 51, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 217, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Letícia David Koshiikene Damasceno Mota', '67992487555', 'Av. Presidente Ernesto Geisel, --, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 218, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lilian Vivian Guilhen Amarilha', '67992390903', 'Rua Joaquim Pereira Gabriel, 302, Portal do Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 219, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lilian Vivian Guilhen Amarilha', '67992390903', 'Rua Joaquim Pereira Gabriel, 304, Portal do Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 220, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lindinalva Alves de Oliveira Leme', '67991987979', 'Rio Rojas, 558, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 221, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lino Cunha', '67992648618', 'Rua Sílvio Romero, 420, São Lourenço, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 222, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luan Zenteno', '67981885115', 'Rua Amazonas, 681, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 223, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luana da Costa Marques Lima', '67996652111', 'Rua Marajó, 637, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 224, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luana Rasche', '67991913555', 'Rua João Akamine, 515, Santa Fé, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 225, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lucas Mendonça Giuseppin', '11999987040', 'Rua Hugo Pereira do Vale, 542, Mata do Jacinto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 226, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luci Duré', '67981387933', 'Rua Alegrete, 1354, Apt 8, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 227, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luciana Azevedo Fasciani Miziara', '67992054124', 'Rua Dr Abdala Duailibi, 264, Condomínio Beirute - Rua Jubail 113, Jd Veraneio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 228, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luciana Brum', '67996298323', 'Rua dos Previdenciários, 47, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 229, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luciana Niz', '67998719681', 'Rua Dr Adeir Avila de Andrade, 367, Rita Vieira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 230, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luciano Rodrigues', '67991919232', 'Rua Rodoviária, 1486, Bl 11 Apt 304, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 231, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lucineia Ricardo de Souza', '67991521621', 'Rua do Pôrto, 289, Coophavila II, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 232, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ludmila Cristina Martins Waki', '18996049602', 'Rua Alegrete, 5, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 233, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luna Câmara', '67996670303', 'Rua Dr Arthur Jorge, 2165, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 234, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luthiero Terêncio', '67996534642', 'Rua 11 de outubro, 631, Cabreuva, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 235, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Luzia Barbosa Teixeira de Mello', '67991391311', 'Rua Sessenta e Nove, 40, Nova Campo Grande, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 236, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lydiana Gonçalves', '67992790994', 'Rua Pedro Celestino, 3445, Apt 1102, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 237, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Lyslie Campos', '67981293845', 'Kerman José Machado, 126, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 238, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maiara Cruz', '67999731191', 'Marquês de Pombal, 1888, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 239, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maiely Finato', '67991184796', 'Rua Brisas de Zaragoza, 100, Mata do Segredo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 240, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Malu', '67992169391', 'Rua Alegrete, 195, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 241, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Manoel Molina', '67996494171', 'Rua das Garças, 449, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 242, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mara Cristina Longo Pereira', '67999832063', 'Rua Julio Barone, 708, Apt 1101, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 243, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maralí Oliveira', '67981387010', 'Rua Curiango, 18, Octávio Pécora, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 244, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Marcelle Santana Suiti', '21993590731', 'Rua Ivolandia, 274, Vila Popular, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 245, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Márcia Barbosa', '991083646', 'Rua Dolor Ferreira de Andrade, 601, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 246, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Márcia Pavese', '67992988946', 'Av Dr Paulo Adolfo Bernardes, 40, Maria Aparecida Pedrossian, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 247, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Marciano Paula de Souza', '67992664375', 'Rua Cisalpina Costa Monteiro, 72, A, Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 248, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Márcio Minoru Deai', '67981453503', 'Rua Doutor Arthur Jorge, 2428, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 249, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Marcio Rodrigues', '67991649616', 'José Antônio, 3592, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 250, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maressa Sampaio Reinheimer', '67981637278', 'Rua Arthur Jorge, 2403, Apt 602, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 251, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Clara', '67991145758', 'Rua Brasil, 1372, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 252, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria do Carmo Portocarrero Petelinkar', '67996689974', 'Rua Alegrete, 5, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 253, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Eduarda', '67992411388', 'Rua Canaã, 222, casa 4, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 254, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Eduarda Faustino', '67999151202', 'Rua Elias Martins, 33, Vilas Boas, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 255, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Elisa Duailibi', '67998343725', 'Xingu, 88, Jd Autonomista, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 256, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Elizena Oliveira Nantes', '67996758691', 'Rua Amazonas, 947, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 257, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Luiza', '67992911115', 'Rua Carlos Chagas, 371, Caiçara, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 258, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Luiza', '67981102328', 'Padre João Cripa, 3980, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 259, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Maria Tobias SIlva', '67998106968', '25 de Dezembro, 2157, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 260, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana Campos Lima', '67991256204', 'Rua José Oliva, 468, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 261, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana Costa Marques Montania', '67996426555', 'Rua Santa Barbara, 100, Vila Rica, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 262, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana de Leon', '67991299853', 'Rua Monte das Oliveiras, 363, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 263, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana de Leon Sousa', '67991299853', 'Rua Monte das Oliveiras, 363, Center Park, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 264, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana Guidini Pezzi Gouvea', '67992916484', 'Rua Aladin, 584, Estrela do Sul, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 265, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mariana Isa Poci Palumbo', '67999226918', 'Rua padre João Crippa, 3510, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 266, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mario Marcio Ferreira da Silva', '67981021052', 'Rua Júlio Barone, 708, Apt 1202, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 267, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Marli Malaquias Louveira', '67999637172', 'Rua Desembargador Eurindo Neves, 173, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 268, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Matheus', '67992984393', 'Mitsuo Daima, 327, Portal do Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 269, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mayara Brito Teixeira', '67999281220', 'Rua Brisas de Zaragoza, 270, Bl 400 Apt 462, Coronel Antonino, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 270, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mayara Frade', '18997783287', 'Rua Pio Rojas, 348, Bloco U Apt 34, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 271, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Michele Loprete Vieira', '11979863269', 'Rua Amazonas, 947, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 272, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Michelle Yonamine', '67984780234', 'Rua Pedro Celestino, 3445, Apt 102, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 273, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Minailli Sato', '67992605854', 'Rua Brasilândia, 950, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 274, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mirane Victorio Diniz da Silva', '68999326307', 'Rua Pernambuco, 3279, Jd Autonomista, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 275, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Miro Guimarães Darós', '41992902139', 'Rua Júlio, 555, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 276, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Misleine Cristina de Souza', '67991009323', 'João Pessoa, 425, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 277, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Mohamed Santos Ibrahim', '67992033091', 'Rua das Paineiras, 1195, Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 278, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nadine dos Anjos', '67993298601', 'Rua Ciro Macuco, 61, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 279, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nair Barros Penaves', '67992347837', 'José Antonio, 2789, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 280, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Natalia Gottardi', '67984139994', 'Rua Célia Fátima de Oliveira Guedes, 804, ., Nova Andradina, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 281, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Natasha Ormond', '67993234595', 'Dr Arthur Jorge, 2617, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 282, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nathalia Prado', '67992739181', 'Rua José Antônio, 3354, Bl J - Apt 32, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 283, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Natiane Martins', '68999259691', 'Avenida Tamandaré, 4743, Vila Planalto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 284, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nauir Monteiro', '67992371920', 'Rua Justino Mendes Leal de Aquino, 322, Vila Nascente, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 285, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nélida Navarro', '67981274268', 'Rua Alegrete, 5, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 286, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Neucimar Miranda', '67992968347', 'Rua 14 de Julho, 2434, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 287, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Newton Miranda', '67999953795', 'Rua Amphiloquio Ribeiro Jr, 40, Vila do Polones, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 288, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nicoli Passarelli', '67991662331', 'Rua João Pessoa, 654, Bl B - Apt 16, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 289, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nilce', '67992933886', 'Rua Dom Giovani, 0, Conjunto Residencial Estrela do Sul, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 290, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nilza Candia Vianna', '53999707761', 'Bacaba, 28, Coophatrabalho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 291, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Nina Gonçalves', '67992722842', 'Abraão Júlio Rahe, 471, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 292, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Noemia Aparecida de Oliveira Leite', '14988331655', 'Rua Filomena Segundo Nascimento, 4477, Rita Vieira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 293, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Oton Safraide', '67992342321', 'Rua, 13 de Junho, 4095, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 294, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ozair Bigaton', '67996326222', 'Rua Alexandre, 390, Monte Carlo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 295, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Patricia Bissoli Medeiros Clemente Póvoa', '67999590056', 'Rua Dr Jivago, 1147, Estrela do Sul, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 296, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Paula Haib Teixeira de Paiva Sahib', '67984780133', 'Rua Lazara de Souza, 35, Vila Morumbi, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 297, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Paula Roberta Costa de Lara', '', 'Rua Dois de Setembro, 282, Jd São Lourenço, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 298, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Paulo de Freitas Cardoso', '67999511080', 'Rua Vicente Bizon, 323, Casa 4, Vila Planalto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 299, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Paulo Eduardo', '67999070703', 'Rua Francisco de Paula Souza, 91, Jd Itatiaia, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 300, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Pedro Augusto Pacheco', '67996813980', 'Rua Brizas de Zaragoza, 270, Apt 452, Mata do Segredo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 301, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Phelipe Dantas', '67981386450', 'Rua Enoch Vieira de Almeida, 388, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 302, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Priscila Carlesso', '67992763727', 'Rua Dr. Miguel Vieira Ferreira, 1100, Casa 24, Vila Nossa Senhora das Graças, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 303, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Priscila Gabrielle Neto', '67992534426', 'Av Prefeito Heráclito Diniz de Figueiredo, ., Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 304, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Priscilla Yaeko Touma', '67998405084', 'Rua Padre Joao Crippa, 3555, Bl C - APt 402, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 305, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rafael Costa', '67981147934', 'Pedro Celestino, 3445, Apt 1503, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 306, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rafael Souza Ferreira Moura', '31992169382', 'Av Manoel Ferreira, 414, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 307, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rafaela Reisdorfer Morigi', '67999188381', 'Rua João Erovaldo de Campos, 10, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 308, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rafaelle Anache', '67991333489', 'Marques de Pombal, 1888, Bl 3 - Apt 403, Tiradentes, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 309, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rafaelli Meyer', '67999410601', 'Rua Júlio Dittmar, 1164, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 310, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Raphaela Bertotto', '67991122662', 'Rua São Judas Tadeu, 18, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 311, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rayanne', '67992077398', 'Rua Diogo Alvares, 90, Tijuca, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 312, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Regina Kelia Rodrigues', '67992020374', 'Rua Arthur Jorge, 2276, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 313, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Reginaldo Vieira Lopes', '31988586832', 'Rua Padre João Crippa, 3566, Apt 1203, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 314, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Renata Júlia do Carmo Jorge', '12992278767', 'R. Rui Barbosa, 4950, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 315, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Renato Rodrigues dos Santos', '67992989853', 'Rua Ambu, 104, Maria Pedrossian, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 316, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Reneide Casagrande', '67999853102', 'Av Armando Silvestrini, 328, Indubrasil, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 317, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rhaissa Mendes', '67993256656', 'Rua Rui Barbosa, 1820, Vila Glória, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 318, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ricardo Oliveira', '67992923591', 'Rua José Alberto Pereira, 119, Apt 103, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 319, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Roberta Araujo Brauner Luz', '67999748212', 'Rua Jaguarão, 403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 320, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Robson Nicola', '67992525150', 'Rua Sao Paulo, 661, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 321, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Robson Pereira Rodrigues', '67981592015', 'Rua Dr Arthur Jorge, 2606, Casa 3, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 322, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rochelle Costa', '67996263690', 'Arthur Jorge, 2403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 323, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rodrigo Oliveira', '67991236825', 'Rua cotegipe, 150, Vila Nossa Senhora das Graças, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 324, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rodrigo Oliveira', '67991236825', 'Rua Cotegipe, 150, Vila Nossa Senhora das Graças, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 325, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ronald Pereira Tiburcio', '67992324028', 'Rua Santo Inácio de Loiola, 482, Nova Lima, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 326, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ronaldo Oliveira', '67999813631', 'Rua Eduardo Santos Pereira, 735, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 327, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Ronnie Rodrigues Jordão', '67999843343', 'Rua Ibirapuera, 524, Jd São Lourenço, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 328, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosangela dos Santos Cabral Valiente', '67991061910', 'Rua Turiassu, 157, Taquarussu, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 329, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosângela Moraes da Silva', '67993107273', 'Rua Barigui, 97, Parque Novos Estados, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 330, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosevane de Oliveira Acosta', '', 'Rua Dr Antônio Leite de Campos, 249, Casa 2, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 331, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosilene Lopes', '67992209270', '14 de julho, 4721, Bl 7 - Apt 403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 332, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rossiane de Arruda Cortez', '67991105225', 'Francisco giordano, 372, Vila Sobrinho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 333, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Rosymeire', '67984112545', 'Rua Miranda, 268, Vila Palmira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 334, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Roxane Fuchs Jardim dos Santos', '67998240903', 'Avenida Dorvalino dos Santos, 910, Centro, Sidrolândia, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 335, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Roze Clei Peixoto Batista', '67999078818', 'Rua João Erovaldo de Campos, 30, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 336, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sabrina Franco', '67996618269', 'Rua Carlota de Almeida Lemos, 164, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 337, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Samira Campos Doueidar Sandim', '67999493158', 'Rua Alegrete, 227, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 338, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sandra Aparecida Costa Basílio', '67996814836', 'Chácara Planalto Verde, ., Lote 5 Quadra 5, Planalto Verde, Terenos, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 339, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sandra Cacho', '67984059732', 'Rua Olário de Oliveira França, 535, Setvillage II, Vila Nasser, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 340, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sandra Regina de Jesus Onorio', '67992694221', 'Rua Jardim Presidente Dutra, 124, Jd Bonança, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 341, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sara Dequech', '67999093784', 'Travessa Dunas, 60, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 342, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sara Lucena Ferreira', '67992025471', 'Rua Ana Lucia, 203, Giocondo Orsi, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 343, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sarah Campos', '67992146762', 'Rua José Oliva, 468, Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 344, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Selmo Duarte', '67991452830', 'Rua 70, 1283, Nova Campo Grande, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 345, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sergio Tamashiro', '67982064000', 'Rua Jaguarão, 9, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 346, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Shirley Camilo de Farias', '67981255980', 'Rua Araguaia, 117, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 347, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Simone Machado', '67999287862', 'Travessa Saquarema, 69, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 348, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sirlei Aparecida Alves Pereira', '67996029702', '14 de Julho, 4721, Bl 5 - Apt 607, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 349, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sirlei Miranda', '67999287393', 'Rua Caroba, 68, Coophatrabalho, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 350, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sofia Berenyi', '67999094446', 'Rua Anita Garibaldi, 324, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 351, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sônia Falcão', '67981303475', 'Travessa Ivo do Prado, 103, Portal do Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 352, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Stefany dos Santos Hernandes', '17997669668', 'Benedito Silveira Leite, ., ., Santa Fé do Sul, SP')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 353, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Stélio Miranda', '67981363665', 'Rua Padre João Cripa, 3555, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 354, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Stella Gonçalves', '62994666938', 'Rua Doutor Arthur Jorge, 2239, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 355, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Stephanie Andrade', '67991906279', 'Rua Zola Cícero, 876, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 356, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Stephanie Maria Aléssio de Souza Pinto Martins', '27999354074', 'Rua Júlio Barone, 607, Apt 302, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 357, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sthefany Nascimento Gonçalves', '67996674655', '13 de Junho, 2266, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 358, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Sueli do Vale', '67992022312', 'Rua Maracaju, 1062, Apt 404 Bl A, Centro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 359, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Suellen Ayala', '67993111220', 'Rua benito bolzan, 70, Caiobá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 360, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Suéllen Martins', '', 'Avenida Tamer Geleláite, 113, Bl 2 Apt 101, Santo Amaro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 361, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tábata Antunes', '44991649524', 'Eduardo Santos Pereira, 937, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 362, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tábata Antunes', '44991649524', 'Eduardo Santos Pereira, 937, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 363, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Taina Katayama', '67992215279', 'Rua Cotegipe, 863, Coophasul, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 364, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tainara Chaves Ricardo de Castro', '67998232606', 'Rua Arthur Jorge, 2869, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 365, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Talessa Gimenez', '67993350097', 'Generoso Leite, 841, Vila Marli, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 366, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Talita Ribeiro', '67992636497', 'Rua Novo Hamburgo, 521, Flamboyant, Chapadão do Sul, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 367, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tamara', '67999997768', 'Sebastião Taveira, 816, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 368, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tania Cristina da Costa', '67996350266', 'Rua Zola Cícero, 1034, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 369, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tânia Curan', '67999589057', 'Arlindo Antônio de Souza, 40, Portal do Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 370, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tânia Moreira Xavier', '67992391814', 'Rua Onoria Martins Pereira, -, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 371, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tatiana Ribeiro Pinto da Silva', '67981489599', 'Rua das Paineiras, 461, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 372, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Teresa Cristina', '67999347720', 'Rua Paraíba, 1659, Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 373, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Tereza Carneiro ds Costa de Oliveira', '67998789339', 'R. Aluizio de Azevedo, 330, Apt 302 F, Monte Líbano, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 374, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thairce F. Ferreira de Oliveira', '11986251584', 'Rua Vinte Cinco de Dezembro, 2180, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 375, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thaís Katayama', '67992357214', 'Rua Cotegipe, 863, Coophasul, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 376, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thaís Koller da Silva', '67993301140', 'Rua Resedá, 184, Chácara Cachoeira, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 377, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thaisa', '67996753083', 'Rua Dr Arthur Jorge, 2244, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 378, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thalita Vieira', '67992291177', 'Rua Sacramento, 320, Bl B Apt 503, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 379, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thamiris Pereira de Oliveira', '67991947070', 'Rua do Rosário, 716, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 380, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thauany Teixeira', '67992020159', 'Rua Amazonas, 810, Apt 804, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 381, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thayla Ortega Chacha', '67991090789', 'Rua Alegrete, 5, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 382, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thaysa Rosa da Costa', '67991119587', 'Avenida Belarmino Bartolino da Silva, 48, Mata do Jacinto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 383, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Thayza Rodrigues Marinho', '67992715437', 'Av. Prefeito Heráclito Diniz de Figueiredo, 815, Bl 26 Apt 403, Seminário, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 384, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Vagner Rici Jr', '67992348326', 'Rua Estrela do Sul, 257, casa 6, Vila Vilas Boas, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 385, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Valdecir Bonfim', '67981215462', 'José Oliva, 874, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 386, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Valdir Aparecido Reinaldo', '67999814520', 'Rua das Paineiras, 271, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 387, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Valéria Regina Monteiro Nunes Brotto', '67991363491', 'Dr Arthur Jorge, 2403, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 388, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Veronica da Silva', '67992258641', 'Rua Dr Arthur Jorge, 2403, Monte Líbano, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 389, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Veruska Yumi Arashiro', '67992299871', 'Rua Leônidas de Matos, 329, Santo Antônio, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 390, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Victor Hugo Da Silva Ota', '', '14 de julho ,, 5093, Bl 11 Apt 02, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 391, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Victor Hugo Salles de Miranda Pedreira', '67999069889', 'Rua Assunção, 288, Vila Morumbi, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 392, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Vitor Denardi', '67991737171', 'Rua Palmares, 143, Silvia Regina, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 393, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Vitor Hugo Mariotti', '67992835221', 'Rua Paulo Tognini, 104, Mata do Jacinto, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 394, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Vivianne', '67996488018', 'Rua Enoch Vieira de Almeida, 373, Bl 01 Apt 104, Vila Cruzeiro, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 395, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Wagner Maia Fortes', '67992676265', 'Rua Júlio Dittmar, 623, Apt 604, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 396, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Walkiria Soares Pereira Loureiro', '67992584074', 'Avenida São Nicolau, 1705, Vila Santa Luzia, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 397, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Wanderlei Domingos dos Santos', '67992834407', 'Travessa Camuyrano, 103, Panamá, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 398, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Wanderley Bernardo', '67999829211', 'Rua Sacramento, 240, São Francisco, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 399, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Wesley Alves', '67996874560', 'Rua João Pessoa, 682, Bl B2 - Apt 203, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 400, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Wesley Simões', '67991613629', 'Rua Marcílio Cardoso, 652, Vila Nascer, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 401, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('William de Sá', '67991117071', 'Rua Feliciana Carolina, 207, Cabreúva, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 402, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Yago do Couto', '6799419988', 'Rua Amazonas, 970, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 403, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Yara Guimarães', '67991187496', 'Rua kojum Yamaki, 290, Residencial Búzios, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 404, id FROM ins;

WITH ins AS (
  INSERT INTO tutores (nome, whatsapp, endereco)
  VALUES ('Zilca Migueis', '67992812444', 'Luiz Braille, 513, Monte Castelo, Campo Grande, MS')
  ON CONFLICT DO NOTHING RETURNING id
)
INSERT INTO _tutor_map SELECT 405, id FROM ins;

-- ============ PETS ============

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zac', 'Yorkshire Terrier', 'pequeno', 'macho', false, true, '2017-11-29', NULL
  FROM _tutor_map t WHERE t.idx = 0;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tuff', 'SRD', 'medio', 'macho', true, true, NULL, '3-4 anos; castrado.'
  FROM _tutor_map t WHERE t.idx = 1;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Princesa', 'Shih Tzu', 'pequeno', 'femea', false, true, '2023-11-20', NULL
  FROM _tutor_map t WHERE t.idx = 2;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zag', 'Shih Tzu', 'pequeno', 'macho', true, true, '2024-01-20', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 3;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Snow', 'SRD', NULL, 'macho', true, true, '2024-10-19', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 3;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Schnauzer', NULL, 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 4;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Costela', 'SRD', 'medio', 'macho', true, true, '2013-03-19', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 5;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zara', 'SRD', 'grande', 'femea', false, true, '2025-04-15', NULL
  FROM _tutor_map t WHERE t.idx = 6;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Max', 'SRD', NULL, 'macho', false, true, '2021-06-01', NULL
  FROM _tutor_map t WHERE t.idx = 7;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jarvis', 'SRD', NULL, 'macho', false, true, '2021-07-10', NULL
  FROM _tutor_map t WHERE t.idx = 8;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chanel', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 9;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Juma', 'Persas', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 9;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Benji', 'Golden Retriever', NULL, 'macho', false, true, '2024-12-08', NULL
  FROM _tutor_map t WHERE t.idx = 10;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Poodle', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 11;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nala', 'Shih Tzu', 'pequeno', 'femea', false, true, '2015-12-05', 'NÃO SE DÃO BEM COM OUTROS CÃES.'
  FROM _tutor_map t WHERE t.idx = 12;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Garu', 'Shih Tzu', 'pequeno', 'macho', true, true, '2015-12-05', 'NÃO SE DÃO BEM COM OUTROS CÃES; CASTRADO.'
  FROM _tutor_map t WHERE t.idx = 12;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chanel', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 13;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gato', 'SRD', NULL, NULL, false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 13;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Duda', 'Pinscher', NULL, 'femea', true, true, NULL, 'Caramelo; Castrada; 13 anos.'
  FROM _tutor_map t WHERE t.idx = 14;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Manu', 'Pinscher', NULL, 'femea', false, true, NULL, '9 anos.'
  FROM _tutor_map t WHERE t.idx = 14;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Neguinho', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 15;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', 'pequeno', 'femea', true, true, '2016-08-24', 'Castrada; Dermatite atópica; Alergia frango, cenoura, produtos com cheiro forte, lâminas (passar superficial).'
  FROM _tutor_map t WHERE t.idx = 16;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jannis', 'SRD', 'pequeno', 'femea', true, true, '2015-08-02', 'Castrada; Dermatite atópica e sinusite.'
  FROM _tutor_map t WHERE t.idx = 16;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'SRD', 'medio', 'femea', false, true, '2020-07-01', NULL
  FROM _tutor_map t WHERE t.idx = 17;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bela', 'Poodle', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 18;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gaya', 'Pitbull', 'grande', 'femea', false, true, '2024-03-18', NULL
  FROM _tutor_map t WHERE t.idx = 19;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Apollo', 'Pitbull', 'grande', 'macho', false, true, '2025-01-26', NULL
  FROM _tutor_map t WHERE t.idx = 19;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bob', 'SRD', NULL, 'macho', true, true, '2024-07-02', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 20;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'SRD', NULL, 'femea', false, true, '2024-12-16', 'TRATA LEISH.'
  FROM _tutor_map t WHERE t.idx = 21;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Lhasa Apso', NULL, 'macho', true, true, '2021-10-13', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 22;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Spitz', 'pequeno', 'macho', true, true, '2023-07-11', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 23;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'SRD', NULL, NULL, false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 24;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Floki', 'Lhasa Apso', 'pequeno', 'macho', false, true, '2020-07-02', NULL
  FROM _tutor_map t WHERE t.idx = 25;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gudo', 'Poodle', 'medio', 'macho', true, true, '2013-11-15', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 26;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sirius', 'SRD', NULL, 'macho', true, true, '2024-10-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 27;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Buddy', 'Maltês', 'pequeno', 'macho', false, true, '2019-08-31', NULL
  FROM _tutor_map t WHERE t.idx = 28;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jack', 'Pug', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 28;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jack', 'SRD', 'pequeno', 'macho', false, true, NULL, 'Possui algumas verrugas e caroços que podem machucar.'
  FROM _tutor_map t WHERE t.idx = 29;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zeus', 'Pitbull', 'grande', 'macho', false, true, '2013-01-01', NULL
  FROM _tutor_map t WHERE t.idx = 30;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luke', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, '5 anos.'
  FROM _tutor_map t WHERE t.idx = 31;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Elfo', 'SRD', 'pequeno', 'macho', true, true, '2020-01-01', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 32;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Wendy', 'SRD', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 32;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Reiki', 'American Bully', 'grande', 'macho', false, true, '2024-01-15', NULL
  FROM _tutor_map t WHERE t.idx = 33;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tuk', 'Dachshund', 'pequeno', 'femea', false, true, '2024-06-10', NULL
  FROM _tutor_map t WHERE t.idx = 34;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sol', 'SRD', 'pequeno', 'femea', false, true, NULL, 'Mais ou menos 3 anos;.'
  FROM _tutor_map t WHERE t.idx = 35;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Challyn', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 35;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Catarina', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 35;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bela', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 36;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 37;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bud', 'Lhasa Apso', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 39;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gin', 'Lhasa Apso', 'medio', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 39;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cowboy', 'Pitbull', 'grande', 'macho', false, true, '2025-03-06', NULL
  FROM _tutor_map t WHERE t.idx = 40;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Viola', 'Pitbull', 'grande', 'femea', false, true, '2025-03-06', NULL
  FROM _tutor_map t WHERE t.idx = 40;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Rocambole', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 41;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Lhasa Apso', 'pequeno', 'femea', true, true, '2023-06-03', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 42;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Will', 'SRD', 'medio', 'macho', false, true, '2023-09-09', NULL
  FROM _tutor_map t WHERE t.idx = 43;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Junior', 'Golden Retriever', 'grande', 'macho', false, true, '2024-02-28', NULL
  FROM _tutor_map t WHERE t.idx = 44;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tunico', 'Bernese', 'grande', 'macho', false, true, '2025-01-06', NULL
  FROM _tutor_map t WHERE t.idx = 44;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bolinha', 'SRD', 'medio', 'femea', false, true, '2015-05-02', NULL
  FROM _tutor_map t WHERE t.idx = 45;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, '2013-09-09', NULL
  FROM _tutor_map t WHERE t.idx = 46;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zeca', 'Spitz', 'pequeno', 'macho', false, true, '2024-11-04', NULL
  FROM _tutor_map t WHERE t.idx = 47;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Frederico', 'SRD', 'medio', 'macho', true, true, '2024-09-14', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 48;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bleck', 'Pug', 'pequeno', 'macho', false, true, '2020-02-05', 'Alergia frio e poeira.'
  FROM _tutor_map t WHERE t.idx = 49;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mauari', 'SRD', 'medio', 'femea', true, true, '2022-06-17', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 50;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Linguiço', 'SRD', 'medio', 'macho', false, true, '2024-09-04', 'Tratando alergia de pele. Faz uso de corticoides.'
  FROM _tutor_map t WHERE t.idx = 51;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lua', 'SRD', 'pequeno', 'femea', false, true, '2022-11-04', NULL
  FROM _tutor_map t WHERE t.idx = 52;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'SRD', 'pequeno', 'femea', false, true, '2022-11-04', NULL
  FROM _tutor_map t WHERE t.idx = 52;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2021-12-11', NULL
  FROM _tutor_map t WHERE t.idx = 53;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bolota', 'Lhasa Apso', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 54;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kiara', 'SRD', 'grande', 'femea', true, true, '2016-02-20', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 55;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Poodle', 'pequeno', 'femea', true, true, '2020-08-16', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 56;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lion', 'SRD', 'pequeno', 'macho', false, true, '2025-02-05', NULL
  FROM _tutor_map t WHERE t.idx = 57;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sheldon José Pinto Santos', 'Chihuahua', 'pequeno', 'macho', true, true, '2024-01-01', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 58;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jujuba', 'SRD', 'pequeno', 'femea', true, true, '2014-02-17', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 59;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maju', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 60;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lily', 'Shih Tzu', 'pequeno', 'femea', false, true, '2025-03-13', 'Carne, planta (teve um episódio de alergia após ter ingerido uma folh, não conseguimos identificar a planta)'
  FROM _tutor_map t WHERE t.idx = 60;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Elis', 'Shih Tzu', 'pequeno', 'femea', true, true, '2002-10-09', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 61;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tufinho', 'SRD', 'pequeno', 'macho', false, true, '2023-12-14', NULL
  FROM _tutor_map t WHERE t.idx = 62;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tininha', 'SRD', 'pequeno', 'femea', true, true, '2023-12-14', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 62;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Juca', 'Basset Hound', 'grande', 'macho', false, true, '2020-03-03', NULL
  FROM _tutor_map t WHERE t.idx = 62;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jully', 'Chow-Chow', NULL, 'femea', false, true, NULL, '14 anos.'
  FROM _tutor_map t WHERE t.idx = 63;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 63;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maya', 'Lhasa Apso', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 63;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tornado', 'Jack Russel Terrier', 'pequeno', 'macho', false, true, '2020-09-27', NULL
  FROM _tutor_map t WHERE t.idx = 64;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Millo', 'Jack Russel Terrier', 'pequeno', 'macho', false, true, '2025-09-17', NULL
  FROM _tutor_map t WHERE t.idx = 64;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Joaquim', 'SRD', 'pequeno', 'macho', false, true, '2019-09-10', NULL
  FROM _tutor_map t WHERE t.idx = 65;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pandora', 'Rottweiler', 'grande', 'femea', false, true, '2024-04-15', NULL
  FROM _tutor_map t WHERE t.idx = 66;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Souti', 'Pastor Belga', 'grande', 'macho', false, true, '2024-06-17', NULL
  FROM _tutor_map t WHERE t.idx = 66;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Faruk', 'SRD', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 66;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tander', 'SRD', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 66;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 66;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pitoco', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 67;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maya', 'Border Collie', 'medio', 'femea', false, true, '2016-10-10', NULL
  FROM _tutor_map t WHERE t.idx = 68;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pretiña', 'SRD', 'pequeno', 'femea', true, true, '2019-12-21', 'Castrada; Dermatite Atopica (controlada); Usa Apoquel.'
  FROM _tutor_map t WHERE t.idx = 69;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Frederico Leonardo Gregorato', 'Golden Retriever', 'grande', 'macho', false, true, '2019-08-05', NULL
  FROM _tutor_map t WHERE t.idx = 70;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Toddy', 'Shih Tzu', 'pequeno', 'macho', true, true, '2023-02-20', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 71;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Stallone', 'Shih Tzu', 'pequeno', 'macho', false, true, '2015-11-15', 'Não tem 1 dos olhos; Faz uso de colírio.'
  FROM _tutor_map t WHERE t.idx = 72;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pérola', 'SRD', 'grande', 'femea', false, true, '2019-07-19', NULL
  FROM _tutor_map t WHERE t.idx = 73;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gamora', 'Shih Tzu', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 74;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Shih Tzu', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 74;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Miki', 'SRD', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 74;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Toy', 'SRD', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 75;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 76;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bolota', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, 'Tem catarata, não enxerga bem.'
  FROM _tutor_map t WHERE t.idx = 76;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mia', 'Persas', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 76;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kika', 'Shih Tzu', 'pequeno', 'femea', true, true, NULL, '15 anos; Castrada.'
  FROM _tutor_map t WHERE t.idx = 77;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Hebe Jacob', 'Dachshund', 'pequeno', 'femea', false, true, '2025-11-19', 'Alergia à grama.'
  FROM _tutor_map t WHERE t.idx = 78;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'pequeno', 'femea', false, true, '2018-07-18', 'Misturada com Lhasa; Medicações Imunizan pet, doxiciclina.'
  FROM _tutor_map t WHERE t.idx = 79;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Elvis', 'Shih Tzu', NULL, 'macho', true, true, '2020-04-19', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 80;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Fred', 'Shih Tzu', 'pequeno', 'macho', true, true, '2020-04-19', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 80;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mia', 'Shih Tzu', 'pequeno', 'femea', false, true, '2024-04-08', 'Deficiência na patinha esquerda e isso lhe dá mais sensibilidade.'
  FROM _tutor_map t WHERE t.idx = 81;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Faísca', 'SRD', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 82;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vida', 'Yorkshire Terrier', 'pequeno', 'femea', true, true, '2016-06-14', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 83;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Euro', 'Labrador Retriever', 'grande', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 84;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Giorgio', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 85;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mila', 'Lhasa Apso', 'pequeno', 'femea', true, true, '2014-11-26', 'Castrada; No momento ela está usando Hpar, nutre same 200'
  FROM _tutor_map t WHERE t.idx = 86;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'Shih Tzu', 'pequeno', 'femea', false, true, '2025-01-02', NULL
  FROM _tutor_map t WHERE t.idx = 87;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Boris', 'Buldog FrancêsOFF', NULL, 'macho', false, true, '2023-02-15', NULL
  FROM _tutor_map t WHERE t.idx = 88;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tunico', 'SRD', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 89;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Garoa', 'Shih Tzu', 'pequeno', 'femea', false, true, '2014-01-01', NULL
  FROM _tutor_map t WHERE t.idx = 89;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Eva', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2018-11-18', NULL
  FROM _tutor_map t WHERE t.idx = 90;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sofia', 'Shih Tzu', 'pequeno', 'femea', false, true, '2018-11-18', NULL
  FROM _tutor_map t WHERE t.idx = 90;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'pequeno', 'femea', false, true, '2017-03-06', NULL
  FROM _tutor_map t WHERE t.idx = 91;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vitória', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 92;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luke', 'Dachshund', 'pequeno', 'macho', false, true, '2025-04-16', NULL
  FROM _tutor_map t WHERE t.idx = 94;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Melo Gustavo', 'Boxer', 'grande', 'macho', true, true, '2018-01-15', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 95;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Catarina Júlia', 'Pitbull', 'medio', 'femea', false, true, '2024-09-23', NULL
  FROM _tutor_map t WHERE t.idx = 95;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Laila', 'Poodle', 'pequeno', 'femea', false, true, '2011-05-16', NULL
  FROM _tutor_map t WHERE t.idx = 96;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 97;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Isa', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, '8 anos.'
  FROM _tutor_map t WHERE t.idx = 98;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mito', 'Fox Paulistinha', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 99;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tinker', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 100;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Juliete', 'Spitz', 'pequeno', 'femea', false, true, NULL, 'Displasia coxofemoral.'
  FROM _tutor_map t WHERE t.idx = 100;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tito', 'Poodle', 'medio', 'macho', false, true, '2016-06-07', NULL
  FROM _tutor_map t WHERE t.idx = 101;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jake', 'Dachshund', NULL, 'macho', false, true, '2024-10-16', NULL
  FROM _tutor_map t WHERE t.idx = 102;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Finn', 'Dachshund', NULL, 'macho', false, true, '2025-03-12', NULL
  FROM _tutor_map t WHERE t.idx = 102;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aurora', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 103;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zuzu', 'Beagle', NULL, 'femea', false, true, '2020-02-05', NULL
  FROM _tutor_map t WHERE t.idx = 104;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Hiro', 'Lhasa Apso', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 105;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Theo', 'Dachshund', 'pequeno', 'macho', false, true, '2023-07-10', NULL
  FROM _tutor_map t WHERE t.idx = 106;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Toddy', 'Dachshund', 'pequeno', 'macho', false, true, '2023-07-10', NULL
  FROM _tutor_map t WHERE t.idx = 106;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Flock', 'Bulldog Francês', NULL, 'macho', true, true, '2019-12-24', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 107;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Diana Smith Sales', 'Dachshund', 'pequeno', 'femea', false, true, '2025-03-08', NULL
  FROM _tutor_map t WHERE t.idx = 108;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gothan', 'Shiba inu', 'medio', 'macho', false, true, '2018-11-25', NULL
  FROM _tutor_map t WHERE t.idx = 109;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Charlene', 'Welsh corgi pembroke', NULL, 'femea', false, true, '2023-07-01', NULL
  FROM _tutor_map t WHERE t.idx = 110;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kira', 'Shih Tzu', NULL, 'femea', false, true, '2018-07-17', NULL
  FROM _tutor_map t WHERE t.idx = 111;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lulu Belo', 'SRD', 'grande', 'macho', true, true, '2012-08-07', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 112;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Shih Tzu', 'pequeno', 'femea', false, true, '2013-09-18', NULL
  FROM _tutor_map t WHERE t.idx = 113;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Julie', 'SRD', 'medio', 'femea', true, true, '2019-01-12', 'Castrada. Dermatite atópica, faz uso de Apoquel diário.'
  FROM _tutor_map t WHERE t.idx = 114;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Julio', 'Chihuahua', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 115;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luck', 'Dogue Alemão', 'grande', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 116;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Panda', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 117;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Love', 'SRD', NULL, 'femea', true, true, '2019-04-12', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 118;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Blue', 'Chow-Chow', NULL, 'femea', false, true, '2021-06-11', NULL
  FROM _tutor_map t WHERE t.idx = 118;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Boomer', 'SRD', 'medio', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 119;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Floquinho', 'SRD', NULL, 'macho', false, true, '2019-04-17', NULL
  FROM _tutor_map t WHERE t.idx = 119;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ted', 'SRD', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 119;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sushi', 'Persas', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 119;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Snow', 'Spitz', 'pequeno', 'macho', true, true, '2022-03-14', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 120;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pandora', 'Spitz', 'pequeno', 'femea', false, true, '2022-11-08', NULL
  FROM _tutor_map t WHERE t.idx = 120;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Frederico (Fred)', 'Pug', 'pequeno', 'macho', false, true, '2016-09-06', NULL
  FROM _tutor_map t WHERE t.idx = 121;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Joca', 'Golden Retriever', NULL, 'macho', false, true, '2025-07-09', NULL
  FROM _tutor_map t WHERE t.idx = 122;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Florinda', 'SRD', NULL, 'femea', true, true, '2023-12-19', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 122;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Penélope', 'Shih Tzu', 'pequeno', 'femea', false, true, '2016-09-27', NULL
  FROM _tutor_map t WHERE t.idx = 123;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Taygo', 'Rottweiler', 'grande', 'macho', false, true, '2015-10-26', NULL
  FROM _tutor_map t WHERE t.idx = 124;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Café', 'SRD', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 125;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 125;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luly', 'Shih Tzu', 'pequeno', 'femea', false, true, '2023-11-10', NULL
  FROM _tutor_map t WHERE t.idx = 126;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Fred', 'Labrador Retriever', 'grande', 'macho', true, true, '2023-12-15', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 127;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bento', 'Bernese', 'grande', 'macho', false, true, '2024-05-01', NULL
  FROM _tutor_map t WHERE t.idx = 128;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Laika', 'SRD', 'medio', 'femea', false, true, NULL, 'Em torno de 15 anos; Medo de fogos.'
  FROM _tutor_map t WHERE t.idx = 129;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nebulosa', 'Dálmata', 'grande', 'femea', false, true, '2025-11-06', 'Ela tem hipersensibilidade alimentar, oferecer outros alimentos em pouquíssima quantidade.'
  FROM _tutor_map t WHERE t.idx = 130;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bela', 'Pastor Alemão', 'grande', 'femea', false, true, NULL, '2-3 anos.'
  FROM _tutor_map t WHERE t.idx = 131;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora Maria', 'SRD', 'pequeno', 'femea', true, true, '2024-11-20', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 131;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Marri', 'Persas', NULL, 'femea', false, true, '2018-04-08', NULL
  FROM _tutor_map t WHERE t.idx = 132;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lola', 'SRD', 'pequeno', 'femea', false, true, '2024-10-10', NULL
  FROM _tutor_map t WHERE t.idx = 133;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sofia', 'SRD', 'medio', 'femea', false, true, '2011-10-26', NULL
  FROM _tutor_map t WHERE t.idx = 133;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pipoca', 'Shih Tzu', 'pequeno', 'femea', false, true, '2020-03-05', NULL
  FROM _tutor_map t WHERE t.idx = 134;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Elis Regina', 'SRD', 'medio', 'femea', false, true, '2023-03-15', NULL
  FROM _tutor_map t WHERE t.idx = 135;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Catarina Regina', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 135;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Índia', 'SRD', 'grande', 'femea', true, true, NULL, 'Castrada'
  FROM _tutor_map t WHERE t.idx = 136;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Crovis', 'SRD', 'medio', 'macho', false, true, '2010-01-10', NULL
  FROM _tutor_map t WHERE t.idx = 137;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Floki', 'Shih Tzu', 'pequeno', 'macho', false, true, '2021-09-10', NULL
  FROM _tutor_map t WHERE t.idx = 138;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maitê', 'Shih Tzu', 'pequeno', 'femea', false, true, '2024-10-18', NULL
  FROM _tutor_map t WHERE t.idx = 139;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ayra', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, 'Nunca tosar (só prender bem a franja).'
  FROM _tutor_map t WHERE t.idx = 140;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ralph', 'Shih Tzu', NULL, 'macho', true, true, '2018-10-06', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 141;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bel', 'Shih Tzu', NULL, 'femea', true, true, '2015-08-15', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 142;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna Bewiahn', 'SRD', NULL, 'femea', false, true, '2019-08-29', NULL
  FROM _tutor_map t WHERE t.idx = 143;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zeus', 'American Bully', 'grande', 'macho', false, true, '2022-05-15', 'Alergia a picada de insetos.'
  FROM _tutor_map t WHERE t.idx = 144;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tulipa', 'Dachshund', 'pequeno', 'femea', false, true, '2011-11-06', NULL
  FROM _tutor_map t WHERE t.idx = 145;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Perola', 'SRD', 'pequeno', 'femea', false, true, '2024-11-28', NULL
  FROM _tutor_map t WHERE t.idx = 145;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zara', 'Dachshund', 'pequeno', 'femea', false, true, '2025-02-03', NULL
  FROM _tutor_map t WHERE t.idx = 146;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zayon', 'Golden Retriever', 'grande', 'macho', false, true, '2024-09-14', NULL
  FROM _tutor_map t WHERE t.idx = 147;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bento', 'Golden Retriever', 'grande', 'macho', false, true, NULL, 'Alergia de abelha.'
  FROM _tutor_map t WHERE t.idx = 148;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Poodle', 'pequeno', 'femea', true, true, '2011-04-11', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 149;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aurora', 'SRD', 'medio', 'femea', false, true, NULL, 'Resgatada; Em tratamento p/ Leish.'
  FROM _tutor_map t WHERE t.idx = 150;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Florentina', 'Bulldog Francês', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 151;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Shih Tzu', 'pequeno', 'femea', false, true, '2025-04-02', NULL
  FROM _tutor_map t WHERE t.idx = 152;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Piri', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 153;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 153;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'Pinscher', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 153;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Joca', 'Golden Retriever', NULL, 'macho', false, true, '2025-06-10', NULL
  FROM _tutor_map t WHERE t.idx = 154;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Flor', 'SRD', 'pequeno', 'femea', true, true, '2023-12-23', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 154;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Linda', 'Dachshund', 'pequeno', 'femea', true, true, '2012-06-20', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 155;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zara', 'Fox Paulistinha', 'pequeno', 'femea', false, true, '2024-12-26', NULL
  FROM _tutor_map t WHERE t.idx = 156;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Malfiti', 'Lhasa Apso', 'pequeno', 'macho', false, true, '2023-06-23', NULL
  FROM _tutor_map t WHERE t.idx = 157;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Olívia Peluda', 'Spitz', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 158;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Paçoca', 'Pug', 'pequeno', 'macho', false, true, '2025-02-18', NULL
  FROM _tutor_map t WHERE t.idx = 159;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Joca', 'Schnauzer', 'pequeno', 'macho', true, true, '2024-06-14', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 160;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zoe', 'Dachshund', 'pequeno', 'femea', false, true, '2025-11-24', NULL
  FROM _tutor_map t WHERE t.idx = 161;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pepo', 'Spitz', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 162;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luck', 'Spitz', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 162;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Spitz', NULL, 'femea', false, true, '2020-11-05', NULL
  FROM _tutor_map t WHERE t.idx = 162;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'SRD', 'pequeno', 'femea', true, true, '2013-02-07', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 163;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Miguel', 'Chihuahua', 'pequeno', 'macho', false, true, '2025-04-26', NULL
  FROM _tutor_map t WHERE t.idx = 163;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lunna', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2021-01-08', NULL
  FROM _tutor_map t WHERE t.idx = 164;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Piatã', 'SRD', 'grande', 'macho', true, true, '2024-01-14', 'Castrado; Medo de humanos.'
  FROM _tutor_map t WHERE t.idx = 165;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Lhasa Apso', 'pequeno', 'macho', false, true, '2014-09-15', 'Idoso, as vezes apresenta engasgos, desvio de traqueia; Está em tratamento oftalmológico ; Dermatite.'
  FROM _tutor_map t WHERE t.idx = 166;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lisa Frazão', 'Shih Tzu', 'pequeno', 'femea', false, true, '2025-06-26', NULL
  FROM _tutor_map t WHERE t.idx = 167;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maça', 'SRD', 'medio', 'femea', true, true, '2016-02-27', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 168;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Valentina', 'Lulu da Pomerânia', NULL, 'femea', false, true, '2023-03-30', NULL
  FROM _tutor_map t WHERE t.idx = 169;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Valentina', 'Lulu da Pomerânia', NULL, 'femea', false, true, '2023-03-30', NULL
  FROM _tutor_map t WHERE t.idx = 170;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, '2019-12-13', NULL
  FROM _tutor_map t WHERE t.idx = 171;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Layla', 'Pitbull', 'grande', 'femea', false, true, '2025-02-03', NULL
  FROM _tutor_map t WHERE t.idx = 172;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sushi', 'Welsh corgi pembroke', NULL, 'macho', false, true, '2024-12-05', NULL
  FROM _tutor_map t WHERE t.idx = 173;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Lhasa Apso', 'pequeno', 'macho', true, true, '2018-08-15', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 174;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ipa Maria', 'SRD', 'pequeno', 'femea', true, true, '2024-04-13', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 175;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Frederico (Fred)', 'Shih Tzu', 'pequeno', 'macho', true, true, '2022-10-12', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 176;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maju', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2025-04-12', NULL
  FROM _tutor_map t WHERE t.idx = 176;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Golden Retriever', 'grande', 'femea', false, true, '2023-11-15', 'ALERGIA A PROTEÍNA DE FRANGO.'
  FROM _tutor_map t WHERE t.idx = 177;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Lhasa Apso', 'pequeno', 'femea', true, true, '2018-08-08', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 177;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lola', 'SRD', NULL, 'femea', false, true, '2017-10-01', NULL
  FROM _tutor_map t WHERE t.idx = 178;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Leleca', 'SRD', NULL, 'femea', false, true, '2017-10-01', NULL
  FROM _tutor_map t WHERE t.idx = 178;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Athena Portela', 'SRD', 'medio', 'femea', false, true, '2019-04-09', NULL
  FROM _tutor_map t WHERE t.idx = 179;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Shih Tzu', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 180;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zaya', 'Border Collie', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 181;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Baruk', 'Staffordshire Bull Terrier', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 181;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Max', 'SRD', 'pequeno', 'macho', true, true, '2024-10-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 182;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pitchuka', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2013-09-10', NULL
  FROM _tutor_map t WHERE t.idx = 182;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pequeno', 'Pequinês', 'medio', 'macho', false, true, '2012-05-30', NULL
  FROM _tutor_map t WHERE t.idx = 183;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Muchacho', 'SRD', 'medio', 'macho', false, true, '2021-06-16', NULL
  FROM _tutor_map t WHERE t.idx = 184;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Madruguinha', 'SRD', 'medio', 'macho', false, true, '2021-06-16', NULL
  FROM _tutor_map t WHERE t.idx = 184;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 185;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Minduim', 'Dachshund', NULL, 'macho', true, true, NULL, 'Medo de chuva e trovão; Castrado.'
  FROM _tutor_map t WHERE t.idx = 186;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nego', 'Dachshund', NULL, 'macho', true, true, NULL, 'ALERGIA IMPORTANTE À INSETOS, ARANHAS E ABELHAS; Castrado.'
  FROM _tutor_map t WHERE t.idx = 186;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nico', 'Dachshund', NULL, 'macho', true, true, NULL, 'Medroso; Castrado.'
  FROM _tutor_map t WHERE t.idx = 186;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Teddy', 'SRD', NULL, 'macho', false, true, '2015-03-27', 'Poodle c/ Lhasa.'
  FROM _tutor_map t WHERE t.idx = 187;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cebolinha', 'Lhasa Apso', 'pequeno', 'macho', false, true, NULL, '7 anos.'
  FROM _tutor_map t WHERE t.idx = 188;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vick', 'SRD', 'pequeno', 'femea', true, true, '2024-06-11', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 189;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Candy', 'Beagle', 'medio', 'femea', true, true, '2020-05-09', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 190;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kyra', 'SRD', 'medio', 'femea', true, true, '2020-05-09', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 190;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Stanley', 'Husky Siberiano', 'grande', 'macho', true, true, '2014-10-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 191;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Margot', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 192;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Teodoro', 'Pug', 'pequeno', 'macho', false, true, '2025-01-07', NULL
  FROM _tutor_map t WHERE t.idx = 193;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Babi', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, '14 anos; Catarata e dermatite.'
  FROM _tutor_map t WHERE t.idx = 194;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Joe', 'Spitz', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 194;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Spayke', 'SRD', 'medio', 'macho', false, true, '2020-12-20', NULL
  FROM _tutor_map t WHERE t.idx = 195;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sofia', 'Poodle', 'pequeno', 'femea', false, true, NULL, 'Nascimento 2014.'
  FROM _tutor_map t WHERE t.idx = 196;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Teodoro', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 197;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Leide', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 197;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gustavo Lima', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 197;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Oliver', 'Persas', NULL, 'macho', false, true, '2023-12-29', NULL
  FROM _tutor_map t WHERE t.idx = 198;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Frajola', 'SRD', NULL, 'macho', true, true, '2023-12-25', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 199;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'SRD', NULL, 'femea', false, true, '2023-08-10', NULL
  FROM _tutor_map t WHERE t.idx = 199;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Alaska', 'Border Collie', NULL, 'femea', false, true, '2022-05-16', NULL
  FROM _tutor_map t WHERE t.idx = 200;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Benjamin', 'Yorkshire Terrier', 'pequeno', 'macho', false, true, '2025-04-14', NULL
  FROM _tutor_map t WHERE t.idx = 201;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chanel', 'SRD', 'pequeno', 'femea', true, true, '2015-02-10', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 202;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jorge', 'Shih Tzu', 'pequeno', 'macho', false, true, '2021-06-03', NULL
  FROM _tutor_map t WHERE t.idx = 203;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Rodolfo', 'Dachshund', 'pequeno', 'macho', false, true, '2024-04-05', NULL
  FROM _tutor_map t WHERE t.idx = 204;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Leopoldo', 'Dachshund', 'pequeno', 'macho', false, true, '2025-02-12', NULL
  FROM _tutor_map t WHERE t.idx = 204;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Juca', 'Pinscher', 'pequeno', 'macho', false, true, '2024-10-24', NULL
  FROM _tutor_map t WHERE t.idx = 205;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Princesa', 'SRD', 'pequeno', 'femea', false, true, NULL, '5 meses.'
  FROM _tutor_map t WHERE t.idx = 206;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pipoca', 'Fox Paulistinha', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 206;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tommy', 'SRD', 'medio', 'macho', false, true, '2022-06-17', NULL
  FROM _tutor_map t WHERE t.idx = 207;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bell', 'SRD', 'pequeno', 'femea', false, true, '2025-05-16', NULL
  FROM _tutor_map t WHERE t.idx = 207;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kiara', 'SRD', 'grande', 'femea', false, true, '2020-06-01', NULL
  FROM _tutor_map t WHERE t.idx = 208;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ninny', 'SRD', NULL, 'femea', false, true, '2025-05-13', NULL
  FROM _tutor_map t WHERE t.idx = 209;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Messi', 'Pinscher', 'pequeno', 'macho', true, true, '2010-07-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 210;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Boston terrier', 'pequeno', 'femea', true, true, '2019-08-14', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 211;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Shih Tzu', NULL, 'macho', true, true, NULL, '3 anos; Castrado'
  FROM _tutor_map t WHERE t.idx = 212;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Duck', 'SRD', 'grande', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 213;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'grande', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 214;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Maltês', 'pequeno', 'femea', true, true, NULL, 'Castrada; Alergia de pele.'
  FROM _tutor_map t WHERE t.idx = 215;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Barão', 'SRD', 'grande', 'macho', true, true, '2017-08-01', '7-8 anos; castrado'
  FROM _tutor_map t WHERE t.idx = 216;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Marley', 'Lhasa Apso', 'medio', 'macho', true, true, '2009-12-09', '15 anos; castrado'
  FROM _tutor_map t WHERE t.idx = 216;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'SRD', 'pequeno', 'femea', false, true, '2016-08-31', NULL
  FROM _tutor_map t WHERE t.idx = 216;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Levi', 'SRD', NULL, 'macho', true, true, '2021-05-13', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 217;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Laika', 'SRD', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 217;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gui', 'SRD', NULL, 'macho', false, true, '2024-10-10', NULL
  FROM _tutor_map t WHERE t.idx = 217;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Babu', 'Pug', 'pequeno', 'macho', false, true, '2024-06-04', 'Trauma em outra creche.'
  FROM _tutor_map t WHERE t.idx = 218;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kyara', 'Shih Tzu', 'pequeno', 'femea', false, true, '2024-09-25', NULL
  FROM _tutor_map t WHERE t.idx = 219;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kyara', 'SRD', 'pequeno', 'femea', false, true, '2024-09-25', NULL
  FROM _tutor_map t WHERE t.idx = 220;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Penélope (Pepe)', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 221;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pluto', 'SRD', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 221;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zarelda Teff', 'Bulldog Francês', 'pequeno', 'femea', false, true, '2024-12-18', NULL
  FROM _tutor_map t WHERE t.idx = 222;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Beily', 'Pastor Alemão', 'grande', 'macho', false, true, '2022-02-05', NULL
  FROM _tutor_map t WHERE t.idx = 223;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lattafa', 'SRD', 'grande', 'femea', false, true, '2025-05-10', NULL
  FROM _tutor_map t WHERE t.idx = 224;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kiki', 'Gato de pelo curto brasileiro', NULL, 'macho', false, true, '2020-09-19', NULL
  FROM _tutor_map t WHERE t.idx = 225;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Shih Tzu', 'pequeno', 'femea', false, true, '2022-01-03', NULL
  FROM _tutor_map t WHERE t.idx = 225;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lolla', 'SRD', 'pequeno', 'femea', true, true, '2025-01-01', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 226;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nick', 'Lhasa Apso', NULL, 'macho', false, true, '2017-08-01', NULL
  FROM _tutor_map t WHERE t.idx = 227;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha`', 'Spitz', 'pequeno', 'femea', false, true, '2020-11-05', NULL
  FROM _tutor_map t WHERE t.idx = 228;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mila', 'SRD', NULL, 'femea', true, true, '2024-02-01', 'Castrada; Alergia a amaciante.'
  FROM _tutor_map t WHERE t.idx = 229;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Melissa (Mel)', 'Golden Retriever', 'grande', 'femea', false, true, '2024-04-13', NULL
  FROM _tutor_map t WHERE t.idx = 230;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Apollo', 'Pinscher', 'pequeno', 'macho', true, true, '2020-12-05', 'Castrado; Toma vitamina no almoço e janta.'
  FROM _tutor_map t WHERE t.idx = 230;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vitorio', 'Pug', NULL, 'macho', false, true, NULL, '7 anos'
  FROM _tutor_map t WHERE t.idx = 231;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Castiel', 'Fox Paulistinha', 'medio', 'macho', true, true, '2020-04-30', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 232;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Moreno', 'SRD', 'medio', 'macho', true, true, '2023-02-21', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 232;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lagherta', 'SRD', 'medio', 'femea', true, true, '2021-10-23', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 232;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Dk', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, '+- 4 anos.'
  FROM _tutor_map t WHERE t.idx = 233;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zequinha', 'Yorkshire Terrier', 'pequeno', 'macho', false, true, '2024-07-05', 'Muito medroso, ja quebrou a patinha, tem sensibilidade nela.'
  FROM _tutor_map t WHERE t.idx = 234;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Revoada', 'American Bully', 'grande', 'macho', false, true, '2022-06-30', NULL
  FROM _tutor_map t WHERE t.idx = 235;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Poppy', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 235;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'pequeno', 'femea', true, true, '2013-12-20', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 236;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Poodle', 'pequeno', 'femea', false, true, '2019-02-02', NULL
  FROM _tutor_map t WHERE t.idx = 237;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Filó', 'Shih Tzu', 'pequeno', 'femea', false, true, '2025-06-14', NULL
  FROM _tutor_map t WHERE t.idx = 238;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Maltês', 'pequeno', 'femea', false, true, '2025-02-09', NULL
  FROM _tutor_map t WHERE t.idx = 239;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Dachshund', 'pequeno', 'macho', false, true, '2024-09-29', NULL
  FROM _tutor_map t WHERE t.idx = 240;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lila', 'Poodle', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 241;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 241;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lup', 'Shih Tzu', 'pequeno', 'macho', false, true, '2016-04-27', NULL
  FROM _tutor_map t WHERE t.idx = 242;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pipoca', 'Pug', NULL, 'macho', true, true, '2011-02-28', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 242;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'SRD', NULL, 'femea', true, true, '2013-08-22', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 242;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tody', 'Dachshund', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 243;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mini', 'Dachshund', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 243;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aycha', 'Shih Tzu', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 244;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 244;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zion', 'Dálmata', 'grande', 'macho', false, true, '2012-07-23', 'Gabapentina 2x/dia - Sarcopen 1 sachê dia sim, dia não - cenioximil 1cp/dia - condroplex 2x/dia'
  FROM _tutor_map t WHERE t.idx = 245;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Shih Tzu', 'pequeno', 'femea', false, true, '2013-04-28', NULL
  FROM _tutor_map t WHERE t.idx = 246;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Serena', 'SRD', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 247;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lola', 'Lulu da Pomerânia', 'pequeno', 'femea', false, true, '2021-03-07', NULL
  FROM _tutor_map t WHERE t.idx = 248;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Olívia', 'Persas', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 249;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ted', 'Spitz', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 250;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Charlotte', 'Schnauzer', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 251;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aurora', 'Schnauzer', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 251;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Theodoro', 'Shih Tzu', NULL, 'macho', false, true, NULL, '4-5 anos.'
  FROM _tutor_map t WHERE t.idx = 252;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Princesa', 'Lhasa Apso', NULL, 'femea', false, true, NULL, '5-6 anos'
  FROM _tutor_map t WHERE t.idx = 252;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Buena', 'Chihuahua', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 253;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maia', 'SRD', 'pequeno', 'femea', false, true, '2024-01-10', 'Alergia de abelha.'
  FROM _tutor_map t WHERE t.idx = 254;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cowboy', 'Golden Retriever', 'grande', 'macho', false, true, '2023-04-15', NULL
  FROM _tutor_map t WHERE t.idx = 255;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Alaska', 'West Highland White Terrier', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 256;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Saara', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 256;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bebela', 'Shih Tzu', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 257;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Golden Retriever', 'grande', 'femea', false, true, '2024-11-01', NULL
  FROM _tutor_map t WHERE t.idx = 258;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Beethoven', 'Shih Tzu', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 259;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zeus', 'Schnauzer', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 260;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Schnauzer', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 260;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Schnauzer', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 260;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, '5 anos.'
  FROM _tutor_map t WHERE t.idx = 261;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Duda', 'Shih Tzu', 'pequeno', 'femea', false, true, '2017-10-01', 'Alergia cutânea (coça muito e lambe as patas)'
  FROM _tutor_map t WHERE t.idx = 262;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Linguiça', 'SRD', 'pequeno', 'femea', false, true, '2023-07-01', NULL
  FROM _tutor_map t WHERE t.idx = 263;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Snoopy', 'Shih Tzu', NULL, 'macho', true, true, '2021-12-24', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 264;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Caju', 'Dachshund', 'pequeno', 'macho', false, true, '2024-08-29', NULL
  FROM _tutor_map t WHERE t.idx = 265;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'SRD', 'pequeno', 'femea', true, true, '2020-05-11', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 266;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ayrton Senna (Tom)', 'SRD', 'pequeno', 'macho', true, true, '2024-05-11', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 266;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Paçoca', 'Persas', NULL, 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 267;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jojo', 'Poodle', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 268;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Todynho', 'Lhasa Apso', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 268;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Angel', 'Chow-Chow', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 269;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 269;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Whisky', 'Shih Tzu', 'pequeno', 'macho', false, true, '2015-06-29', 'Medicação: Condroton 500mg - diário'
  FROM _tutor_map t WHERE t.idx = 270;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mabel', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, '2024-02-19', NULL
  FROM _tutor_map t WHERE t.idx = 271;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Buzz', 'Spitz', 'pequeno', 'macho', true, true, '2019-06-10', 'Castrado. Histórico de alergia na pele e início de alopecia. Por favor, sempre secar bem e escovar para evitar alergia e nós. No caso da tosa higiênica, seguir recomendação da raça, com uso de tesoura e eliminação mínima de pelos.'
  FROM _tutor_map t WHERE t.idx = 272;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bella', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 273;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 273;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Shizui Sato', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2019-04-08', NULL
  FROM _tutor_map t WHERE t.idx = 274;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Obito Sato', 'Yorkshire Terrier', 'pequeno', 'macho', true, true, '2019-04-22', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 274;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Poodle', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 275;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Dachshund', NULL, 'femea', false, true, '2024-08-15', NULL
  FROM _tutor_map t WHERE t.idx = 276;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bud', 'Buldog FrancêsOFF', 'medio', 'macho', true, true, '2014-09-15', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 276;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lara', 'SRD', 'pequeno', 'femea', true, true, '2012-09-24', 'Castrada; Faz uso de Alopurinol; Alergia atípica.'
  FROM _tutor_map t WHERE t.idx = 277;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Billy', 'Shih Tzu', NULL, 'macho', false, true, NULL, '5 anos'
  FROM _tutor_map t WHERE t.idx = 278;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maria Flor', 'Pug', 'pequeno', 'femea', false, true, '2021-04-17', NULL
  FROM _tutor_map t WHERE t.idx = 279;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Miúdo', 'SRD', 'pequeno', 'macho', false, true, '2015-02-08', 'Poodle c/ SRD.'
  FROM _tutor_map t WHERE t.idx = 280;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lolla', 'Yorkshire Terrier', 'pequeno', 'femea', true, true, '2018-04-20', 'Castrada; ALERGICA À CARNE BOVINA.'
  FROM _tutor_map t WHERE t.idx = 281;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Renesmee', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 282;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jorge', 'Bulldog Francês', NULL, 'macho', true, true, '2023-12-20', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 283;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bento', 'SRD', 'pequeno', 'macho', true, true, '2024-06-29', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 284;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Spirit', 'Shih Tzu', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 285;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lola Maria', 'SRD', NULL, 'femea', true, true, '2020-10-29', 'Castrada; Luxação coxofemoral, a patela do joelho esquerdo sai de lugar; Uso de pregabalina.'
  FROM _tutor_map t WHERE t.idx = 286;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luli Maria', 'SRD', NULL, 'femea', true, true, '2020-10-29', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 286;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Romeu', 'Shih Tzu', 'pequeno', 'macho', false, true, '2023-10-22', NULL
  FROM _tutor_map t WHERE t.idx = 287;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Macarena', 'Shih Tzu', 'pequeno', 'femea', false, true, '2024-09-26', NULL
  FROM _tutor_map t WHERE t.idx = 287;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mirana', 'SRD', 'grande', 'femea', true, true, '2021-10-20', 'Castrada; Medo de chuva e fogos e não gosta de ficar confinada em pequenos espaços, como gaiola, fica agressiva se confinada.'
  FROM _tutor_map t WHERE t.idx = 288;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Beethoven', 'Shih Tzu', 'pequeno', 'macho', false, true, '2022-01-25', NULL
  FROM _tutor_map t WHERE t.idx = 289;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maria', 'Pinscher', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 289;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Minnie', 'Pinscher', 'pequeno', 'femea', false, true, '2020-05-21', 'Agressiva'
  FROM _tutor_map t WHERE t.idx = 290;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lobinho (Binho)', 'Poodle', 'pequeno', 'macho', true, true, '2018-11-12', 'Castrado; Alergia a formiga e ração com corante.'
  FROM _tutor_map t WHERE t.idx = 291;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chica', 'Pug', NULL, 'femea', false, true, NULL, '6 anos;'
  FROM _tutor_map t WHERE t.idx = 292;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Apollo', 'Shih Tzu', 'pequeno', 'macho', false, true, '2021-08-07', NULL
  FROM _tutor_map t WHERE t.idx = 293;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Shayenne', 'SRD', 'pequeno', 'femea', false, true, '2022-08-09', 'Alergia à abelha!'
  FROM _tutor_map t WHERE t.idx = 294;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tobias', 'Spitz', 'pequeno', 'macho', true, true, '2018-02-23', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 295;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maia', 'Border Collie', 'grande', 'femea', true, true, '2021-04-15', 'Castrada; Usa Alopurinol.'
  FROM _tutor_map t WHERE t.idx = 296;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thipa', 'Yorkshire Terrier', 'pequeno', 'macho', true, true, '2015-10-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 297;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'Yorkshire Terrier', 'pequeno', 'macho', true, true, '2017-12-23', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 297;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zico', 'Lhasa Apso', 'pequeno', 'macho', true, true, '2020-11-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 297;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ozzy', 'Boiadeiro-australiano', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 298;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Balto', 'Boiadeiro-australiano', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 298;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bolinha', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, '4 anos.'
  FROM _tutor_map t WHERE t.idx = 299;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bento', 'Golden Retriever', NULL, 'macho', false, true, '2025-08-29', NULL
  FROM _tutor_map t WHERE t.idx = 300;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'George', 'Shih Tzu', NULL, 'macho', false, true, '2023-08-01', NULL
  FROM _tutor_map t WHERE t.idx = 301;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2020-06-02', NULL
  FROM _tutor_map t WHERE t.idx = 302;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vina', 'Dachshund', 'pequeno', 'femea', false, true, '2025-10-10', NULL
  FROM _tutor_map t WHERE t.idx = 303;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Felipe', 'Persas', NULL, 'macho', false, true, '2025-02-20', NULL
  FROM _tutor_map t WHERE t.idx = 304;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maju', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 305;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 305;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kira', 'Shiba inu', 'pequeno', 'femea', false, true, '2022-01-03', NULL
  FROM _tutor_map t WHERE t.idx = 306;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Billy', 'Labrador Retriever', 'grande', 'macho', false, true, '2024-08-03', NULL
  FROM _tutor_map t WHERE t.idx = 307;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bento', 'Poodle', NULL, 'macho', false, true, '2014-11-01', NULL
  FROM _tutor_map t WHERE t.idx = 308;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lua', 'SRD', 'pequeno', 'femea', false, true, '2020-01-15', NULL
  FROM _tutor_map t WHERE t.idx = 308;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Oliver', 'Lhasa Apso', 'pequeno', 'macho', false, true, '2018-07-25', NULL
  FROM _tutor_map t WHERE t.idx = 309;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thanos', 'Shih Tzu', 'pequeno', 'macho', false, true, '2018-04-21', NULL
  FROM _tutor_map t WHERE t.idx = 310;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Vinícius Junior', 'Dachshund', 'pequeno', 'macho', false, true, '2025-04-04', NULL
  FROM _tutor_map t WHERE t.idx = 311;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maria Júlia (Maju)', 'SRD', 'pequeno', 'femea', false, true, '2023-09-23', NULL
  FROM _tutor_map t WHERE t.idx = 312;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cora', 'Shih Tzu', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 313;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Romeo', 'Shih Tzu', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 313;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Lulu da Pomerânia', 'pequeno', 'femea', true, true, '2021-01-21', 'Castrada; Alergia à perfume; Tosa higiênica na tesoura.'
  FROM _tutor_map t WHERE t.idx = 314;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Lhasa Apso', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 315;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bart', 'Lhasa Apso', NULL, 'macho', false, true, '2015-07-03', NULL
  FROM _tutor_map t WHERE t.idx = 316;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Lhasa Apso', NULL, 'femea', false, true, '2016-04-06', NULL
  FROM _tutor_map t WHERE t.idx = 316;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Max', 'Pitbull', 'grande', 'macho', false, true, '2020-01-31', 'Dermatite.'
  FROM _tutor_map t WHERE t.idx = 317;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Maitê', 'SRD', 'pequeno', 'femea', true, true, '2024-03-15', 'Castrada; Medrosa.'
  FROM _tutor_map t WHERE t.idx = 318;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jabuticaba', 'SRD', 'medio', 'femea', false, true, '2024-04-15', 'Alergia à coleira repelente.'
  FROM _tutor_map t WHERE t.idx = 319;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Charlote', 'Buldogue Ingles', 'grande', 'femea', true, true, '2017-05-06', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 320;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Rocks', 'SRD', 'grande', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 321;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Estopa', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 321;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lara', 'Golden Retriever', 'grande', 'femea', false, true, '2024-07-12', 'Alopurinol e Imuno TF.'
  FROM _tutor_map t WHERE t.idx = 322;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Theo', 'Spitz', 'pequeno', 'macho', false, true, '2022-08-31', NULL
  FROM _tutor_map t WHERE t.idx = 323;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luke', 'Spitz', 'pequeno', 'macho', false, true, '2022-08-31', NULL
  FROM _tutor_map t WHERE t.idx = 323;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Shih Tzu', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 324;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ivanna', 'Poodle', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 324;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cacau', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2022-07-12', NULL
  FROM _tutor_map t WHERE t.idx = 324;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cacau', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2022-07-12', NULL
  FROM _tutor_map t WHERE t.idx = 325;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Brayan', 'Rottweiler', 'grande', 'macho', false, true, '2023-06-12', NULL
  FROM _tutor_map t WHERE t.idx = 326;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'Border Collie', 'grande', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 327;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Dona', 'Border Collie', 'grande', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 327;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Djorge', 'Border Collie', 'grande', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 327;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ze Perereca', 'Golden Retriever', 'grande', 'macho', false, true, '2017-11-19', NULL
  FROM _tutor_map t WHERE t.idx = 328;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Snow', 'SRD', NULL, 'femea', true, true, '2017-10-11', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 328;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Estrelinha', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2016-12-08', NULL
  FROM _tutor_map t WHERE t.idx = 329;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pretinha', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 329;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pequena', 'SRD', NULL, 'femea', false, true, NULL, '9 anos.'
  FROM _tutor_map t WHERE t.idx = 330;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'SRD', 'medio', 'macho', false, true, '2017-02-17', NULL
  FROM _tutor_map t WHERE t.idx = 331;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Shih Tzu', 'pequeno', 'femea', false, true, '2023-05-09', NULL
  FROM _tutor_map t WHERE t.idx = 332;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bolinha', 'Poodle', 'pequeno', 'macho', false, true, '2015-12-12', 'Alergia de pele (?); Não gosta de ficar sozinho.'
  FROM _tutor_map t WHERE t.idx = 333;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Dante', 'Boiadeiro-australiano', 'grande', 'macho', true, true, '2016-07-20', 'Castrado; Alergia de pele.'
  FROM _tutor_map t WHERE t.idx = 334;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Catarina', 'Yorkshire Terrier', 'pequeno', 'femea', true, true, '2023-10-26', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 335;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Harley', 'SRD', 'medio', 'macho', false, true, '2022-12-08', NULL
  FROM _tutor_map t WHERE t.idx = 336;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Fredinho', 'SRD', 'pequeno', 'macho', false, true, '2023-03-01', 'Resgatado (tem mais ou menos 7 anos)'
  FROM _tutor_map t WHERE t.idx = 336;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Panqueca', 'Dachshund', 'pequeno', 'femea', true, true, '2024-03-31', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 337;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kiko', 'SRD', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 338;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Neguinha', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 338;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mike', 'Spitz', 'pequeno', 'macho', false, true, '2023-04-13', NULL
  FROM _tutor_map t WHERE t.idx = 338;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'pequeno', 'femea', false, true, NULL, 'Resgate.'
  FROM _tutor_map t WHERE t.idx = 339;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sophia', 'SRD', 'pequeno', 'femea', false, true, NULL, 'Resgate.'
  FROM _tutor_map t WHERE t.idx = 339;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lipe', 'SRD', 'pequeno', 'macho', true, true, NULL, 'Castrado; Resgate.'
  FROM _tutor_map t WHERE t.idx = 339;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Saymom', 'Shih Tzu', NULL, 'macho', false, true, NULL, '10 anos.'
  FROM _tutor_map t WHERE t.idx = 339;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Princesa', 'SRD', NULL, 'femea', false, true, '2020-04-01', NULL
  FROM _tutor_map t WHERE t.idx = 340;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tequila', 'Boxer', NULL, 'femea', false, true, '2020-02-20', NULL
  FROM _tutor_map t WHERE t.idx = 341;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Cacau', 'Shih Tzu', NULL, 'femea', false, true, '2025-02-28', NULL
  FROM _tutor_map t WHERE t.idx = 342;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Duke', 'Spitz', 'pequeno', 'macho', true, true, '2017-10-18', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 343;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'Shih Tzu', 'pequeno', 'femea', false, true, '2020-12-28', NULL
  FROM _tutor_map t WHERE t.idx = 344;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Pastor Alemão', 'grande', 'macho', false, true, '2015-01-04', NULL
  FROM _tutor_map t WHERE t.idx = 345;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lucky', 'Shih Tzu', NULL, 'macho', false, true, '2013-10-15', NULL
  FROM _tutor_map t WHERE t.idx = 346;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Ursa', 'Border Collie', 'grande', 'femea', false, true, '2024-04-21', NULL
  FROM _tutor_map t WHERE t.idx = 347;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Guzzi', 'Shih Tzu', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 348;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tchuca', 'Lhasa Apso', 'pequeno', 'femea', false, true, NULL, '9 anos.'
  FROM _tutor_map t WHERE t.idx = 349;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jerry', 'SRD', 'medio', 'macho', true, true, '2013-03-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 350;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jack', 'Border Collie', 'grande', 'macho', false, true, '2015-10-15', NULL
  FROM _tutor_map t WHERE t.idx = 351;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chico', 'SRD', 'medio', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 351;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Luna', 'Shih Tzu', 'pequeno', 'femea', true, true, '2017-03-24', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 352;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Antônio', 'American Bully', NULL, 'macho', false, true, '2024-10-30', NULL
  FROM _tutor_map t WHERE t.idx = 353;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tião', 'SRD', 'pequeno', 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 354;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Abigail', 'Spitz', 'pequeno', 'femea', true, true, '2020-05-01', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 355;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Yuri', 'Golden Retriever', 'grande', 'macho', false, true, '2024-08-08', NULL
  FROM _tutor_map t WHERE t.idx = 356;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nala', 'Cocker spaniel americano', NULL, 'femea', true, true, '2014-04-10', 'Castrada; Cega.'
  FROM _tutor_map t WHERE t.idx = 357;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bella', 'Pastor Suiço', 'grande', 'femea', false, true, '2024-08-18', NULL
  FROM _tutor_map t WHERE t.idx = 358;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Brisa', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 359;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Zeus', 'Border Collie', 'medio', 'macho', false, true, '2016-08-15', NULL
  FROM _tutor_map t WHERE t.idx = 360;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Princesa', 'Lhasa Apso', 'pequeno', 'femea', false, true, '2024-06-12', NULL
  FROM _tutor_map t WHERE t.idx = 361;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aurora', 'Golden Retriever', 'grande', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 362;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Aurora', 'Golden Retriever', 'grande', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 363;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Athena', 'SRD', 'pequeno', 'femea', true, true, '2023-08-19', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 364;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Lhasa Apso', 'pequeno', 'macho', false, true, '2020-10-10', NULL
  FROM _tutor_map t WHERE t.idx = 365;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lili', 'Yorkshire Terrier', 'pequeno', 'femea', false, true, '2018-05-19', NULL
  FROM _tutor_map t WHERE t.idx = 366;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Tufi', 'Spitz', 'pequeno', 'macho', true, true, '2012-08-12', 'Castrado; Toma Gaba e Condrix.'
  FROM _tutor_map t WHERE t.idx = 367;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pumba', 'Spitz', 'pequeno', 'macho', false, true, '2024-07-30', NULL
  FROM _tutor_map t WHERE t.idx = 367;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sol', 'Fox Paulistinha', 'pequeno', 'femea', false, true, '2024-04-07', NULL
  FROM _tutor_map t WHERE t.idx = 368;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pilintra', 'Chow-Chow', NULL, 'macho', true, true, '2023-09-10', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 369;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pituca', 'Poodle', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 370;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Jade', 'SRD', 'pequeno', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 370;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Floquinho', 'Shih Tzu', 'pequeno', 'macho', true, true, '2023-09-26', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 371;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Toddy', 'Dachshund', 'pequeno', 'macho', false, true, '2024-02-03', NULL
  FROM _tutor_map t WHERE t.idx = 372;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kaleo', 'Jack Russel Terrier', NULL, 'macho', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 373;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Biscoito', 'Shih Tzu', NULL, 'macho', true, true, '2015-12-20', 'Castrado. Passar pouca quantidade de perfume após o banho e na região do penis não raspar ele tem alergia'
  FROM _tutor_map t WHERE t.idx = 373;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lilica', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 374;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Renoir', 'Shih Tzu', 'pequeno', 'macho', true, true, NULL, 'Castrado; Alérgico a perfume e tosa na máquina; Tem problemas ortopédicos (não pode pular de altura) é braquicefalico e tem questões hepáticas.'
  FROM _tutor_map t WHERE t.idx = 375;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pretinha', 'SRD', 'pequeno', 'femea', false, true, '2024-05-09', NULL
  FROM _tutor_map t WHERE t.idx = 376;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Betina', 'Shih Tzu', 'pequeno', 'femea', false, true, '2022-04-04', NULL
  FROM _tutor_map t WHERE t.idx = 377;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Lili', 'Bulldog Francês', 'medio', 'femea', false, true, '2021-02-23', 'Alergia de agua sanitaria.'
  FROM _tutor_map t WHERE t.idx = 378;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Belinha', 'Beagle', 'medio', 'femea', false, true, '2018-11-17', NULL
  FROM _tutor_map t WHERE t.idx = 379;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pipoca', 'Fox Paulistinha', 'pequeno', 'femea', true, true, '2018-02-18', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 380;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Caneco', 'American Bully', 'medio', 'macho', false, true, '2019-06-10', 'Dermatite; Medicações Omega 3, Demotrat spray.'
  FROM _tutor_map t WHERE t.idx = 381;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Thor', 'Labrador Retriever', 'grande', 'macho', false, true, '2023-02-19', 'Medicação: calmante natural.'
  FROM _tutor_map t WHERE t.idx = 381;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'SRD', 'pequeno', 'femea', true, true, '2019-07-17', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 382;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Saturno', 'Siameses', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 383;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Fabinho', 'SRD', 'pequeno', 'macho', false, true, NULL, 'Alergia a formiga'
  FROM _tutor_map t WHERE t.idx = 384;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'King', 'Welsh corgi cardigan', 'medio', 'macho', true, true, '2019-10-08', 'Castrado; Alérgico à carne suína.'
  FROM _tutor_map t WHERE t.idx = 385;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Queen', 'Welsh corgi cardigan', 'medio', 'femea', true, true, '2020-03-25', 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 385;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bob', 'SRD', 'pequeno', 'macho', true, true, NULL, '2 anos e meio; Castrado.'
  FROM _tutor_map t WHERE t.idx = 386;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Meg', 'SRD', 'grande', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 387;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Sky', 'Lhasa Apso', NULL, 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 388;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Chanel', 'Spitz', 'pequeno', 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 389;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Max', 'SRD', NULL, 'macho', true, true, '2024-08-04', 'Castrado; Bravo.'
  FROM _tutor_map t WHERE t.idx = 390;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nina', 'SRD', 'medio', 'femea', false, true, '2014-02-01', NULL
  FROM _tutor_map t WHERE t.idx = 391;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Gohan', 'Shiba inu', NULL, 'macho', false, true, '2022-12-12', NULL
  FROM _tutor_map t WHERE t.idx = 392;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pipoca', 'SRD', 'pequeno', 'femea', true, true, '2013-04-02', 'Castrada; Medicações: Alupurinol e outros.'
  FROM _tutor_map t WHERE t.idx = 393;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Amora', 'Poodle', 'pequeno', 'femea', false, true, '2018-08-06', NULL
  FROM _tutor_map t WHERE t.idx = 393;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Fantasma', 'Pastor Belga', 'grande', 'macho', true, true, '2024-11-02', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 394;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Bidu', 'Shih Tzu', NULL, 'macho', true, true, '2023-03-07', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 395;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mia', 'Shih Tzu', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 396;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mel', 'Shih Tzu', NULL, 'femea', true, true, NULL, 'Castrada.'
  FROM _tutor_map t WHERE t.idx = 396;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Mione', 'Schnauzer', 'pequeno', 'femea', false, true, NULL, 'Megaesôfago.'
  FROM _tutor_map t WHERE t.idx = 397;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Miguel', 'Boiadeiro-australiano', 'grande', 'macho', true, true, '2013-05-30', 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 398;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pingo', 'Shih Tzu', 'pequeno', 'macho', true, true, NULL, 'Castrado.'
  FROM _tutor_map t WHERE t.idx = 399;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Pantera', 'Rottweiler', 'grande', 'femea', false, true, '2020-11-25', NULL
  FROM _tutor_map t WHERE t.idx = 400;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Apollo', 'SRD', 'medio', 'macho', false, true, '2023-05-01', NULL
  FROM _tutor_map t WHERE t.idx = 401;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nick', 'Chihuahua', 'pequeno', 'macho', false, true, '2024-09-27', NULL
  FROM _tutor_map t WHERE t.idx = 402;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Josefina', 'SRD', 'pequeno', 'femea', false, true, '2025-08-18', NULL
  FROM _tutor_map t WHERE t.idx = 403;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Carmem Lúcia', 'SRD', 'pequeno', 'femea', false, true, '2025-08-18', NULL
  FROM _tutor_map t WHERE t.idx = 403;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Kira', 'SRD', 'medio', 'femea', false, true, NULL, NULL
  FROM _tutor_map t WHERE t.idx = 404;

INSERT INTO pets (tutor_id, nome, raca, porte, sexo, castrado, vacinas_ok, nascimento, observacoes)
  SELECT t.tutor_uuid, 'Nikita', 'SRD', NULL, 'femea', false, true, NULL, '15 anos.'
  FROM _tutor_map t WHERE t.idx = 405;

COMMIT;