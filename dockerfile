FROM node:22.14-alpine

WORKDIR /app

# Primeiro copia os arquivos de configuração
COPY package.json package-lock.json* ./

# Instala as dependências
RUN npm install -g @angular/cli && \
    npm install

# Copia o restante dos arquivos
COPY . .

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0", "--disable-host-check"]