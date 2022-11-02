---
title: ":snake: Python - Trabalhando no vscode com remote container"
layout: post
date: 2022-11-02
headerImage: false
tag:
    - python
star: false
category: blog
author: sergiokopplin
description: Sobre como trabalhar no vscode com python e remote container
---

Uma grande vantagem de utilizar containers para desenvolvimento, é que sempre teremos um ambiente preparado e com tudo o que precisamos.
Mas podemos ir além do **Docker** para somente para o desenvolvimento com o Remote Container. 

Com isso, nosso ambiente de vscode passará a funcionar de dentro de um container. E quais as vantagens disso? Teremos nossa IDE mais conectada ao nosso projeto, com todas as dependências, extensões e demais configurações iniciais sempre que abrirmos nosso projeto localmente ou que qualquer outra pessoa abra em seu próprio vscode.

Mais detalhes sobre o remote container [aqui](https://code.visualstudio.com/docs/devcontainers/tutorial).

---

Como funciona?

A ideia é abrirmos o nosso vscode normalmente, e pedirmos para que ele inicialize no modo do remote container. Podemos usar o seguinte comando do vscode:

```bash
> Dev Containers: Add Dev Container Configuration Files...
```

Logo após, podemos selecionar **From 'docker-compose.yml'**.

Com isso, o vscode reiniciará no modo container. Isso já seria suficiente para continuarmos desenvolvendo com o container remoto, porém podemos configurá-lo melhor.

Uma pasta **.devcontainer** será criada, e ela você terá as configurações do container e as do compose.

Baseado no nosso projeto, eu alterei algumas coisas para que sempre que o container for aberto, seja garantido que as extensões recomendadas do projetos sejam instaladas, entre outras configurações:

**devcontainer.json**

```json
{
	"name": "Micro Videos Python",
	"dockerComposeFile": [
		"../docker-compose.yml",
		"docker-compose.yml"
	],
	"service": "app",
	"workspaceFolder": "/home/python/app",
	"remoteUser": "python",
	"extensions": [
		"ms-python.python",
        "ms-azuretools.vscode-docker",
        "visualstudioexptteam.vscodeintellicode",
        "sourcery.sourcery",
        "sonarsource.sonarlint-vscode",
        "ms-kubernetes-tools.vscode-kubernetes-tools",
        "ms-vscode-remote.vscode-remote-extensionpack",
        "humao.rest-client",
        "rangav.vscode-thunder-client",
        "batisteo.vscode-django"
	]
}
```

O **docker-compose** ficou assim:

```yml
version: '3'
services:
  app:
    user: python
    volumes:
      - .:/home/python/app:cached
    command: /bin/sh -c "while sleep 1000; do :; done"
```

Com isso, temos um ambiente pronto para desenvolvimento. Mesmo que existam muitas evoluções de configuração, esse já é um ótimo começo.

---

O código fonte está [aqui](https://github.com/sergiokopplin/full-cycle-project).
