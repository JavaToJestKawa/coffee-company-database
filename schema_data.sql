ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

--DROP

-- tables
-- DROP TABLE CoffeBeanType;

-- DROP TABLE Customer;

-- DROP TABLE Employee;

-- DROP TABLE Harvest;

-- DROP TABLE Harvest_Employees;

-- DROP TABLE IntermediateProduct;

-- DROP TABLE "Order";

-- DROP TABLE Person;

-- DROP TABLE Plantation;

-- DROP TABLE Process;

-- DROP TABLE Product;

-- DROP TABLE Sale;

-- DROP TABLE Sale_Status;

--CREATE

-- tables
-- Table: CoffeBeanType
CREATE TABLE CoffeBeanType (
    Id integer  NOT NULL,
    Description varchar2(2000)  NOT NULL,
    CONSTRAINT CoffeBeanType_pk PRIMARY KEY (Id)
) ;

INSERT INTO CoffeBeanType VALUES
    (1, 'Arabika to najbardziej popularny gatunek kawy na świecie, stanowiący około 60-70% światowej produkcji kawy. Charakteryzuje się delikatnym, subtelniejszym smakiem i aromatem, który może mieć nuty kwiatowe, owocowe lub cytrusowe.
    Arabika rośnie głównie na wyższych wysokościach, co sprzyja jej lepszej jakości.'
    );
INSERT INTO CoffeBeanType VALUES
    (2, 'Robusta jest drugim co do popularności gatunkiem kawy i stanowi około 30-40% światowej produkcji. Jest bardziej odporna na choroby i warunki atmosferyczne niż Arabika.
    Ma mocniejszy, bardziej wyrazisty smak, często z nutami gorzkiej czekolady i orzechów. Robusta zawiera więcej kofeiny niż Arabika.'
    );
INSERT INTO CoffeBeanType VALUES
    (3, 'Liberika to mniej znany gatunek kawy, pochodzący głównie z Liberii. Ma wyjątkowy smak, który niektórzy opisują jako lekko metaliczny lub dziki.
    Jest to rzadko spotykany gatunek kawy, ale ma swoich oddanych miłośników.'
    );
INSERT INTO CoffeBeanType VALUES
    (4, 'Excelsa to inny rzadki gatunek kawy, pochodzący głównie z południowo-wschodniej Azji. Ten gatunek kawy ziarnistej charakteryzuje się wyrazistym smakiem o głębokim charakterze, często z nutami owocowymi i kwiatowymi.
    Jest to popularny składnik mieszanki kawowej, dodający jej wyjątkowego aromatu.'
    );
INSERT INTO CoffeBeanType VALUES
    (5, 'Maragogipe to odmiana Arabiki znana również jako "słoniowa kawa" ze względu na duże ziarna, które przypominają ziarna słoni. Ma delikatny smak i aromat, z nutami owocowymi i kwiatowymi.
    Jest to dość rzadka odmiana kawy, ceniona przez koneserów za swoją wyjątkową jakość.'
    );

-- Table: Customer
CREATE TABLE Customer (
    Id integer  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Id)
) ;

INSERT INTO Customer VALUES
    (2);
INSERT INTO Customer VALUES
    (3);
INSERT INTO Customer VALUES
    (5);
INSERT INTO Customer VALUES
    (6);
INSERT INTO Customer VALUES
    (8);
INSERT INTO Customer VALUES
    (9);

-- Table: Employee
CREATE TABLE Employee (
    Id integer  NOT NULL,
    Salary number(8,2)  NOT NULL,
    Supervisor_Id integer  NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (Id)
) ;

INSERT INTO Employee VALUES
    (1, 22.50, 4);
INSERT INTO Employee VALUES
    (4, 34.25, NULL);
INSERT INTO Employee VALUES
    (7, 29.00, NULL);
INSERT INTO Employee VALUES
    (10, 25.50, 4);

-- Table: Harvest
CREATE TABLE Harvest (
    Id integer  NOT NULL,
    Plantation_Id integer  NOT NULL,
    CoffeBeanType_Id integer  NOT NULL,
    DateBegin date  NOT NULL,
    DateEnd date  NOT NULL,
    CONSTRAINT Harvest_pk PRIMARY KEY (Id)
) ;

INSERT INTO Harvest VALUES
    (1, 1, 1, TO_DATE('2024-02-02'), TO_DATE('2024-03-02'));
INSERT INTO Harvest VALUES
    (2, 2, 1, TO_DATE('2024-03-15'), TO_DATE('2024-03-29'));
INSERT INTO Harvest VALUES
    (3, 2, 1, TO_DATE('2024-04-01'), TO_DATE('2024-04-09'));
