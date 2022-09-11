---
title: ":shipit: Renderização nos Browsers"
layout: post
date: 2022-09-07
headerImage: false
tag:
    - frontend
star: false
category: blog
author: sergiokopplin
description: Sobre o processo de renderização nos browsers
---

Um Browser (Navegador) segue alguns passos para renderizar uma página de um endereço da Web. 

Resumidamente, Parse do HTML, Parse do CSS, Combinação dos Parses, Layout, Painting e Display.

## 1. Parse Html

Quando um browser recebe os dados HTML de um servidor, ele converte no [DOM Tree](https://developer.mozilla.org/pt-BR/docs/Web/API/Document_Object_Model/Introduction).

---

## 2. Parse CSS

Os estilos, ou seja, arquivos de CSS, também são carregador e convertidos no CCSOM ([CSS Object Model](https://developer.mozilla.org/pt-BR/docs/Glossary/CSSOM))

---

## 3. Combinação e criação da Render Tree

Com os dois conjuntos DOM e CSSOM, o browser os combina e cria a [Render Tree](https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work#render). A Render Tree é uma representação visual do DOM.

---

## 4. Layout

O conteúdo de cada elemento renderizado da Render Tree será calculado para extrair informações como "posição" e "tamanho" (position e size), o que é chamado de [Layout](https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work#layout).

---

## 5. Painting

Nesse passo a Render Tree é transformada em conteúdo na tela, esse processo é chamado de [Painting](https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work#paint).

---

## 6. Display

E por fim, o browser envia a GPU e disponibiliza o conteúdo na página. O que é chamado de Display.

---

## Referências

- [https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work](https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work);
- [https://www.linkedin.com/feed/update/urn:li:activity:6939965496427507714/?updateEntityUrn=urn%3Ali%3Afs_updateV2%3A%28urn%3Ali%3Aactivity%3A6939965496427507714%2CFEED_DETAIL%2CEMPTY%2CDEFAULT%2Cfalse%29](https://www.linkedin.com/feed/update/urn:li:activity:6939965496427507714/?updateEntityUrn=urn%3Ali%3Afs_updateV2%3A%28urn%3Ali%3Aactivity%3A6939965496427507714%2CFEED_DETAIL%2CEMPTY%2CDEFAULT%2Cfalse%29)
- [https://dev.to/arikaturika/how-web-browsers-work-the-render-tree-part-7-with-illustrations-24h3](https://dev.to/arikaturika/how-web-browsers-work-the-render-tree-part-7-with-illustrations-24h3)
- [https://developer.mozilla.org/pt-BR/docs/Web/API/Document_Object_Model/Introduction](https://developer.mozilla.org/pt-BR/docs/Web/API/Document_Object_Model/Introduction)
- [https://developer.mozilla.org/pt-BR/docs/Glossary/CSSOM](https://developer.mozilla.org/pt-BR/docs/Glossary/CSSOM)
