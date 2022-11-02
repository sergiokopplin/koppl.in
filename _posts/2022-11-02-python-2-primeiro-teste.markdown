---
title: ":snake: Python - Criando o primeiro teste unitário"
layout: post
date: 2022-11-02
headerImage: false
tag:
    - python
    - testes
star: false
category: blog
author: sergiokopplin
description: Sobre como criar o primeiro teste unitário com Python
---

Hoje iremos conhecer como criar o primeiro teste unitário com Python.

Dado a nossa classe de exemplo, que tem apenas um construtor, iremos usar o **unittest** para criar nosso primeiro caso de uso.

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

A pasta que irá guardar o arquivo de testes não precisa seguir um padrão específico, você pode colocar em qualquer lugar na sua aplicação.

Com isso, vamos ao exemplo do teste:

```python
# Imports necessários para nosso caso de uso
from datetime import datetime
import unittest
from category.domain.entities import Category

# Precisamos sempre criar uma classe com um padrão de nome começando com Test, por exemplo: TestExemplo
# Dessa forma, a ferramenta unittest consegue encontrar nossos casos de uso.
# Precisamos também passar o unittest como parâmetro da classe, para que ele seja usado internamente dentro do TestCategory
class TestCategory(unittest.TestCase):

    # Esse é o nosso primeiro caso de uso.
    # O padrão de nome é esse: test_descricao_do_seu_teste.
    # Ou seja, começamos com test_ e depois inserimos a nossa descrição.
    def test_constructor(self):
        category = Category('Movie', 'Description', True, datetime.now())
        # Os asserts do nosso caso de uso
        self.assertEqual(category.name, 'Movie')
        self.assertEqual(category.description, 'Description')
        self.assertEqual(category.is_active, True)
        self.assertIsInstance(category.created_at, datetime)
```

Para testar o nosso primeiro caso de uso, podemos rodar o seguinte comando no bash da nossa aplicação:

```bash
$ python -m unittest category.tests.domain.test_entities
```

Isso gerará o seguinte resultado:

```log
python@3a0ab57b8d27:~/app$ python -m unittest category.tests.domain.test_entities
.
----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

Lembrando que o caminho passado para o unittest é o caminho semântico dentro do seu módulo python.

O código fonte está [aqui](https://github.com/sergiokopplin/full-cycle-project).