INSERT INTO Harvest VALUES
    (4, 3, 2, TO_DATE('2024-05-03'), TO_DATE('2024-05-19'));
INSERT INTO Harvest VALUES
    (5, 4, 3, TO_DATE('2024-04-28'), TO_DATE('2024-05-11'));

-- Table: Harvest_Employees
CREATE TABLE Harvest_Employees (
    Harvest_Id integer  NOT NULL,
    Employee_Id integer  NOT NULL,
    CONSTRAINT Harvest_Employees_pk PRIMARY KEY (Harvest_Id,Employee_Id)
) ;

INSERT INTO Harvest_Employees VALUES
    (1, 1);
INSERT INTO Harvest_Employees VALUES
    (1, 4);
INSERT INTO Harvest_Employees VALUES
    (1, 7);
INSERT INTO Harvest_Employees VALUES
    (1, 10);
INSERT INTO Harvest_Employees VALUES
    (2, 1);
INSERT INTO Harvest_Employees VALUES
    (2, 10);
INSERT INTO Harvest_Employees VALUES
    (3, 1);
INSERT INTO Harvest_Employees VALUES
    (3, 7);
INSERT INTO Harvest_Employees VALUES
    (4, 1);
INSERT INTO Harvest_Employees VALUES
    (4, 10);

-- Table: IntermediateProduct
CREATE TABLE IntermediateProduct (
    ExpiryDate date  NOT NULL,
    Harvest_Id integer  NOT NULL,
    Process_Id integer  NOT NULL,
    CONSTRAINT IntermediateProduct_pk PRIMARY KEY (Harvest_Id,Process_Id,ExpiryDate)
) ;

INSERT INTO IntermediateProduct VALUES
    (TO_DATE('2028-01-01'), 1, 1);
INSERT INTO IntermediateProduct VALUES
    (TO_DATE('2028-01-03'), 1, 2);
INSERT INTO IntermediateProduct VALUES
    (TO_DATE('2027-12-23'),2, 1);
INSERT INTO IntermediateProduct VALUES
    (TO_DATE('2029-11-06'), 3, 1);
INSERT INTO IntermediateProduct VALUES
    (TO_DATE('2028-10-17'), 4, 2);

-- Table: Order
CREATE TABLE "Order" (
    Id integer  NOT NULL,
    "Date" date  NOT NULL,
    RequiredDate date  NOT NULL,
    Customer_Id integer  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (Id)
) ;

INSERT INTO "Order" VALUES
    (1, TO_DATE('2024-09-01'), TO_DATE('2025-01-01'), 2);
INSERT INTO "Order" VALUES
    (2, TO_DATE('2024-12-13'), TO_DATE('2024-12-23'), 3);
INSERT INTO "Order" VALUES
    (3, TO_DATE('2024-09-22'), TO_DATE('2024-11-22'), 2);
INSERT INTO "Order" VALUES
    (4, TO_DATE('2024-06-29'), TO_DATE('2024-07-29'), 5);
INSERT INTO "Order" VALUES
    (5, TO_DATE('2025-02-02'), TO_DATE('2025-02-10'), 9);

-- Table: Person
CREATE TABLE Person (
    Id integer  NOT NULL,
    Name varchar2(40)  NOT NULL,
    SecondName varchar2(40)  NOT NULL,
    Address varchar2(100)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (Id)
) ;

INSERT INTO Person VALUES
    (1, 'SpongeBob', 'SquarePants', 'Bikini Dolne');
INSERT INTO Person VALUES
    (2, 'Clint', 'Eastwood', 'California');
INSERT INTO Person VALUES
    (3, 'Stanislaw', 'Lem', 'Krakow');
INSERT INTO Person VALUES
    (4, 'Shrek', 'Shrek', 'Bagno');
INSERT INTO Person VALUES
    (5, 'Leonardo', 'da Vinci', 'Anchiano');
INSERT INTO Person VALUES
    (6, 'Krystyna', 'Czubowna', 'Nowy Sacz');
INSERT INTO Person VALUES
    (7, 'Mick', 'Jagger', 'Dartford');
INSERT INTO Person VALUES
    (8, 'Tadeusz', 'Nalepa', 'Warszawa');
INSERT INTO Person VALUES
    (9, 'Ojciec', 'Pio', 'Pietrelcina');
INSERT INTO Person VALUES
    (10, 'Peter', 'Parker', 'Nowy Jork');

-- Table: Plantation
CREATE TABLE Plantation (
    Id integer  NOT NULL,
    Address varchar2(100)  NOT NULL,
    CoffeBeanType_Id integer  NOT NULL,
    CONSTRAINT Plantation_pk PRIMARY KEY (Id,CoffeBeanType_Id)
) ;

