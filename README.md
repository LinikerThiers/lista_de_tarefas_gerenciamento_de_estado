# 📝 Lista de Tarefas com Flutter + Back4App

Este projeto é uma aplicação Flutter que permite o gerenciamento de uma lista de tarefas, com backend hospedado no **Back4App** usando a REST API do Parse. O estado é gerenciado com o **Provider**.

## 📱 Funcionalidades

- ✅ Listar tarefas (todas ou apenas não concluídas)
- ➕ Adicionar novas tarefas
- ✏️ Atualizar o status de conclusão
- ❌ Remover tarefas com swipe
- ☁️ Integração completa com o backend Back4App
- 🌙 Interface leve, inspirada em design iOS

## 📂 Estrutura do Projeto

```
lib/
│
├── main.dart                     # Inicialização do app e carregamento do .env
├── my_app.dart                   # Configuração do MaterialApp com Provider
│
├── pages/
│   └── tarefas_page.dart         # Tela principal com a lista de tarefas
│
├── model/
│   └── back4app/
│       └── tarefas_back4app_model.dart  # Modelo de tarefa usado no Back4App
│
├── repositories/
│   ├── tarefa_store.dart         # Gerenciador de estado com Provider
│   └── back4app/
│       ├── tarefas_back4app_repository.dart # Acesso aos endpoints
│       ├── back4app_custom_dio.dart        # Configuração do Dio com baseURL
│       └── back4app_dio_interceptor.dart   # Headers com API keys e logging
```

## ⚙️ Tecnologias Utilizadas

- **Flutter** (Material3)
- **Provider** (gerenciamento de estado)
- **Dio** (requisições HTTP)
- **Back4App (Parse)** – como backend
- **DotEnv** – para gerenciar variáveis de ambiente
- **Google Fonts** – para estilização

## 🔐 Arquivo .env

Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```
BACK4APPBASEURL=https://parseapi.back4app.com/classes
BACK4APPAPLICATIONID=your-back4app-application-id
BACK4APPRESTAPIKEY=your-back4app-rest-api-key
```

## ▶️ Como Executar

1. **Clone o projeto:**

```
git clone https://github.com/seuusuario/nome-do-repositorio.git
cd nome-do-repositorio
```

2. **Instale as dependências:**

```
flutter pub get
```

3. **Configure seu `.env` com as credenciais do Back4App.**

4. **Rode o projeto:**

```
flutter run
```

## 📌 Observações

- O estado da lista é centralizado em `TarefaStore`, que expõe `tarefas`, `loading` e o filtro `apenasNaoConcluidos`.
- As tarefas são persistidas e sincronizadas com o backend através de requisições REST usando o `Dio`.
- É possível remover tarefas deslizando o item (`Dismissible`).
- O switch permite alternar a visualização entre todas as tarefas e apenas as não concluídas.

  
## 📸 Screenshots
<img src="https://github.com/user-attachments/assets/25673118-c9da-4b20-87f5-f0247671be5c" width=180>
<img src="https://github.com/user-attachments/assets/4564dc36-cc68-401e-af6f-0b25daacc25c" width=180>
<img src="https://github.com/user-attachments/assets/0c84d8cc-c783-40ce-8ccf-01dc35efefc7" width=180>
