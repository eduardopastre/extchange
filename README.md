![alt text](https://raw.githubusercontent.com/eduardopastre/exchange/master/public/logo.png)

# APP EXCHANGE

Projeto web que permite facilmente a conversão de valores entre moedas do mundo todo, usando a API http://fixer.io/

Disponível em https://ep-exchange.herokuapp.com/

## Pré-requisitos

* Ruby version - 2.3.6
* Rails version - 5.0.6
* Banco de dados - Postgres

## Instalando

* Clonando o projeto do Git
```
git clone https://github.com/eduardopastre/exchange.git
```

* Configurando o banco de dados
  * caso necessário edite o arquivo config/database.yml com suas permissões do banco de dados
  * execute o sguinte comando para criar o banco de dados
```
bundle exec rake db:create
```

* Rodando o projeto
```
rails s
```
Acesse http://localhost:3000 para ver o projeto em execução

## Executando os teste

Os testes foram escritos usando RSpec, para rodar os testes execute
```
rspec spec
```
