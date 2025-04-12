# Etapa 1: Build do Angular
FROM node:22.14 as build

# Definindo diretório de trabalho
WORKDIR /app

# Copiar o package.json e o package-lock.json
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o código fonte
COPY . .

# Build do projeto Angular
RUN npm run build --prod

# Etapa 2: Servir o aplicativo
FROM nginx:alpine

# Copiar os arquivos de build do Angular para o Nginx
COPY --from=build /app/dist/ /usr/share/nginx/html

# Expor a porta padrão do Nginx
EXPOSE 80

# Iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
