
1. ADMIN Table
Column	Data Type	Constraints
admin_id	INT	PRIMARY KEY
admin_name	VARCHAR	NOT NULL
admin_email	VARCHAR	UNIQUE, NOT NULL
admin_password	VARCHAR	NOT NULL
permissions	VARCHAR	NULL
  
2. USER Table
Column	Data Type	Constraints
user_id	INT	PRIMARY KEY
user_name	VARCHAR	NOT NULL
user_email	VARCHAR	UNIQUE, NOT NULL
user_password	VARCHAR	NOT NULL
  
3. USER_ADDRESS Table
Column	Data Type	Constraints
user_id	INT	FOREIGN KEY (user_id) REFERENCES USER(user_id)
house_no	VARCHAR	NOT NULL
street	VARCHAR	NOT NULL
city	VARCHAR	NOT NULL
  
4. BILL Table
Column	Data Type	Constraints
bill_id	INT	PRIMARY KEY
bill_date	DATE	NOT NULL
duedate	DATE	NOT NULL
amount	DECIMAL	DERIVED, NOT NULL
units	INT	NOT NULL
status	VARCHAR	NOT NULL
user_id	INT	FOREIGN KEY (user_id) REFERENCES USER(user_id)
  
5. TRANSACTION Table
Column	Data Type	Constraints
transaction_id	INT	PRIMARY KEY
date	DATE	NOT NULL
payable	DECIMAL	NOT NULL
bill_id	INT	FOREIGN KEY (bill_id) REFERENCES BILL(bill_id)
user_id	INT	FOREIGN KEY (user_id) REFERENCES USER(user_id)
  
6. COMPLAINTS Table
Column	Data Type	Constraints
complaint_id	INT	PRIMARY KEY
complaint	TEXT	NOT NULL
complaint_status	VARCHAR	NOT NULL
user_id	INT	FOREIGN KEY (user_id) REFERENCES USER(user_id)
bill_id	INT	FOREIGN KEY (bill_id) REFERENCES BILL(bill_id)
  
7. ADMIN_BILL Table (Relationship: ADMIN generates BILL)
Column	Data Type	Constraints
admin_id	INT	FOREIGN KEY (admin_id) REFERENCES ADMIN(admin_id)
bill_id	INT	FOREIGN KEY (bill_id) REFERENCES BILL(bill_id)
