---
title: ":floppy_disk: Estrutura de Dados - Dicionário"
layout: post
date: 2022-10-11
headerImage: false
tag:
    - estrutura de dados
star: false
category: blog
author: sergiokopplin
description: Sobre a Estrutuda de Dados de Dicionário
---

## Descrição

Dicionários são usados para armazenar pares (chave & valor), em que a chave pode ser usada para encontrar um elemento. Parecido com o Conjunto, porém armazenando uma coleção de elementos [chave, valor].

[Repositório com os Exemplos](https://github.com/sergiokopplin/livro-estrutura-de-dados-e-algoritmos-js).

## Exemplos

### Dicionários

```ts
function defaultToString(item: string) {
  return item;
}

class ValuePair {
  key: string;
  value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }

  toString() {
    return `[#${this.key}: ${this.value}]`;
  }
}

export class Dictionary {
  table: {
    [key: string]: any;
  };
  toStrFn: any;

  constructor(toStrFn = defaultToString) {
    this.table = {};
    this.toStrFn = toStrFn;
  }

  set(key: string, value: any): boolean {
    if (key != null && value != null) {
      const tableKey: string = this.toStrFn(key);
      this.table[tableKey] = new ValuePair(key, value);

      return true;
    }

    return false;
  }

  has(key: string): boolean {
    return this.table[this.toStrFn(key)] != null;
  }

  size(): number {
    return Object.keys(this.table).length;
  }

  keys(): string[] {
    return Object.keys(this.table).map(item => this.table[item].key);
  }

  values(): string[] {
    return Object.keys(this.table).map(item => this.table[item].value);
  }

  get(key: string): string {
    return this.table[this.toStrFn(key)].value;
  }

  keyValues(): {
    [key: string]: any;
  }[] {
    return Object.keys(this.table).map(item => this.table[item]);
  }

  remove(key: string): void {
    delete this.table[this.toStrFn(key)];
  }
}
```
