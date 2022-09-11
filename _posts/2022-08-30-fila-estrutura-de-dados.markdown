---
title: ":keyboard: Estrutura de Dados - Fila"
layout: post
date: 2022-08-30
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Fila
---

## Descrição

Uma fila é uma coleção ordenada de itens baseada em FIFO (First In First Out), também conhecido como first-come first-served. Novos elementos são adicionados na cauda e a remoção na frente. O elemento mais recente na fila deve esperar no final dela.

> Um Exemplo de fila na vida real é a típica fila que se forma ocasionalmente nos bancos.

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Fila

```ts
class Queue {
  public items: { [key: number]: number | string };
  private count: number;
  private lowestCount: number;

  constructor() {
    this.count = 0;
    this.lowestCount = 0;
    this.items = {};
  }

  enqueue(element: number | string) {
    this.items[this.count] = element;
    this.count++;
  }

  dequeue() {
    if (this.isEmpty()) {
      return undefined;
    }

    const value = this.items[this.lowestCount];
    delete this.items[this.lowestCount];

    this.lowestCount++;

    return value;
  }

  peek() {
    if (this.isEmpty()) {
      return undefined;
    }

    return this.items[this.lowestCount];
  }

  isEmpty() {
    return this.size() === 0;
  }

  size() {
    return this.count - this.lowestCount;
  }

  clear() {
    this.items = {};
    this.count = 0;
    this.lowestCount = 0;
  }

  toString() {
    if (this.isEmpty()) {
      return '';
    }

    let objString = `${this.items[this.lowestCount]}`;

    for (let i = this.lowestCount + 1; i < this.count; i++) {
      objString = `${objString},${this.items[i]}`;
    }

    return objString;
  }
}
```

## Exercícios

### Batata Quente

```ts
function hotPotato(names: string[], times: number) {
  const eliminated = [];
  const queue = new Queue();

  names.forEach(name => queue.enqueue(name));

  while (queue.size() > 1) {
    for (let i = 1; i <= times; i++) {
      queue.enqueue(queue.dequeue());
    }
    eliminated.push(queue.dequeue());
  }

  return {
    eliminated,
    winner: queue.toString(),
  };
}
```
