---
title: ":keyboard: Estrutura de Dados - Lista Ligada"
layout: post
date: 2022-09-11
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Lista Ligada
---

## Descrição

Listas Ligadas são parecidas com Arrays, mas diferentemente dos Arrays, os elementos não são posicionados de forma contígua na memória. Cada elemento é um nó que armazena o seu valor e uma referência para o próximo elemento.

> Um Exemplo de Lista Ligada na vida Real é o de um trem, onde cada vagão se conecta ao próximo, partindo do head que é a locomotiva.

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Lista Ligada

```ts
function defaultEquals(a: any, b: any) {
  return a === b;
}

class Node {
  element: any;
  next: any;

  constructor(element: any) {
    this.element = element;
    this.next = undefined;
  }
}

export class LinkedList {
  count: number;
  head: any;
  equalsFn: Function;

  constructor(equalsFn = defaultEquals) {
    this.count = 0;
    this.head = undefined;
    this.equalsFn = equalsFn;
  }

  push(element: any): void {
    const node = new Node(element);
    let current;

    if (this.head == null) {
      this.head = node;
    } else {
      current = this.head;

      while (current.next != null) {
        current = current.next;
      }

      current.next = node;
    }

    this.count++;
  }

  removeAt(index: number): any {
    if (index >= 0 && index < this.count) {
      let current = this.head;

      if (index === 0) {
        this.head = current.next;
      } else {
        const previous = this.getElementAt(index - 1);
        current = previous.next;
        previous.next = current.next;
      }

      this.count--;
      return current.element;
    }

    return undefined;
  }

  getElementAt(index: number): any {
    if (index >= 0 && index <= this.count) {
      let node = this.head;
      for (let i = 0; i < index && node != null; i++) {
        node = node.next;
      }

      return node;
    }

    return undefined;
  }

  insert(element: any, index: number): boolean {
    if (index >= 0 && index <= this.count) {
      const node = new Node(element);

      if (index === 0) {
        const current = this.head;
        node.next = current;
        this.head = node;
      } else {
        const previous = this.getElementAt(index - 1);
        const current = previous.next;
        node.next = current;
        previous.next = node;
      }

      this.count++;
      return true;
    }

    return false;
  }

  indexOf(element: any): number {
    let current = this.head;

    for (let i = 0; i < this.count && current != null; i++) {
      if (this.equalsFn(element, current.element)) {
        return i;
      }

      current = current.next;
    }

    return -1;
  }

  remove(element: any): any {
    const index = this.indexOf(element);
    return this.removeAt(index);
  }

  size(): number {
    return this.count;
  }

  isEmpty(): boolean {
    return this.size() === 0;
  }

  getHead(): any {
    return this.head;
  }

  toString(): string {
    if (this.head == null) {
      return '';
    }

    let objString = `${this.head.element}`;
    let current = this.head.next;

    for (let i = 0; i < this.size() && current != null; i++) {
      objString = `${objString},${current.element}`;
      current = current.next;
    }

    return objString;
  }
}
```
