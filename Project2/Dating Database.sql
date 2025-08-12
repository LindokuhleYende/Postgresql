CREATE TABLE my_contacts(
  contact_id integer NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  phone varchar(10) NOT NULL,
  email varchar(60) NOT NULL,
  gender varchar(50) NOT NULL,
  birthday date NOT NULL,
  profession_prof_id integer NOT NULL,
  zip_code_zip_code integer NOT NULL,
  status_status_id integer NOT NULL,
  CONSTRAINT my_contacts_pkey PRIMARY KEY(contact_id)
);


CREATE TABLE profession(
prof_id integer NOT NULL, profession varchar(60) NOT NULL,
  CONSTRAINT profession_prof_id_key UNIQUE(prof_id)
);


CREATE TABLE interest(
interest_id integer NOT NULL, interest float4 NOT NULL,
  CONSTRAINT interest_pkey PRIMARY KEY(interest_id)
);


CREATE TABLE contact_interest(
contact_id integer NOT NULL, interest_interest_id integer NOT NULL,
  CONSTRAINT contact_interest_pkey PRIMARY KEY(contact_id, interest_interest_id)
);


CREATE TABLE zip_code(
  zip_code integer NOT NULL,
  city varchar(50) NOT NULL,
  "State" varchar(50) NOT NULL,
  CONSTRAINT zip_code_zip_code_key UNIQUE(zip_code)
);


CREATE TABLE status(
status_id integer NOT NULL, status varchar(50) NOT NULL,
  CONSTRAINT status_pkey PRIMARY KEY(status_id)
);


CREATE TABLE seeking(
seeking_id integer NOT NULL, seeking numeric NOT NULL,
  CONSTRAINT seeking_pkey PRIMARY KEY(seeking_id)
);


CREATE TABLE contact_seeking(
contact_id integer NOT NULL, seeking_id integer NOT NULL,
  CONSTRAINT contact_seeking_pkey PRIMARY KEY(contact_id, seeking_id)
);


ALTER TABLE contact_interest
  ADD CONSTRAINT contact_interest_contact_id_fkey
    FOREIGN KEY (contact_id) REFERENCES my_contacts (contact_id)
;


ALTER TABLE contact_interest
  ADD CONSTRAINT contact_interest_interest_interest_id_fkey
    FOREIGN KEY (interest_interest_id) REFERENCES interest (interest_id)
;


ALTER TABLE my_contacts
  ADD CONSTRAINT my_contacts_profession_prof_id_fkey
    FOREIGN KEY (profession_prof_id) REFERENCES profession (prof_id)
;


ALTER TABLE my_contacts
  ADD CONSTRAINT my_contacts_zip_code_zip_code_fkey
    FOREIGN KEY (zip_code_zip_code) REFERENCES zip_code (zip_code)
;


ALTER TABLE my_contacts
  ADD CONSTRAINT my_contacts_status_status_id_fkey
    FOREIGN KEY (status_status_id) REFERENCES status (status_id)
;


ALTER TABLE contact_seeking
  ADD CONSTRAINT contact_seeking_contact_id_fkey
    FOREIGN KEY (contact_id) REFERENCES my_contacts (contact_id)
;


ALTER TABLE contact_seeking
  ADD CONSTRAINT contact_seeking_seeking_id_fkey
    FOREIGN KEY (seeking_id) REFERENCES seeking (seeking_id)
;

