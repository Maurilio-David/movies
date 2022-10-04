# Movies

Projeto desenvolvido com Flutter.

Foi usado Getx para gerenciamento de dependência e de estado.

Pacotes utilizados: get, google_fonts, dio, intl e data_connection_checker_nulls


## Tela Inicial

Ao inicializar, o aplicativo verifica a conexão com a internet e caso conectado irá fazer as requisições dos filmes mais populares dos gêneros de ação, aventura, fantasia e comédia. Em caso de falta de conexão o aplicativo exibirá uma mensagem informando a falta de conexão e um botão para tentar novamente.

O usuário pode buscar um filme específico através do campo de texto no topo da tela, caso encontre filmes relacionado a busca, irá exibir a lista de filmes, caso não encontre o app irá informar que nenhum filme foi encontrado.

Todos os filmes são exbidos em cards com a imagem de capa do filme preenchida ao fundo do card. 

## Tela de Detalhes
Quando o usuário clicar sobre o card será levado para a tela de detalhes do filme onde encontrará informações mais detalhas do filme(Quando disponível). 
Avaliação, Titulo em portugês, Titulo Original, Ano, Duração, Gêneros, Descrição, Orçamento, Produtoras, Diretores e Elenco.


