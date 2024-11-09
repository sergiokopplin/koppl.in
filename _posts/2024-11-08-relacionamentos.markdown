---
title: Relacionamento de Classes
layout: post
date: 2024-11-08
headerImage: false
tag:
    - padroes
star: false
category: blog
author: sergiokopplin
description: Relacionamento de Classes
---

# Relacionamentos

## Associação

A ClasseA **depende** da ClasseB.

Representada pela seta para a direita preenchida.

```js
class ClasseA {
    public function MetodoA () {
        const variavel = new ClasseB();
    }
}
```

## Generalização

A ClasseA **herda** a ClasseB.

A ClasseA é uma **subclasse** da ClasseB.

Representada pela seta para a direita não preenchida.

```js
class ClasseA extends ClasseB {}
```

## Realização

A ClasseA **implementa** a interface.

Representada pela seta para a direita com traços e não preenchida.

```js
class ClasseA implements Interface {}
```

## Agregação

O **Objeto** da ClasseB é **utilizado/faz parte** da Classe A.

A ClasseA não é fortemente ligada a ClasseB (podem existir separadamente)

Representada pelo losango para a esquerda e não preenchida.

```js
class ClasseA {
    public function metodo (classeB: ClasseB) {}
}
```

Exemplo: Um livro pode existir em uma estante. Um pode existir sem o outro.

## Composição

O **Objeto** da ClasseB é **utilizado/faz parte** da Classe A.

Quando a ClasseA deixar de existir a ClasseB também deixará de existir. Somente uma questão de semântica, pois a implementação não muda.
Representada pelo losango para a esquerda e preenchido.

```js
class ClasseA {
    public function metodo (classeB: ClasseB) {}
}
```

Exemplo: Uma prateleira não pode existir sem uma estante. Um não pode existir sem o outro.

## Injeção de Dependência (Composição)

A ClasseA não pode existir sem a criação de uma instância da ClasseB anteriormente.

Representada pelo losango para a esquerda e preenchido.

```js
class ClasseA {
    constructor (classeB: ClasseB) {}
}
```
