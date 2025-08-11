1. 
--null email
select * from Customer_Transaction
where Email is null

--Replace with 'Unknown@example.com'
Update Customer_Transaction 
set Email = 'Unknown@example.com'
where Email is null;


2.
--Duplicate number 
select phonenumber, count(phonenumber) as number from Customer_Transaction
group by phoneNumber
having count(phonenumber) > 1

DELETE from Customer_Transaction
where TransactionID not in (
    select min(TransactionID)
    from Customer_Transaction
    group by  PhoneNumber
);


3.
Update Customer_Transaction
set Email = CONCAT(Email,'.com')
where Email not like '%.com';


4.
Update Customer_Transaction
set PaymentMethod = 'Credit Card'
where PaymentMethod = 'Card';


5.
Delete from Customer_Transaction 
where Status ='failed'


6.
select * from Customer_Transaction
Update Customer_Transaction
set PurchaseAmount = null
where PurchaseAmount < 0;


7. 
UPDATE Customer_Transaction  
SET CustomerName = CONCAT(
    UPPER(LEFT(CustomerName, 1)), 
    LOWER(SUBSTRING(CustomerName, 2, LEN(CustomerName)))
)  
WHERE CustomerName IS NOT NULL;
