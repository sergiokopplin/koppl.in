---
title: ":keyboard: Estrutura de Dados - Deque"
layout: post
date: 2022-08-31
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Deque
---

## Descrição

Um Deque é conhecido como fila de duas pontas, é uma fila especial que nos permite inserir e remover elementos do final ou da frente da fila.

> Um Exemplo de Deque é o cinema, onde alguém que acabou de comprar pode voltar ao início da fila para perguntar uma informação.

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Deque

```ts
class Deque<T> {
  private count: number;
  private lowestCount: number;
  private items: any;

  constructor() {
    this.count = 0;
    this.lowestCount = 0;
    this.items = {};
  }

  addFront(element: T) {
    if (this.isEmpty()) {
      this.addBack(element);
    } else if (this.lowestCount > 0) {
      this.lowestCount--;
      this.items[this.lowestCount] = element;
    } else {
      for (let i = this.count; i > 0; i--) {
        this.items[i] = this.items[i - 1];
      }
      this.count++;
      this.items[0] = element;
    }
  }

  addBack(element: T) {
    this.items[this.count] = element;
    this.count++;
  }

  removeFront() {
    if (this.isEmpty()) {
      return undefined;
    }
    const result = this.items[this.lowestCount];
    delete this.items[this.lowestCount];
    this.lowestCount++;
    return result;
  }

  removeBack() {
    if (this.isEmpty()) {
      return undefined;
    }
    this.count--;
    const result = this.items[this.count];
    delete this.items[this.count];
    return result;
  }

  peekFront() {
    if (this.isEmpty()) {
      return undefined;
    }
    return this.items[this.lowestCount];
  }

  peekBack() {
    if (this.isEmpty()) {
      return undefined;
    }
    return this.items[this.count - 1];
  }

  isEmpty() {
    return this.size() === 0;
  }

  clear() {
    this.items = {};
    this.count = 0;
    this.lowestCount = 0;
  }

  size() {
    return this.count - this.lowestCount;
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

### Palíndromo

```ts
function palindrome(word: string): boolean {
  let isPalindrome = false;

  const deque = new Deque();
  const wordLength = word.length;

  for (var i = 0; i < wordLength; i++) {
    deque.addBack(word[i]);
  }

  for (var i = 1; i < wordLength; i++) {
    deque.removeBack();
    deque.removeFront();

    if (deque.size() === 1) {
      isPalindrome = true;
    }
  }

  return isPalindrome;
}
```
