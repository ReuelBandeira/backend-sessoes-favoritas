# Usar a imagem oficial do Node.js
FROM node:18

# Definir o diretório de trabalho no contêiner
WORKDIR /usr/src/app

# Copiar os arquivos de configuração primeiro para usar o cache do Docker
COPY package*.json ./

# Instalar as dependências
RUN yarn install

# Instalar o nodemon ou ts-node-dev para hot-reloading
RUN yarn add ts-node-dev -D

# Instalar Prisma CLI globalmente
RUN yarn add prisma -D


# Copiar o restante do código para o contêiner
COPY . .

# Expor a porta que o servidor irá usar
EXPOSE 3333

# Comando para rodar as migrations e iniciar o aplicativo
CMD ["sh", "-c", "yarn prisma migrate dev && yarn dev"]
