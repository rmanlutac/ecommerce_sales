# Ecommerce Sales Dashboard
Project repository for end-to-end ecommerce sales dashboard project.

## Folder directory
1. data - folder where csv files are saved
2. duckdb - folder for duckdb database / datawarehouse
3. ecommerce_sales - dbt project for transformation
4. images - supplementary assets
5. powerbi_dashboard - final output of the project and related assets

## Key challenge encountered
As mentioned in this [article](https://datamonkeysite.com/2022/04/17/using-duckdb-with-powerbi/){:target="_blank"}, the odbc driver for duckdb still has bugs and cannot be used as of the time of the writing. The method used by the author of the article is to read the parquet files rather than accessing the database objects from the duckdb file.

Method used in this project:
Since we have the duckdb library installed in our virtual environment, we used the python connector in power query to access the duckdb database as shown in this sample.
![Alt text](/images/image.png)

Feel free to access the final dashboard [here](https://app.powerbi.com/view?r=eyJrIjoiMzNhNGI3ZTYtYmViMC00NTQyLWI4OTMtZGI3YWUzMjkwOWFhIiwidCI6IjZiNTIwZmEwLWVhNjYtNDg5Yy05OGQ1LTlkNTJlYzA0NjlmNCIsImMiOjF9){:target="_blank"}! 