/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL,
    name varchar(30),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD species varchar(100);  /*ALTER command is for changing the structure(It help us to adding a forgotten column, for our case it's species column)*/

--Create a table named owners
CREATE TABLE owners(
   id INT PRIMARY KEY,
   full_name VARCHAR(255),
   age INT
);

--Create a table named species
CREATE TABLE species(
   id INT,
   name VARCHAR(255),
   PRIMARY KEY(id)
   );

   --Modify animals table:

--Remove column species
ALTER TABLE animals DROP COLUMN species;

--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);
