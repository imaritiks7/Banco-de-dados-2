
CREATE DATABASE SistemaEcommerce;
USE SistemaEcommerce;


CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DataCadastro DATE NOT NULL
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Clientes (Nome, Email, DataCadastro) VALUES
('Ana Silva', 'ana.silva@email.com', '2026-01-15'),
('Bruno Costa', 'bruno.costa@email.com', '2026-02-20'),
('Carlos Souza', 'carlos.souza@email.com', '2026-03-10'),
('Diana Martins', 'diana.martins@email.com', '2026-04-05');

INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal) VALUES
(1, '2026-05-10', 150.50),
(1, '2026-05-22', 89.90),
(2, '2026-06-01', 450.00),
(3, '2026-06-15', 120.00);


SELECT 
    c.Nome, 
    c.Email, 
    p.PedidoID, 
    p.DataPedido, 
    p.ValorTotal
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID;

SELECT 
    c.Nome, 
    p.PedidoID, 
    p.ValorTotal
FROM Clientes c
LEFT JOIN Pedidos p ON c.ClienteID = p.ClienteID;