INSERT INTO Plantation VALUES
    (1, 'Namyslow', 1);
INSERT INTO Plantation VALUES
    (2, 'Augustow', 1);
INSERT INTO Plantation VALUES
    (3, 'Siedlce', 2);
INSERT INTO Plantation VALUES
    (4, 'Zywiec', 3);
INSERT INTO Plantation VALUES
    (5, 'Kalisz', 4);

-- Table: Process
CREATE TABLE Process (
    Id integer  NOT NULL,
    Name varchar2(80)  NOT NULL,
    Description varchar2(2000)  NOT NULL,
    CONSTRAINT Process_pk PRIMARY KEY (Id)
) ;

INSERT INTO Process VALUES
    (1, 'dry-processed', 'Metoda sucha, często określana angielskim terminem natural lub dry-processed, jest jednym z najstarszych, a zarazem jednym z najprostszych i najtańszych sposobów obróbki kawy.
    Jest ona najczęściej stosowana w tych częściach świata, gdzie dostęp do wody jest ograniczony, np. w Etiopii i niektórych rejonach Brazylii.');
INSERT INTO Process VALUES
    (2, 'dry-processed+grind', 'Metoda sucha, często określana angielskim terminem natural lub dry-processed, jest jednym z najstarszych, a zarazem jednym z najprostszych i najtańszych sposobów obróbki kawy.
    Jest ona najczęściej stosowana w tych częściach świata, gdzie dostęp do wody jest ograniczony, np. w Etiopii i niektórych rejonach Brazylii. + GRIND');
INSERT INTO Process VALUES
    (3, 'fully-washed', 'Metoda określana także jako washed, fully-washed lub wet-processed, jest to proces znacznie bardziej pracochłonny niż obróbka na sucho. Ponieważ metoda ta koncentruje się wyłącznie na ziarnie, a nie na jego łupinie, dzięki bardzo delikatnym i precyzyjnym procesom można pozyskać ziarna naprawdę dobrej jakości, a co za tym idzie – kawę dużo lepszej jakości.
    Mokra metoda obróbki kawy jest szczególnie rozpowszechniona w Ameryce Łacińskiej i południowych regionach Afryki.');
INSERT INTO Process VALUES
    (4, 'fully-washedgrind', 'Metoda określana także jako washed, fully-washed lub wet-processed, jest to proces znacznie bardziej pracochłonny niż obróbka na sucho. Ponieważ metoda ta koncentruje się wyłącznie na ziarnie, a nie na jego łupinie, dzięki bardzo delikatnym i precyzyjnym procesom można pozyskać ziarna naprawdę dobrej jakości, a co za tym idzie – kawę dużo lepszej jakości.
    Mokra metoda obróbki kawy jest szczególnie rozpowszechniona w Ameryce Łacińskiej i południowych regionach Afryki. + GRIND');
INSERT INTO Process VALUES
    (5, 'semi-washed', 'Nazywana również miodową, półmokrą (z angl. semi-washed) lub pulped natural, należy do tzw. metod hybrydowych, które łączą podstawowe procesy przetwarzania. Została opracowana przez plantatorów z Brazylii, którzy chcieli, aby ich kawa miała szerszy zakres smaków.
    Obecnie jednak metoda ta jest najczęściej kojarzona z Kostaryką i Salwadorem.');

-- Table: Product
CREATE TABLE Product (
    Id integer  NOT NULL,
    Harvest_Id integer  NOT NULL,
    Process_Id integer  NOT NULL,
    IntermediateProduct_ExpiryDate date  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY (Id)
) ;

INSERT INTO Product VALUES
    (1, 1, 1, TO_DATE('2028-01-01'));
INSERT INTO Product VALUES
    (2, 1, 1, TO_DATE('2028-01-01'));
INSERT INTO Product VALUES
    (3, 1, 1, TO_DATE('2028-01-01'));
INSERT INTO Product VALUES
    (4, 1, 1, TO_DATE('2028-01-01'));
INSERT INTO Product VALUES
    (5, 1, 1, TO_DATE('2028-01-01'));
INSERT INTO Product VALUES
    (6, 1, 2, TO_DATE('2028-01-03'));
INSERT INTO Product VALUES
    (7, 1, 2, TO_DATE('2028-01-03'));
INSERT INTO Product VALUES
    (8, 2, 1, TO_DATE('2027-12-23'));
INSERT INTO Product VALUES
    (9, 3, 1, TO_DATE('2029-11-06'));
INSERT INTO Product VALUES
    (10, 4, 2, TO_DATE('2028-10-17'));

-- Table: Sale
CREATE TABLE Sale (
    Order_Id integer  NOT NULL,
    Product_Id integer  NOT NULL,
    Price number(9,2)  NOT NULL,
    Sale_Status_Name varchar2(7)  NOT NULL,
    CONSTRAINT Sale_pk PRIMARY KEY (Order_Id,Product_Id)
) ;

INSERT INTO Sale VALUES
    (1, 1, 25.99, 'Sold');
INSERT INTO Sale VALUES
    (1, 2, 25.99, 'Sold');
INSERT INTO Sale VALUES
    (1, 3, 25.99, 'NotSold');
INSERT INTO Sale VALUES
    (2, 4, 27.99, 'Sold');
INSERT INTO Sale VALUES
    (3, 5, 27.99, 'Sold');
INSERT INTO Sale VALUES
    (4, 9, 34.99, 'Sold');
INSERT INTO Sale VALUES
    (5, 10, 45.99, 'NotSold');

-- Table: Sale_Status
CREATE TABLE Sale_Status (
    Name varchar2(7)  NOT NULL,
    CONSTRAINT Sale_Status_pk PRIMARY KEY (Name)
) ;

INSERT INTO Sale_Status VALUES
    ('Sold');
INSERT INTO Sale_Status VALUES
    ('NotSold');

-- foreign keys
-- Reference: Customer_Person (table: Customer)
ALTER TABLE Customer ADD CONSTRAINT Customer_Person
    FOREIGN KEY (Id)
    REFERENCES Person (Id);

-- Reference: Employee_Employee (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Employee
    FOREIGN KEY (Supervisor_Id)
    REFERENCES Employee (Id);

-- Reference: Employee_Person (table: Employee)
ALTER TABLE Employee ADD CONSTRAINT Employee_Person
    FOREIGN KEY (Id)
    REFERENCES Person (Id);

-- Reference: HarvestEmployees_Employee (table: Harvest_Employees)
ALTER TABLE Harvest_Employees ADD CONSTRAINT HarvestEmployees_Employee
    FOREIGN KEY (Employee_Id)
    REFERENCES Employee (Id);

-- Reference: HarvestEmployees_Harvest (table: Harvest_Employees)
ALTER TABLE Harvest_Employees ADD CONSTRAINT HarvestEmployees_Harvest
    FOREIGN KEY (Harvest_Id)
    REFERENCES Harvest (Id);

-- Reference: Harvest_Plantation (table: Harvest)
ALTER TABLE Harvest ADD CONSTRAINT Harvest_Plantation
    FOREIGN KEY (Plantation_Id,CoffeBeanType_Id)
    REFERENCES Plantation (Id,CoffeBeanType_Id);

-- Reference: IntermediateProduct_Harvest (table: IntermediateProduct)
ALTER TABLE IntermediateProduct ADD CONSTRAINT IntermediateProduct_Harvest
    FOREIGN KEY (Harvest_Id)
    REFERENCES Harvest (Id);

-- Reference: IntermediateProduct_Process (table: IntermediateProduct)
ALTER TABLE IntermediateProduct ADD CONSTRAINT IntermediateProduct_Process
    FOREIGN KEY (Process_Id)
    REFERENCES Process (Id);

-- Reference: Order_Customer (table: Order)
ALTER TABLE "Order" ADD CONSTRAINT Order_Customer
    FOREIGN KEY (Customer_Id)
    REFERENCES Customer (Id);

-- Reference: Plantation_CoffeBeanType (table: Plantation)
ALTER TABLE Plantation ADD CONSTRAINT Plantation_CoffeBeanType
    FOREIGN KEY (CoffeBeanType_Id)
    REFERENCES CoffeBeanType (Id);

-- Reference: Product_IntermediateProduct (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_IntermediateProduct
    FOREIGN KEY (Harvest_Id,Process_Id,IntermediateProduct_ExpiryDate)
    REFERENCES IntermediateProduct (Harvest_Id,Process_Id,ExpiryDate);

-- Reference: Sale_Product (table: Sale)
ALTER TABLE Sale ADD CONSTRAINT Sale_Product
    FOREIGN KEY (Product_Id)
    REFERENCES Product (Id);

-- Reference: Sale_Sale_Status (table: Sale)
ALTER TABLE Sale ADD CONSTRAINT Sale_Sale_Status
    FOREIGN KEY (Sale_Status_Name)
    REFERENCES Sale_Status (Name);

-- Reference: Table_29_Order (table: Sale)
ALTER TABLE Sale ADD CONSTRAINT Table_29_Order
    FOREIGN KEY (Order_Id)
    REFERENCES "Order" (Id);

--zrodla:
--https://www.przyjacielekawy.pl/blog/kawy-swiata-ktora-wybrac/
--https://oldschoolcoffee.pl/k/gatunek/
