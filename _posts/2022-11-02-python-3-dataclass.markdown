---
title: ":snake: Python - Inserindo Dataclass nas Classes"
layout: post
date: 2022-11-02
headerImage: false
tag:
    - python
star: false
category: blog
author: sergiokopplin
description: Sobre como abstrair o constructor de classes com dataclass
---

Dado a nossa classe de exemplo, que tem apenas um construtor, iremos adicionar o **dataclass** para abstrair o constructor.

Classe de Exemplo:

```python
from datetime import datetime

class Category:

    def __init__(self, name: str, description: str, is_active: bool, created_at: datetime) -> None:
        self.name = name
        self.description = description
        self.is_active = is_active
        self.created_at = created_at
```

Classe com Dataclass:

```python
from datetime import datetime
from dataclasses import dataclass, field
from typing import Optional

# Aqui inserimos o decorator do dataclass
@dataclass()
class Category:

    name: str
    # Agora podemos declarar propriedades opcionais
    description: Optional[str] = None
    # Podemos também declarar um valor padrão para a propriedade
    is_active: Optional[bool] = True
    # Podemos também inserir um valor calculado no runtime da instância da classe.
    # Dessa forma, sempre que instanciada, iremos calcular o valor do datetime através de uma lambda function
    created_at: Optional[datetime] = field(default_factory=lambda: datetime.now())
```

O teste que fizemos no post anterior continua passando:

```log
python@3a0ab57b8d27:~/app$ python -m unittest category.tests.domain.test_entities
.
----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```
