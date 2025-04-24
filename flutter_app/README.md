# Flutter App – Gerenciador de Usuários

Aplicativo Flutter que consome a API Laravel para listar e visualizar detalhes de usuários.

## 💡 Funcionalidades

- 📋 Listagem de usuários
- ➕ Cadastro de novo usuário
- 🔍 Visualização de detalhes

## 🧱 Stack

- Flutter 3+
- Provider (gerenciamento de estado)
- Integração via HTTP com Laravel API

## ▶️ Executar

```bash
# Entrar na pasta do app
cd flutter-app

# Instalar dependências
flutter pub get

# Rodar o app (emulador ou dispositivo)
flutter run
```

## 🚀 Rodar o projeto com Docker

```bash
# Construa a imagem docker
docker-compose build

# Suba o container
docker-compose up -d

# Acesse pelo navegador
http://127.0.0.1:9000
```

### Nota

Por questão de praticidade, o projeto Docker está configurado para implementar o projeto web do app, mas o app também vai funcionar normalmente quando implantado em Android/iOS.

## 📸 Telas

#### Listagem de usuários

<img src="https://github.com/user-attachments/assets/d7681744-4925-40be-ada6-5df0f22ed614" width="300"/>

#### Formulário de cadastro

<img src="https://github.com/user-attachments/assets/9763e4a0-0cc6-4c15-90f6-e1f5b8bfc2bf" width="300"/>
<img src="https://github.com/user-attachments/assets/50abbeb7-696d-47c5-b66d-d252fa144baf" width="300"/>

#### Tela de detalhes

<img src="https://github.com/user-attachments/assets/d379b0a8-a591-46b1-ae6b-307fc8c7cdd3" width="300"/>

## 🧑 Autor

Desenvolvido por [José Paulo](https://www.linkedin.com/in/jose-paulo-oliveira-filho/).
