CREATE DATABASE ONLINE_SHOPPING

USE ONLINE_SHOPPING

CREATE TABLE CUSTOMER(
       ID INT IDENTITY PRIMARY KEY,
	   EMAIL VARCHAR(100) UNIQUE,
	   [NAME] VARCHAR(50) UNIQUE,
	   ADDRESS VARCHAR(100),
	   PHONE VARCHAR(50)

);

CREATE TABLE ORDERS(
       ORDER_ID INT IDENTITY PRIMARY KEY,
	   CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMER(ID),
	   ORDER_DATE DATE DEFAULT GETUTCDATE(),
	   [STATUS] VARCHAR(100) CHECK([STATUS] IN ('SHIPPED','PENDING','CONFIRMED','DELIVERED')),
	   TOTALAMOUNT DECIMAL(10,2)

);
CREATE TABLE PRODUCT (
     PRODUCT_ID INT IDENTITY PRIMARY KEY,
	 PRICE DECIMAL(10,2),
	 NAME VARCHAR(100) UNIQUE,
	 CATEGORY VARCHAR(50)  CHECK (CATEGORY IN ('ELECTRONICS', 'FASHION', 'GROCERY', 'FURNITURE', 'TOYS')),
	 DESCRIPTION VARCHAR(100)

);

CREATE TABLE SUPPLIER(
   SUPPLIER_ID INT IDENTITY PRIMARY KEY,
	   [NAME] VARCHAR(50) UNIQUE,
	   CONTACT_INFO VARCHAR(100)
);

CREATE TABLE INCLUDES(
      PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCT(PRODUCT_ID),

	  ORDER_ID INT FOREIGN KEY REFERENCES ORDERS(ORDER_ID),

	  [DATE] DATE DEFAULT GETUTCDATE(),

	  PRIMARY KEY (PRODUCT_ID,ORDER_ID,[DATE])
);
CREATE TABLE SUPPLY(
      PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCT(PRODUCT_ID),

	  SUPPLIER_ID INT FOREIGN KEY REFERENCES SUPPLIER(SUPPLIER_ID),

	  [DATE] DATE DEFAULT GETUTCDATE(),

	  PRIMARY KEY (PRODUCT_ID,SUPPLIER_ID,[DATE])
);

CREATE TABLE ORDER_DETAILS(
CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMER(ID),
ORDER_ID INT FOREIGN KEY REFERENCES ORDERS(ORDER_ID),
ORDER_DETAILS_ID  INT IDENTITY PRIMARY KEY,
 PRICE DECIMAL(10,2),
 QUANTITY DECIMAL(10,2)

);
INSERT INTO CUSTOMER (EMAIL, [NAME], ADDRESS, PHONE) 
VALUES 
('john.doe@example.com', 'John Doe', 'NYC', '1234567890'),
('jane.smith@example.com', 'Jane Smith', 'LA', '0987654321');

INSERT INTO ORDERS (CUSTOMER_ID, ORDER_DATE, [STATUS], TOTALAMOUNT) 
VALUES 
(1, GETUTCDATE(), 'PENDING', 150.50),
(2, GETUTCDATE(), 'SHIPPED', 99.99);

INSERT INTO PRODUCT (PRICE, NAME, CATEGORY, DESCRIPTION ) 
VALUES 
(199.99, 'Smartphone', 'ELECTRONICS', 'Latest model with high-resolution camera'),
(49.99, 'Backpack', 'FASHION', 'Durable and stylish backpack for daily use');



INSERT INTO SUPPLIER ([NAME], CONTACT_INFO) 
VALUES 
('Tech Supplies Inc.', 'tech@supplies.com'),
('Fashion Trends Ltd.', 'fashion@trends.com');

INSERT INTO ORDER_DETAILS (CUSTOMER_ID, ORDER_ID, PRICE, QUANTITY) 
VALUES 
(1, 1, 500.00, 1), 
(2, 2, 25.99, 2);

INSERT INTO INCLUDES (PRODUCT_ID, ORDER_ID, [DATE]) 
VALUES 
(1, 1, GETUTCDATE()), 
(2, 2, GETUTCDATE());

ALTER TABLE PRODUCT 
ADD RATING INT DEFAULT 0 CHECK (RATING IN (1,2,3,4,5,0));

ALTER TABLE PRODUCT 
ADD CONSTRAINT  CATEGORY_NAME_CONSTARINT DEFAULT 'NEW' FOR CATEGORY;

ALTER TABLE PRODUCT
DROP COLUMN RATING;


UPDATE ORDERS
SET  ORDER_DATE = GETUTCDATE() WHERE ORDER_ID>0;


DELETE FROM PRODUCT
WHERE NAME IS NOT NULL AND NAME<>'NULL';