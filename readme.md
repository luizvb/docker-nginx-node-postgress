utilizamos as imagens:
    sapk/cloud9 - Cloud9
    rastasheep/ubuntu-sshd - SSH UBUNTU
    https://github.com/nvm-sh/nvm - NVM

--------------------------------------- DOCKER CONTAINER -----------------------------------
docker pull image                                           // baixa a imagem
docker pull image:version                                   // baixa a imagem informado a versao. (stable)
docker container run -p 8080:80 image                       // sobe o container
docker container run -p 8080:80 -d --name name image        // sobe o container em detach (backgroud)
docker cointainer ls                                        // lista os cointainers
docker container ls -a                                      // lista todos os containers que ja foram executados.
docker container start cc20cd2dca9d                         // inicia o container passando o id do container
docker container stop cc20cd2dca9d                          // para o container passando o id do container
docker container exec cc20cd2dca9d                          // entra no container passandoo id do container
docker container rm cc20cd2dca9d                            // exclui o container passando o id do container
docker container rename 53244e1d5375 new_name               // renomeia o container passando id e novo nome do container
docker container prune                                      // limpa todos os containers que ja foram iniciados.
docker image ls                                             // lista as imagens existentes
docker image history imageId                                // Verifica o historico da imagem
docker rmi imageid                                          // deleta a imagem passando id da imagem
docker container commit -m 'instalando nvm'                 // commita alteracoes da imagem
docker image tag imageId nome/minhaimage:latest
docker container run -v $(pwd):/root -P -p 8080:80 -d --name name idImage 

--------------------------------------- DOCKERFILE -----------------------------------
O Docker pode construir imagens automaticamente lendo as instrucoes do arquivo DockerFile.
O comando docker build cria uma imagem a partir de um Dockerfile
docker build "diretorio dockerfile"

Estrutura DockerFile

FROM imagem                                       // Informa qual a imagem "base" que o arquivo vai partir.
LABEL version="1.0" || description="Oi"           // Adiciona Metadados a imagem
RUN apt-get update                                // Executa um determinado comando dentro da imagem
CMD ["executable","param1","param2"]              // Só pode haver um CMD em Dockerfile. (Executavel ou Especificar um ENTRYPOINT)
ENV MY_NAME="LUIZ"                                // Defini uma variavel de ambiente
ADD <src>... <dest>                               // Copia arquivos ou diretorio de arquivos remotos ao sistema de arquivos da imagem
VOLUME /myvol                                     // cria um ponto de montagem
WORKDIR /path/to/workdir                          // define o diretório de trabalho para quaisquer RUN, CMD, ENTRYPOINT, COPYe ADD

mais
https://docs.docker.com/engine/reference/builder/#cmd

--------------------------------------- DOCKER-COMPOSE -----------------------------------
Arquivo responsável por subir as ap
docker-compose up                                                       // sobe o container
docker-compose up -d                                                    // sobe o container (detach)
docker-compose up --scale nameservico=5                                 // -- escala/replica uma determinada quantidade de containers
docker-compose down                                                     // para/desliga o container
docker-compose run -d -p 2222:22 -p 3091:3090 ...options nameservico    // sobe aplicacao com possibilidade de sob-escrever algumas opcoes

docker-compose build                                                    //procura a tag build no dockerfile e reconstroi a imagem.
docker-compose up --build                                               //procura a tag build no dockerfile e reconstroi a imagem e sobe a imagem

// estrutura docker-compose.yml
version: '3'                                        // versão do compose
services:                                           // serviços (containers)
  cloud9:                                           // nome do container
    build: .                                        // constroi uma imagem a partir do diretorio do dockerfile
    image: sapk/cloud9                              // nome da imagem
    depends_on:                                     // cria uma dependencia a outro servico / container
      -db                                           // servico / container
    volumes:                                        // config de volumes
      - .:/workspace                                // diretorio volume
    ports:                                          // config de portas
      - "8181:8181"                                 // portas
    command: -- auth username:password              // commando - executar 
