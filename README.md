# README

## Sobre o Projeto

Este é um projeto de exercício da turma 7 do programa Quero Ser Dev da Locaweb. O projeto consiste num sistema de gestão de galpões e de seus respectivos estoques de produtos.



## API

### Galpões

#### Listar todos galpões

**Requisição:**

```
GET /api/v1/warehouses
```

**Resposta:**

```
Status: 200 (OK)

[
  {
    'id': 1,
    'name': 'Maceió',
    'code': 'MCZ',
    'description': 'Ótimo galpão numa linda cidade',
    'city': 'Maceió',
    'state': 'AL',
    'postal_code': '57050-000',
    'total_area': 10000,
    'useful_area': 8000
  }
]

```

#### Criar um galpão

**Requisição:**

```
POST /api/v1/warehouses
```

**Parâmetros:**

```
{
  'name': 'Maceió',
  'code': 'MCZ',
  'description': 'Ótimo galpão numa linda cidade',
  'address': 'Avenida dos Galpões, 1000',
  'city': 'Maceió',
  'state': 'AL',
  'postal_code': '57050-000',
  'total_area': 10000,
  'useful_area': 8000
}
```

**Resposta:**

```
Status: 201 (Criado)

{
  'id': 10,
  'name': 'Maceió',
  'code': 'MCZ',
  'description': 'Ótimo galpão numa linda cidade',
  'city': 'Maceió',
  'state': 'AL',
  'postal_code': '57050-000',
  'total_area': 10000,
  'useful_area': 8000
}
```

### Fornecedores

#### Listar todos fornecedores

**Requisição:**

```
GET /api/v1/suppliers
```

**Resposta:**

```
Status: 200 (OK)

{
  'id': 1,
  'fantasy_name': 'Vinícola Miolo',
  'legal_name': 'Miolo Fábrica de Bebidas LTDA',
  'cnpj': '5190532500015'',
  'email': 'contato@miolos.com',
  'product': 'Fornecedor de Bebidas',
  'telephone': '(11) 94102-0000'
}

```

#### Criar um fornecedor

**Requisição:**

```
POST /api/v1/suppliers
```

**Parâmetros:**

```
{
  'fantasy_name': 'Fornecedor Bom Jesus',
  'legal_name': 'Fornecedor Bom Jesus',
  'cnpj': '00000000000100',
  'email': 'bomjesus@gmail.com',
  'product': 'Fornecedor de materiais diversos',
  'telephone': '(11) 00000-0000'
}
```

**Resposta:**

```
Status: 201 (Criado)

{
  'id': 1,
  'fantasy_name': 'Fornecedor Bom Jesus',
  'legal_name': 'Fornecedor Bom Jesus',
  'cnpj': '00000000000100',
  'email': 'bomjesus@gmail.com',
  'product': 'Fornecedor de materiais diversos',
  'telephone': '(11) 00000-0000'
}
```

### Modelo de Produtos

#### Listar todos modelos de produtos

**Requisição:**

```
GET /api/v1/product_models
```

**Resposta:**

```
Status: 200 (OK)

{
  'id': 1,
  'name': 'Vinho Tinto Miolo',
  'weight': 800,
  'height': 30,
  'length': 10,
  'width': 10,
  'supplier_id': 1,
  'sku': '61ad401327a001e5ce47548db669d8a1219120a5',
  'category_id': 1,
  'dimensions': '30 x 10 x 10',
  'supplier': {
    'id': 1,
    'fantasy_name': 'Vinícola Miolo',
    'legal_name': 'Miolo Fábrica de Bebidas LTDA',
    'cnpj': '51905325000154',
    'email': 'contato@miolos.com',
    'product': 'Fornecedor de Bebidas',
    'telephone': '(11) 94102-0000'
  }
}

```

#### Criar um modelo de produto

**Requisição:**

```
POST /api/v1/product_models
```

**Parâmetros:**

```
{ 'name': 'Caneca',
  'weight': '10',
  'height': '10',
  'length': '5',
  'width': '5',
  'supplier_id': 1,
  'category_id': 1
}
```

**Resposta:**

```
Status: 201 (Criado)

{
'id': 1,
  'name': 'Vinho Tinto Miolo',
  'weight': 800,
  'height': 30,
  'length': 10,
  'width': 10,
  'supplier_id': 1,
  'sku': '61ad401327a001e5ce47548db669d8a1219120a5',
  'category_id': 1,
  'dimensions': '30 x 10 x 10',
  'supplier': {
    'id': 1,
    'fantasy_name': 'Vinícola Miolo',
    'legal_name': 'Miolo Fábrica de Bebidas LTDA',
    'cnpj': '51905325000154',
    'email': 'contato@miolos.com',
    'product': 'Fornecedor de Bebidas',
    'telephone': '(11) 94102-0000'
  }
}
```