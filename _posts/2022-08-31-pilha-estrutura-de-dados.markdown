---
title: "Estrutura de Dados - Pilha"
layout: post
date: 2022-08-31
headerImage: false
tag:
    - estrutura de dados
    - base
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Pilha
hidden: false
---

Uma Pilha é uma coleção ordenada de itens que obedece ao LIFO (Last In First Out). A adição ou remoção de itens ocorre na mesma extremidade. O final é conhecido como topo e o oposto de base. Os elementos mais recentes ficam próximos ao topo, e os antigos próximos a base.

Um Exemplo de pilha na vida real é uma "Pilha de Livros".

Exemplo de uma classe utilizando a Pilha "Stack":

```ts
export class Stack {
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

E os testes unitários:

```ts
import { Stack } from './stack';

describe('Stack', () => {
  test('Should init with empty Array', () => {
    const stack = new Stack();

    expect(stack.items).toEqual([]);
  });

  test('Should push elements on the end of pile', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);

    expect(stack.items).toEqual([2, 1, 3]);
  });

  test('Should pop elements on pile', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);

    const value = stack.pop();

    expect(value).toBe(3);
    expect(stack.items).toEqual([2, 1]);
  });

  test('Should peek the last pile element', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);

    const value = stack.peek();

    expect(value).toBe(3);
  });

  test('Should return correctly when empty pile', () => {
    const stack = new Stack();

    const value = stack.isEmpty();
    expect(value).toBe(true);
  });

  test('Should return correctly when not empty pile', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);

    const value = stack.isEmpty();
    expect(value).toBe(false);
  });

  test('Should return pile size when items exists', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);

    const value = stack.size();
    expect(value).toBe(3);
  });

  test('Should return pile size when pile empty', () => {
    const stack = new Stack();

    const value = stack.size();
    expect(value).toBe(0);
  });

  test('Should clear pile', () => {
    const stack = new Stack();

    stack.push([2]);
    stack.push([1]);
    stack.push([3]);
    stack.clear();

    expect(stack.items).toEqual([]);
  });

  test('Should Integrate correctly', () => {
    const stack = new Stack();

    expect(stack.isEmpty()).toBe(true);

    stack.push([5, 8]);

    expect(stack.peek()).toBe(8);
    expect(stack.size()).toBe(2);

    stack.push([11]);
    expect(stack.size()).toBe(3);

    expect(stack.isEmpty()).toBe(false);

    stack.push([15]);
    stack.pop();
    stack.pop();

    expect(stack.size()).toBe(2);
  });
});
```
