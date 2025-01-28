# SQLserver_Livraria

Este é um projeto criado em linguagem SQL, de um sistema de uma livrária, todo código foi feito 100% no SSMS(SQL Server Management Studio) incluindo análises de dados.

Estarei disponibilizando aqui em sequencia as regras de negócio e o modelo entidade-relacionamento:  

## Regras de Negócio Sistema de Gestão de Livros 
  
  RN1- Um livro não pode ser vendido se não houver estoque suficiente. 
  
  RN2- Um pedido só é considerado válido se o valor total for maior que R$10,00 (evitar 
  microtransações). 
  
  RN3- Funcionários devem ter uma data de admissão registrada e não podem ser 
  demitidos sem data de desligamento. 
  
  RN4- O CPF ou e-mail deve ser único no cadastro de clientes e de vendedores. 
  
  RN5- Um cliente pode levar uma quantidade ilimitada de livros em seu pedido. 
  
  RN6- A tabela de clientes terá apenas os clientes cadastrados formalmente (com 
  nome, CPF, e-mail, etc.).
  
  RN7- Clientes que fazem compras sem cadastro terão no lugar do id de cliente, o 
  numero zero, que se refere a um cliente "Não Cadastrado" na tabela Pedidos. 

## Identificando entidades, atributos e relacionamentos 
  
  - Clientes (Cliente_id, Nome, Genero, E-mail, CPF, Data_cadastro). 
  
  - Vendedores (Vendedores_id, Nome, Genero, Email, CPF, Data_admissão, 
    Data_desligamento). 
  
  - Livros (Livro_id, Nome, Autor, Genero_literario, Preço, Qtdestoque, Qtdminimo).
  
  - Pedidos (Pedido_id, Cliente_id, Vendedor_id, Livro_id, Data_pedido, Quantidade, 
    Valor_total).

## Modelo Lógico Entidade Relacionamento

![Modelo diagrama ER Livraria](https://github.com/user-attachments/assets/dc75ac00-4add-4830-9cbc-88a6d2fbbb71)

