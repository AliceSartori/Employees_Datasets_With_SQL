# sql-challenge

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files (Folder 'New Data').
After sketching an ERD and importing it into a SQL database, I performed some queries with PostgreSQL (file Global_Employees.sql).

As I examined the data, I noticed that the data looks suspicious and the dataset could be fake. 

To confirm my suspicions,, I used SQLAlchemy and Pandas to investigate further:
![Salary Ranges for Employees](https://github.com/AliceSartori/sql-challenge/blob/main/Salary%20ranges%20for%20employees.png)


![Average Salay By Title](https://github.com/AliceSartori/sql-challenge/blob/main/Average%20salary%20by%20Title.png)


![Average Salay By Title](https://github.com/AliceSartori/sql-challenge/blob/main/Average%20salary%20by%20Sex.png)

It looks like the salary ranges are all very low (inflation could be a factor here as the CSV refer to the 80' and 90'), but engineering jobs are paid less than other types of jobs (staff). 
Also, there is no discrepancy between M and W salaries, which seems to equal each other. Historically, Men were paid much more than Women.
It seems these CSVs were created ad hoc to challange my skills.

Challenge accepted!!!
