Aplicacao NODE.JS + POSTGRES + NGINX

### DOCKER CONTAINER

<blockquote>
<ul>
<li>docker pull image                                           // baixa a imagem</li>
<li>docker pull image:version                                   // baixa a imagem informado a versao. (stable)</li>
<li>docker container run -p 8080:80 image                       // sobe o container</li>
<li>docker container run -p 8080:80 -d --name name image        // sobe o container em detach (backgroud)</li>
<li>docker cointainer ls                                        // lista os cointainers</li>
<li>docker container ls -a                                      // lista todos os containers que ja foram executados.</li>
<li>docker container start cc20cd2dca9d                         // inicia o container passando o id do container</li>
<li>docker container stop cc20cd2dca9d                          // para o container passando o id do container</li>
<li>docker container exec cc20cd2dca9d                          // entra no container passandoo id do container</li>
<li>docker container rm cc20cd2dca9d                            // exclui o container passando o id do container</li>
<li>docker container rename 53244e1d5375 new_name               // renomeia o container passando id e novo nome do container</li>
<li>docker container prune                                      // limpa todos os containers que ja foram iniciados.</li>
<li>docker image ls                                             // lista as imagens existentes</li>
<li>docker image history imageId                                // Verifica o historico da imagem</li>
<li>docker rmi imageid                                          // deleta a imagem passando id da imagem</li>
<li>docker container commit -m 'instalando nvm'                 // commita alteracoes da imagem</li>
<li>docker image tag imageId nome/minhaimage:latest</li>
<li>docker container run -v $(pwd):/root -P -p 8080:80 -d --name name idImage </li>
</ul>
</blockquote>

### DOCKERFILE
O Docker pode construir imagens automaticamente lendo as instrucoes do arquivo DockerFile.
O comando docker build cria uma imagem a partir de um Dockerfile
docker build "diretorio dockerfile"

Estrutura DockerFile
<ul>
<li>FROM imagem                                       // Informa qual a imagem "base" que o arquivo vai partir.
<li>LABEL version="1.0" || description="Oi"           // Adiciona Metadados a imagem
<li>RUN apt-get update                                // Executa um determinado comando dentro da imagem
<li>CMD ["executable","param1","param2"]              // Só pode haver um CMD em Dockerfile. (Executavel ou Especificar um ENTRYPOINT)
<li>ENV MY_NAME="LUIZ"                                // Defini uma variavel de ambiente
<li>ADD <src>... <dest>                               // Copia arquivos ou diretorio de arquivos remotos ao sistema de arquivos da imagem
<li>VOLUME /myvol                                     // cria um ponto de montagem
<li>WORKDIR /path/to/workdir                          // define o diretório de trabalho para quaisquer RUN, CMD, ENTRYPOINT, COPYe ADD
</ul>
mais
https://docs.docker.com/engine/reference/builder/#cmd

### Docker-compose
Arquivo responsável por subir as ap
<ul>
<li>docker-compose up                                                       // sobe o container</li>
<li>docker-compose up -d                                                    // sobe o container (detach)</li>
<li>docker-compose up --scale nameservico=5                                 // -- escala/replica uma determinada quantidade de containers</li>
<li>docker-compose down                                                     // para/desliga o container</li>
<li>docker-compose run -d -p 2222:22 -p 3091:3090 ...options nameservico    // sobe aplicacao com possibilidade de sob-escrever algumas opcoes</li>
<li>docker-compose build                                                    //procura a tag build no dockerfile e reconstroi a imagem.</li>
<li>docker-compose up --build                                               //procura a tag build no dockerfile e reconstroi a imagem e sobe a imagem</ul>
</ul>

### Docker-compose.yml
<ul>
<li>version: '3'                                     // versão do compose</li>
<li>services:                                           // serviços (containers)</li>
<li>  cloud9:                                           // nome do container</li>
<li>    build: .                                        // constroi uma imagem a partir do diretorio do dockerfile</li>
<li>    image: sapk/cloud9                              // nome da imagem</li>
<li>    depends_on:                                     // cria uma dependencia a outro servico / container</li>
<li>      -db                                           // servico / container</li>
<li>    volumes:                                        // config de volumes</li>
<li>      - .:/workspace                                // diretorio volume</li>
<li>    ports:                                          // config de portas</li>
<li>      - "8181:8181"                                 // portas</li>
<li>    command: -- auth username:password              // commando - executar </li>
</ul>
