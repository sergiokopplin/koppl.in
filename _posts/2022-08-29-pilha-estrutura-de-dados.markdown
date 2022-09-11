---
title: ":keyboard: Estrutura de Dados - Pilha"
layout: post
date: 2022-08-29
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Pilha
---

## Descrição

Uma Pilha é uma coleção ordenada de itens que obedece ao LIFO (Last In First Out). A adição ou remoção de itens ocorre na mesma extremidade. O final é conhecido como topo e o oposto de base. Os elementos mais recentes ficam próximos ao topo, e os antigos próximos a base.

> Um Exemplo de pilha na vida real é uma "Pilha de Livros".

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Pilha com Arrays

```ts
class Stack {
  public items: number[];

  constructor() {
    this.items = [];
  }

  push(element: number[]) {
    this.items.push(...element);
  }

  pop() {
    return this.items.pop();
  }

  peek() {
    const length = this.items.length;
    return this.items[length - 1];
  }

  isEmpty() {
    return this.items.length === 0;
  }

  size() {
    return this.items.length;
  }

  clear() {
    this.items = [];
  }
}
```

### Pilha com Objetos

```ts
class Stack {
  public items: { [key: number]: number };
  private count: number;

  constructor() {
    this.count = 0;
    this.items = {};
  }

  push(element: number) {
    this.items[this.count] = element;
    this.count++;
  }

  pop() {
    if (this.isEmpty()) {
      return undefined;
    }

    this.count--;

    const value = this.items[this.count];
    delete this.items[this.count];

    return value;
  }

  peek() {
    if (this.isEmpty()) {
      return undefined;
    }

    const value = this.items[this.count - 1];

    return value;
  }

  toString() {
    if (this.isEmpty()) {
      return '';
    }

    let objString = `${this.items[0]}`;

    for (let i = 1; i < this.count; i++) {
      objString = `${objString},${this.items[i]}`;
    }

    return objString;
  }

  size() {
    return this.count;
  }

  isEmpty() {
    return this.count === 0;
  }

  clear() {
    this.items = {};
    this.count = 0;
  }
}
```

## Exercícios

### Decimal para Binário

```ts
function decimalToBinary(decNumber: number): string {
  const stack = new Stack();

  let binaryString = '';
  let number = decNumber;

  while (number > 0) {
    stack.push(Math.floor(number % 2));
    number = Math.floor(number / 2);
  }

  while (!stack.isEmpty()) {
    binaryString += stack.pop().toString();
  }

  return binaryString;
}
```

### Converter Bases

```ts
function baseConverter(decNumber: number, base: number): string {
  const stack = new Stack();

  let binaryString = '';
  let number = decNumber;
  const digits = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  if (!(base >= 2 && base <= 36)) {
    return '';
  }

  while (number > 0) {
    stack.push(Math.floor(number % base));
    number = Math.floor(number / base);
  }

  while (!stack.isEmpty()) {
    binaryString += digits[stack.pop()];
  }

  return binaryString;
}
```
