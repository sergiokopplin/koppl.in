---
title: ":snake: Python - Trabalhando com Docker"
layout: post
date: 2022-11-02
headerImage: false
tag:
    - python
    - docker
star: false
category: blog
author: sergiokopplin
description: Sobre como inicar com Python e Docker
---

Um bom jeito de trabalhar com um ambiente específico é utilizando Docker.

Com isso, podemos criar um **Dockerfile** que será utilizado em desenvolvimento e produção.

```dockerfile
# Selecionando a imagem base
# Slim é selecionado pois ele tem tamanho menor e mais enxuto
FROM python:3.10.8-slim

# Qual usuário que teremos no Container?
RUN useradd -ms /bin/bash python

# Usuário selecionado para rodar o container
# Usuário não root por padrão
USER python

# O diretório do Container que consumirá os arquivos
WORKDIR /home/python/app

# Configura o python path para que o comando de bash inicie diretamente na raiz do src
ENV PYTHONPATH=${PYTHONPATH}/home/python/app/src

# Persistência na leitura de arquivos da imagem
# Usada para deixar o run de pé, apontando para um nulo de dentro do Linux
CMD [ "tail", "-f", "/dev/null" ]
```

Com isso, podemos configurar nosso **docker-compose.yml** para utilizar dessa configuração:

```yml
# Versão do docker-compose
version: '3'

# Todos os serviços que iremos utilizar, e somente o App por enquanto
services:
  app:
    build: .
    container_name: micro-videos-python-app
    volumes:
      # Iremos apontar a raiz do nosso projeto para essa pasta específica dentro do container
      - .:/home/python/app
```

Com isso, temos nosso ambiente docker básico pronto.

Um outro arquivo que pode nos ajudar, para facilitar os comandos utilizados no **Docker**, é o **Makefile**.

```makefile
# Sobe a imagem do container
up:
  docker-compose up --build

# Sobe a imagem do container e inicializa o bash dentro da imagem
bash:
  docker-compose exec app bash
```

---

Agora que temos nosso ambiente de desenvolvimento configurado, podemos criar alguns arquivos de exemplo para testar a nossa aplicação Python:

```
src
  category
    __init__.py
    entities.py
```

entities.py:

```python
class Category:
  def __init__(self, name) -> None:
    self.name = name
```

Com nosso arquivo pronto, podemos rodar o seguinte exemplo:

```bash
make bash
$ python
>>> from category.entities import Category
>>> Category('Movie')
```

Pronto. Agora podemos iniciar o nosso projeto Python.

O código fonte está [aqui](https://github.com/sergiokopplin/full-cycle-project).
