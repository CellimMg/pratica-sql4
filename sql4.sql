 CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL
);

CREATE TYPE "categoryType" AS ENUM('CALÇA', 'CAMISA', 'VESTIDO');
CREATE TYPE "sizeType" AS ENUM('P', 'M', 'G');

CREATE TABLE "products" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"category" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	"image" TEXT NOT NULL
);

CREATE TABLE "images" (
	"id" serial PRIMARY KEY,
	"image" TEXT NOT NULL,
	"productId" integer NOT NULL REFERENCES "products"("id")
);

CREATE TABLE "address" (
	"id" serial PRIMARY KEY,
	"userId" integer NOT NULL REFERENCES "users"("id"),
	"street" TEXT NOT NULL,
	"complement" TEXT NOT NULL
);

CREATE TABLE "orders" (
	"id" serial PRIMARY KEY,
	"userId" integer NOT NULL,
	"createdAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
	"addressId" integer NOT NULL REFERENCES "address"("id")
);

CREATE TABLE "productOrders" (
	"id" serial PRIMARY KEY,
	"quantity" integer NOT NULL,
	"orderId" integer NOT NULL REFERENCES "orders"("id"),
	"productId" integer NOT NULL REFERENCES "products"("id")
);



