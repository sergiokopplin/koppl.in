---
title: ":floppy_disk: Estrutura de Dados - Recursão"
layout: post
date: 2022-10-12
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados com Recursão
---

## Descrição

Um modo simples e alternativo de escrever iterações em loops é a recursão. Dois bons exemplos aplicados ao cálculo de Fibonacci e Fatorial.

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Recursão

```ts
export function factorial(num: number): number {
  if (num === 0 || num === 1) {
    return 1;
  }

  return num * factorial(num - 1);
}

export function fibonacci(num: number): number {
  if (num < 1) return 0;
  if (num <= 2) return 1;

  return fibonacci(num - 1) + fibonacci(num - 2);
}
```
