create database IKEA_DATABASE
Go
/*Amy Zang, Cynthia Yong, and Xiang Li will design a database for IKEA to analysis how IKEA works in its business.
*/
USE IKEA_DATABASE
go
/*Create Customer Table*/
Create Table Customer (
CustomerID bigint primary key not null,
FirstName varchar(100) not null,
LastName varchar(100) not null,
Gender varchar(10) not null,
OrderID bigint not null,
Email varchar(100) not null,
Phone numeric not null,
CustomerCounty varchar(100) not null,
CustomerState varchar(100) not null,
CustomerCity varchar(100) not null,
PostalCode varchar(100) not null,
CustomerAddressLine varchar(100) not null)

/*Create Product Table*/
Create table Product (
ProductID bigint primary key not null,
ProductName varchar(100) not null,
ProductCategoryID bigint not null,
ProductWidth integer not NULL,
ProductDepth integer not NULL,
ProductHeight integer not null,
RetailPrice decimal not null,
RequiredAssembly varchar(10) not null)

/*Create Product Category*/
Create table ProductCategory (
ProductCategory bigint primary key not null,
ProductCategoryName varchar(100) not null)

/*Create Payment table*/
Create table Payment (
PaymentID bigint primary key not null,
CustomerID bigint not null,
OrderID bigint not null,
CreditCardType varchar(10) not null,
SalesAmount decimal not null,
PaymentDate date not null)

/*Create Order table*/
Create table OrderTable (
OrderID bigint primary key not null,
CustomerID bigint not null,
ProductID bigint not null,
ShipmentID bigint not null,
VendorID bigint not null,
SalesQuantity smallint not null,
SalesPrice decimal not null,
SalesDate date not null,
ShipmentDate date not null)

/* Create Shipment table*/
Create table Shipment (
ShipmentID bigint primary key not null,
CustomerID bigint not null,
OrderID bigint not null,
VendorID bigint not null,
ShipmentCountry varchar(100) not null,
ShipmentState varchar(100) not null,
ShipmentCity varchar(100) not null,
PostalCode varchar(100) not null,
ShipmentAddressLine varchar(100) not null,
ScheduledShippingDate date not null)

/*Create Vendor table*/
Create table Vendor (
VendorID bigint primary key not null,
VendorName varchar(100) not null,
VendorCountry varchar(100) not null,
VendorStates varchar(100) not null,
VendorCity varchar(100) not null,
VendorPostalCode varchar(100) not null,
VendorAddress varchar(100) not null,
VendorEmail varchar(100) not null,
Phone numeric not null)


/*Connect tables*/
Alter table Customer
add constraint FK_OrderID references OrderTable(OrderID);
Alter table Product
add constraint FK_ProductCategoryID 
references ProductCategory(ProductcategoryID);
Alter table Payment
add constraint FK_CustomerID references Customer(CustomerID);
Alter table Payment
add constraint FK_OrderID references OrderTable(OrderID);
Alter table Ordertable
add constraint FK_CustomerID references Customer(CustomerID);
Alter table Ordertable
add constraint FK_ProductID references Product(ProductID);
Alter table Ordertable
add constraint FK_ShipmentID references Shipment(ShipmentID);
Alter table Ordertable
add constraint FK_VendorID references Vendor(VendorID);
Alter table Shipment
add constraint FK_CustomerID references Customer(CustomerID);
Alter table Shipment
add constraint FK_VendorID references Vendor(VendorID);
Alter table Shipment
add constraint FK_OrderID references OrderTable(OrderID);

Use IKEA_ 
select *
from IKEA_DATABASE 
