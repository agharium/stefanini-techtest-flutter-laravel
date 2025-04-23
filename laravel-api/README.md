# Laravel API – API de Usuários

API RESTful desenvolvida com Laravel 12 para gerenciar usuários (nome, e-mail e telefon).

## 🚀 Endpoints

- `GET /api/users` – Lista todos os usuários
- `POST /api/users` - Cria um usuário
- `GET /api/users/{id}` – Mostra detalhes de um usuário

## 🧱 Stack

- Laravel 12+
- PostgreSQL
- Docker / Docker Compose

## ⚙️ Setup com Docker

```bash
# Clonar o repositório (caso ainda não tenha feito)
git clone https://github.com/agharium/stefanini-techtest-flutter-laravel.git
cd stefanini-techtest-flutter-laravel/laravel-api

# Subir os containers
docker-compose up -d --build

# Instalar dependências
docker-compose exec app composer install

# Gerar chave da aplicação
docker-compose exec app php artisan key:generate

# Rodar as migrations e seeders
docker-compose exec app php artisan migrate --seed
```

## 🧑 Autor

Desenvolvido por [José Paulo](https://www.linkedin.com/in/jose-paulo-oliveira-filho/).
