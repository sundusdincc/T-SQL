--Duplicate values are allowed--
CREATE INDEX index_name
ON table_name (column1, column2, ...);


--Duplicate values are not allowed--
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);


CREATE INDEX idx_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

--Used to delete an index in a table--
DROP INDEX table_name.index_name;
