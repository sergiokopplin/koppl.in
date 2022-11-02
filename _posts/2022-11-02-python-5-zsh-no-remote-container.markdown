---
title: ":snake: Python - ZSH no remote container"
layout: post
date: 2022-11-02
headerImage: false
tag:
    - python
star: false
category: blog
author: sergiokopplin
description: Sobre adicionar ZSH no remote container
---

Depois de configurar um remote container, podemos customizá-lo para adicionar pacotes que usamos fora do container.

Nosso **Dockerfile** fica da seguinte forma:

```dockerfile
# Selecionando a imagem base
# Slim é selecionado pois ele tem tamanho menor e mais enxuto
FROM python:3.10.8-slim

# Precisamos do Java para o Sonarlint
# Precisamos também dos outros pacotes, para termos todas as configurações necessárias
RUN apt update && apt install -y --no-install-recommends \ 
    default-jre \
    git \ 
    zsh \ 
    curl \ 
    wget \ 
    fonts-powerline

# Qual usuário que teremos no Container?
RUN useradd -ms /bin/bash python

# Usuário selecionado para rodar o container
# Usuário não root por padrão
USER python

# O diretório do Container que consumirá os arquivos
WORKDIR /home/python/app

# Configura o python path para que o comando de bash inicie diretamente na raiz do src
ENV PYTHONPATH=${PYTHONPATH}/home/python/app/src
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.3/zsh-in-docker.sh)" -- \
    -t https://github.com/romkatv/powerlevel10k \
    -p git \
    -p https://github.com/zdharma/fast-syntax-highlighting \ 
    -p https://github.com/zsh-users/zsh-autosuggestions \ 
    -p https://github.com/zsh-users/zsh-completions \ 
    -a 'export TERM=xterm-256color'

RUN echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# Persistência na leitura de arquivos da imagem
# Usada para deixar o run de pé, apontando para um nulo de dentro do Linux
CMD [ "tail", "-f", "/dev/null" ]
```

Com isso, instalamos alguns pacotes a mais, como o **git** por exemplo. Isso fará nosso vscode ficar mais completo.

Não esqueça de adicionar configurações do terminal no seu container:

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
    // Necessário para inicializar o terminal usando o shell correto
	"settings": {
		"terminal.integrated.defaultProfile.linux": "zsh",
		"terminal.integrated.defaultProfile.osx": "zsh"
	},
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

---

O código fonte está [aqui](https://github.com/sergiokopplin/full-cycle-project).

