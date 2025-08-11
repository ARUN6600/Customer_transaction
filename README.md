# Customer_transaction

#Customer Transaction Data Cleaning

This repository contains SQL scripts to clean the Customer_Transaction dataset by addressing missing values, duplicates, and inconsistent formats.
Tasks Performed.

Replaced missing emails with Unknown@example.com.
Removed duplicate phone numbers, keeping the earliest TransactionID.
Added .com to incomplete email addresses.
Standardized "Card" to "Credit Card" in PaymentMethod.
Deleted failed transactions.
Set negative PurchaseAmount values to NULL.
Capitalized the first letter of CustomerName.

#Files

Data Cleaning Queries.sql: SQL queries for cleaning tasks.
Data Cleaning Task.sql: Lists the cleaning objectives.

#Notes

Assumes columns: Email, PhoneNumber, TransactionID, PaymentMethod, Status, PurchaseAmount, CustomerName.
Adapt queries for different table structures.
