---
title: ":floppy_disk: Estrutura de Dados - Conjuntos"
layout: post
date: 2022-10-08
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Conjuntos
---

## Descrição

Conjuntos são parecidas com Arrays e contêm dados sequenciais, porém, não permitindo dados duplicados.

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Conjuntos

```ts
export class Set {
  items: any;

  constructor() {
    this.items = {};
  }

  has(element: any): boolean {
    return Object.prototype.hasOwnProperty.call(this.items, element);
  }

  add(element: any): boolean {
    if (!this.has(element)) {
      this.items[element] = element;

      return true;
    }

    return false;
  }

  delete(element: any): boolean {
    if (this.has(element)) {
      delete this.items[element];
      return true;
    }

    return false;
  }

  clear(): void {
    this.items = {};
  }

  size(): number {
    return Object.keys(this.items).length;
  }

  values(): any[] {
    return Object.values(this.items);
  }
}
```
