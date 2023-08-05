# Primeiros passos Eml

## Instalar as dependências

```shell
yarn global add elm@latest \
                elm-format@latest \
                elm-land@latest
```

+ Instlar a extensão Elm Lang no VS Code

## Criando um projeto

```shell
elm-land init nomeDoProjeto
cd nomeDoProjeto
```
nomeDoProjeto/
  |- elm.json           # 🌐 Elm's `package.json` file
  |- elm-land.json      # 🌈 Elm Land configuration
  |- src/
     |- Pages/
        |- Home_.elm    # 🏡 The homepage for our app

## Executando o server

```shell
elm-land server
```

## Adicionando Página

Para adiciona uma página que é exibida quando um usuário visita a URL: `/sign-in`
```shell
elm-land add page:view /sign-in
```
Aqui está o código gerado em: `/usr/Pages/Sing-in.elm`
Acessível em http://localhost:1234/sign-in

### Rotas Aninhadas

Para adicionar rotas Aninhadas, tais como:
`/settings/account`

```shell
elm-land add page:view /settings/account
```
Aqui está o código gerado em: `/usr/Pages/Settings/Account.elm`

### Rotas Dinamicas

Para fazer uma rota dinâmica que utilize o nome do usuário como parte da rota
por exemplo, /carlos

```shell
elm-land add page:view /:user
```

