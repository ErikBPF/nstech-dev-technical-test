# nstech-dev-technical-test

## Seja muito bem vindo!

Esse desafio busca testar seus conhecimentos em SQL e em ferramentas de conteinerização. Para concluí-lo você precisarará levantar um contêiner de banco de acordo com o arquivo na pasta **/src**, criar tabelas, alimentá-las e executar querys de análise.

## Estudo de caso
Você é um analista da CBF e precisa criar análises que ajudem a entender a performance dos times de jogadores no Campeonato Brasileiro. Você precisará providenciar 3 relatórios:

### 1. Resumo das partidas, contendo:
- Id da partida
- Rodada
- Data da partida
- Hora da Partida
- Dia da Semana
- Clube mandante
- Clube visitante
- Quantidade de gols do clube mandante
- Quantidade de gols do clube visitante
- Quantidade de gols totais
- Quantidade de cartões recebidos pelo clube mandante
- Quantidade de cartões recebidos pelo clube visitante
- Quantidade de cartões recebidos totais

### 2. Maiores artilheiros, contendo em ordem decrescente:
- Nome do Jogador
- Time do Jogador
- Quantidade de gols marcados pelo jogador

### 3. Maiores marcadores de falta, contendo em ordem decrescente:
- Nome do Jogador
- Time do Jogador
- Quantidade de cartões recebidos pelo jogador

Os relatórios devem ser apresentados em formato de Query SQL e devem ser salvos na pasta **/querys**.

## Passos de execução

### 1. Levantar infra
Para isso será necessário ter **Docker** e **Docker-Compose** instalados em sua máquina. Você pode recorrer às [documentações oficiais](https://docs.docker.com/) para realização desse passo.

Feitas as instalações, basta entrar na pasta **/src** e executar em seu terminal o comando:
```cmd
docker-compose up
```
Se nenhum erro tiver aparecido, você terá levantado um banco de dados com as seguintes informações de acesso:
- **Ip**: localhost:15432
- **Usuário**: postgres
- **Senha**: postgres-test

Caso esse terminal seja fechado o banco irá parar de funcionar.

### 2. Criação das tabelas
Com o DBMS da sua preferencia, acesse o banco criado na etapa anterior e crie as tabelas **partidas**, **gols** e **cartoes** de acordo com os arquivos da pasta **/data**. 

### 3. Alimentação das tabelas
Depois de criar as tabelas, será necessário alimentá-las com o conteúdo dos CSVs correspondentes. Desenvolva uma classe que carregue esses dados e coloque-a no arquivo **data-loader.py** na pasta **/src**. Caso seja necessária a instalação de alguma lib, preencha-a no arquivo **requirements.txt**.

### 4. Criação dos relatórios
Agora com as tabelas criadas monte querys que permitam responder os pontos necessários nos relatórios pedidos pelo estudo de caso e substitua o conteúdo dos arquivos na pasta **/querys** com suas respectivas consultas.


##
O resultado deve ser entregue em forma de uma nova branch no repositório disponibilizado pela pessoa responsável pelo seu processo seletivo. Quando concluir, envie um PR no repositório e informe a pessoa responsável. Não serão aceitos PR ou commits na branch realizados após o prazo limite
## Contato
Em caso de dúvidas ou dificuldades, basta entrar em contato com a pessoa responsável pelo seu processo seletivo. Em caso de necessidade, algum membro do time de engenharia será alocado para te ajudar.