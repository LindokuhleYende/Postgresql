CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text
);
INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');

SELECT * FROM char_data_types
