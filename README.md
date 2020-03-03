# Modeling-Engineering-Analysis

![sql.jpg](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/sql.jpg)

## Background

My task here was a research project on employees of this corporation from the 1980s and 1990s. All that remained of the database of employees from this period are six CSV files.

I designed tables to hold data in the CSVs, imported the CSVs into a SQL database, and queried the data using Python/Pandas/Jupyter Notebook.

### Data Modeling
After inspecting the CSVs, I sketched out an entity relationship diagram (ERD) of the tables
![ERD.png](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/ERD%20(Entity%20Relationship%20Diagram).png)

### Data Engineering
Using the ERD, I created a table schema for each of the CSV files.
I specified data types, primary keys, foreign keys, and other constraints.
![sql screenshot](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/table_schemata.png)
I then imported each CSV file into its corresponding SQL table.

### Data Analysis
The following are a sample of the queries run:
* Listing the employee number, last name, first name, gender, and salary of each employee
* Listing the manager of each department with specific information
* Listing all employees in Sales, including their employee number, last name, first name, and department name
* In descending order, listing the frequency count of employee last names


### Generating a visualization of the data
I imported the SQL database into Pandas. Using the Python SQL toolkit and Object Relational Mapper "SQLAlchemy", I used the `create_engine` function to interact directly with the database using Jupyter Notebook.
![pandas.png](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/juypter_dependencies.png)

I used `SELECT` statements to call in the "salaries" and "titles" tables from the SQL database,
![select](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/select_tables.png)
then combined the dataframes in order to better aggregate the data.
![combine](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/finding_mean.png)
I then found the mean salary of each job title,
![mean](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/mean.png)
before using the Python plotting library `Matplotlib` to create a bar graph visualization.
![bar graph](https://github.com/jbizzlefoshizzle/Modeling-Engineering-Analysis/blob/master/images/bar_graph.png)
