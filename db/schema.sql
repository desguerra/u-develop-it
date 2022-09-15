/* `candidates` table must be dropped before the parties table due to 
the foreign key constraint that requires the `parties` table to exist */
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;

/* create a table named `parties` */
CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

/* create a table named `candidates` */
CREATE TABLE candidates (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  party_id INTEGER,
  industry_connected BOOLEAN NOT NULL,
  /* allows us to flag the party_id field as an official 
  foreign key and tells SQL which table and field it references */
  /* constraint relies on the `parties` table, so the `parties` 
  table MUST be defined first before `candidates` */
  /* `ON DELETE SET NULL` to tell SQL to set a candidate's `party_id` 
  field to `NULL` if the corresponding row in `parties` is ever deleted */
  CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);