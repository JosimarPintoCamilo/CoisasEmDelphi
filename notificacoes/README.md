# NotificacoesEmDelphi

### Resolvi criar esse projeto, pois percebi que os sistemas desktops não emitem aqueles balõezinhos como na web em resposta a alguma ação executada, por exemplo: Cadastrado com sucesso, Sem conexão,..., e tudo mais. Se quiser contribuir com esse projeto fique a vontade hehe.

<h3 align="center">
  <img alt="NotificacoesEmDelphi" title="NotificacoesEmDelphi" src="./resources/exemplo.png" />
</h3>

#### Requisitos:
- Não tem dependências, só o Delphi é suficiente para rodar o projeto, seja livre :)

#### Como utilizar:

Instancie uma fábrica de notificações:
```
FNotificacaoFactory: INotificacaoFactory;
FNotificacaoFactory := TNotificacaoFactory.New;
```

Crie a notificação que quiser :)

```
FNotificacaoFactory.Dark('Mensagem Dark');
``` 

``` 
FNotificacaoFactory.Informacao('Contribua com esse projeto!');
``` 

``` 
FNotificacaoFactory.Sucesso('Parabéns!');
``` 

``` 
FNotificacaoFactory.Warning('Tome cuidado.');
``` 

``` 
FNotificacaoFactory.Erro('Deu Erro!');
``` 

#### Se preferir personalise o seu balão utilizando a classe TNotificacao encadeando os métodos

```
TNotificacao.New.Mensagem(Mensagem).Icone(CODIGO_ICONE).Cor(CODIGO_COR).Exibir;
```

O código do ícone você vai pegar no site [Font Awesome](https://fontawesome.com/)<br/>
A cor é do tipo TColor como: COR_PRETO = $00121212;
