--THIS IS SCRIPT FOR EBANK DATABASE USED IN THIS TRAINING
--EDITED BY Rupinder
--Questions: Send to training@enterprisedb.com


CREATE USER euser PASSWORD 'e12345';
CREATE DATABASE ebank OWNER euser;
\c ebank

CREATE SCHEMA euser;
ALTER SCHEMA euser OWNER TO euser;

SET search_path = euser, pg_catalog;

CREATE TABLE account_holder (
    account_id character(10) NOT NULL,
    registration_id integer NOT NULL,
    balance money NOT NULL
);
ALTER TABLE account_holder OWNER TO euser;

CREATE TABLE account_holder_transaction (
    account_id character(10) NOT NULL,
    date_of_transaction timestamp without time zone NOT NULL,
    particulars character varying(50) NOT NULL,
    check_no character(10),
    amount money NOT NULL
);
ALTER TABLE account_holder_transaction OWNER TO euser;

CREATE TABLE counter (
    counter_id character(10) NOT NULL,
    address character(50) NOT NULL,
    cashbalance money NOT NULL,
    minbalance money NOT NULL
);
ALTER TABLE counter OWNER TO euser;

CREATE TABLE counter_transaction (
    transaction_id character(10) NOT NULL,
    counter_id character(10) NOT NULL,
    account_id character(10) NOT NULL,
    date_of_transaction timestamp without time zone NOT NULL,
    debit_amount money,
    credit_amount money
);
ALTER TABLE counter_transaction OWNER TO euser;

CREATE TABLE loan (
    loan_id character(10) NOT NULL,
    loan_type character(15) NOT NULL,
    rate integer NOT NULL,
    loan_period integer NOT NULL,
    instalment integer NOT NULL
);
ALTER TABLE loan OWNER TO euser;

CREATE TABLE loan_details (
    loan_id character(10) NOT NULL,
    loan_registration_id character(10) NOT NULL,
    loan_amount money NOT NULL,
    loan_amount_repaid money NOT NULL,
    balance money NOT NULL,
    date_of_sanction timestamp without time zone NOT NULL,
    bal_no_installments integer NOT NULL
);
ALTER TABLE loan_details OWNER TO euser;

CREATE TABLE loan_registration (
    loan_registration_id character(10) NOT NULL,
    first_name character(10) NOT NULL,
    last_name character(10) NOT NULL,
    address character(60) NOT NULL,
    loan_type character(10) NOT NULL,
    phone character(10) NOT NULL,
    annual_income money NOT NULL,
    amount_applied money NOT NULL
);
ALTER TABLE loan_registration OWNER TO euser;

CREATE TABLE login (
    account_id character(10) NOT NULL,
    pin_no character(10) NOT NULL
);
ALTER TABLE login OWNER TO euser;

CREATE TABLE registration (
    registration_id integer NOT NULL,
    firstname character(50) NOT NULL,
    lastname character(50) NOT NULL,
    address character(50) NOT NULL,
    account_type character(30) NOT NULL,
    annual_income money,
    phone_no character(10) NOT NULL
);
ALTER TABLE registration OWNER TO euser;

CREATE SEQUENCE registration_registration_id_seq
    START WITH 100
    INCREMENT BY 1
    MINVALUE 100
    NO MAXVALUE
    CACHE 1;
ALTER TABLE registration_registration_id_seq OWNER TO euser;
ALTER SEQUENCE registration_registration_id_seq OWNED BY registration.registration_id;
ALTER TABLE ONLY registration ALTER COLUMN registration_id SET DEFAULT nextval('registration_registration_id_seq'::regclass);


INSERT INTO account_holder (account_id, registration_id, balance) VALUES ('AH0001    ', 100, '$500,000.00');
INSERT INTO account_holder (account_id, registration_id, balance) VALUES ('AH0002    ', 101, '$100,000.00');
INSERT INTO account_holder (account_id, registration_id, balance) VALUES ('AH0003    ', 102, '$100,000.00');
INSERT INTO account_holder (account_id, registration_id, balance) VALUES ('AH0004    ', 103, '$150,000.00');
INSERT INTO account_holder (account_id, registration_id, balance) VALUES ('AH0005    ', 104, '$145,000.00');

INSERT INTO account_holder_transaction (account_id, date_of_transaction, particulars, check_no, amount) VALUES ('AH0001    ', '2015-07-24 00:00:00', 'Cheque deposit', '234123    ', '$2,250.00');
INSERT INTO account_holder_transaction (account_id, date_of_transaction, particulars, check_no, amount) VALUES ('AH0002    ', '2015-07-14 00:00:00', 'Cheque deposit', '234455    ', '$5,000.00');
INSERT INTO account_holder_transaction (account_id, date_of_transaction, particulars, check_no, amount) VALUES ('AH0003    ', '2015-07-04 00:00:00', 'Withdrawal', '0         ', '$36,000.00');
INSERT INTO account_holder_transaction (account_id, date_of_transaction, particulars, check_no, amount) VALUES ('AH0004    ', '2015-07-24 00:00:00', 'Withdrawal', '0         ', '$3,000.00');
INSERT INTO account_holder_transaction (account_id, date_of_transaction, particulars, check_no, amount) VALUES ('AH0005    ', '2015-07-09 00:00:00', 'Cheque deposit', '289756    ', '$165,000.00');

INSERT INTO counter (counter_id, address, cashbalance, minbalance) VALUES ('CT0001    ', 'Hummingway Street NY                              ', '$8,000.00', '$50,000.00');
INSERT INTO counter (counter_id, address, cashbalance, minbalance) VALUES ('CT0002    ', 'Timothy Square NY                                 ', '$9,000.00', '$50,000.00');
INSERT INTO counter (counter_id, address, cashbalance, minbalance) VALUES ('CT0003    ', 'Sunley Estate AB                                  ', '$15,000.00', '$70,000.00');
INSERT INTO counter (counter_id, address, cashbalance, minbalance) VALUES ('CT0004    ', 'Bayer House LS                                    ', '$50,000.00', '$50,000.00');
INSERT INTO counter (counter_id, address, cashbalance, minbalance) VALUES ('CT0005    ', 'Mackinnon Street AB                               ', '$45,000.00', '$80,000.00');

INSERT INTO counter_transaction (transaction_id, counter_id, account_id, date_of_transaction, debit_amount, credit_amount) VALUES ('TD0001    ', 'CT0002    ', 'AH0002    ', '2015-05-02 00:00:00', '$0.00', '$11,000.00');
INSERT INTO counter_transaction (transaction_id, counter_id, account_id, date_of_transaction, debit_amount, credit_amount) VALUES ('TD0002    ', 'CT0001    ', 'AH0005    ', '2015-07-24 00:00:00', '$0.00', '$20,000.00');
INSERT INTO counter_transaction (transaction_id, counter_id, account_id, date_of_transaction, debit_amount, credit_amount) VALUES ('TD0003    ', 'CT0003    ', 'AH0001    ', '2015-07-12 00:00:00', '$25,000.00', '$0.00');
INSERT INTO counter_transaction (transaction_id, counter_id, account_id, date_of_transaction, debit_amount, credit_amount) VALUES ('TD0004    ', 'CT0004    ', 'AH0004    ', '2015-08-24 00:00:00', '$0.00', '$50,000.00');
INSERT INTO counter_transaction (transaction_id, counter_id, account_id, date_of_transaction, debit_amount, credit_amount) VALUES ('TD0005    ', 'CT0005    ', 'AH0003    ', '2015-02-24 00:00:00', '$70,000.00', '$0.00');

INSERT INTO loan (loan_id, loan_type, rate, loan_period, instalment) VALUES ('L0001     ', 'PL             ', 19, 3, 36);
INSERT INTO loan (loan_id, loan_type, rate, loan_period, instalment) VALUES ('L0002     ', 'CL             ', 20, 5, 60);
INSERT INTO loan (loan_id, loan_type, rate, loan_period, instalment) VALUES ('L0003     ', 'HL             ', 15, 10, 120);
INSERT INTO loan (loan_id, loan_type, rate, loan_period, instalment) VALUES ('L0004     ', 'SL             ', 10, 7, 94);
INSERT INTO loan (loan_id, loan_type, rate, loan_period, instalment) VALUES ('L0005     ', 'BL             ', 21, 5, 60);

INSERT INTO loan_details (loan_id, loan_registration_id, loan_amount, loan_amount_repaid, balance, date_of_sanction, bal_no_installments) VALUES ('L0001     ', 'LD002     ', '$300,000.00', '$50,000.00', '$250,000.00', '2015-04-02 00:00:00', 30);
INSERT INTO loan_details (loan_id, loan_registration_id, loan_amount, loan_amount_repaid, balance, date_of_sanction, bal_no_installments) VALUES ('L0002     ', 'LD003     ', '$400,000.00', '$400,000.00', '$0.00', '2015-05-15 00:00:00', 0);
INSERT INTO loan_details (loan_id, loan_registration_id, loan_amount, loan_amount_repaid, balance, date_of_sanction, bal_no_installments) VALUES ('L0003     ', 'LD005     ', '$1,200,000.00', '$400,000.00', '$800,000.00', '2015-06-12 00:00:00', 34);
INSERT INTO loan_details (loan_id, loan_registration_id, loan_amount, loan_amount_repaid, balance, date_of_sanction, bal_no_installments) VALUES ('L0004     ', 'LD004     ', '$300,000.00', '$275,000.00', '$25,000.00', '2015-06-08 00:00:00', 1);
INSERT INTO loan_details (loan_id, loan_registration_id, loan_amount, loan_amount_repaid, balance, date_of_sanction, bal_no_installments) VALUES ('L0003     ', 'LD001     ', '$350,000.00', '$300,000.00', '$50,000.00', '2015-06-06 00:00:00', 2);

INSERT INTO loan_registration (loan_registration_id, first_name, last_name, address, loan_type, phone, annual_income, amount_applied) VALUES ('LD001     ', 'Jonas     ', 'Smith     ', '15, Mackinnon Street AB 31435                               ', 'PL        ', '91434556  ', '$500,000.00', '$100,000.00');
INSERT INTO loan_registration (loan_registration_id, first_name, last_name, address, loan_type, phone, annual_income, amount_applied) VALUES ('LD002     ', 'Jullianne ', 'Andrews   ', '27A, Bayer House LS 22534                                   ', 'HL        ', '91535445  ', '$700,000.00', '$400,000.00');
INSERT INTO loan_registration (loan_registration_id, first_name, last_name, address, loan_type, phone, annual_income, amount_applied) VALUES ('LD003     ', 'Bob       ', 'Anderson  ', '143/C, Hummingway Street NY 259CA                           ', 'BL        ', '97645676  ', '$1,400,000.00', '$400,000.00');
INSERT INTO loan_registration (loan_registration_id, first_name, last_name, address, loan_type, phone, annual_income, amount_applied) VALUES ('LD004     ', 'Othello   ', 'Darwin    ', '23, Sunley Estate AB 13246                                  ', 'CL        ', '45634523  ', '$500,000.00', '$200,000.00');
INSERT INTO loan_registration (loan_registration_id, first_name, last_name, address, loan_type, phone, annual_income, amount_applied) VALUES ('LD005     ', 'Jesse     ', 'Barkins   ', '45QS, Timothy Square NY 147CG                               ', 'SL        ', '23456734  ', '$100,000.00', '$75,000.00');

INSERT INTO login (account_id, pin_no) VALUES ('AH0001    ', '1001      ');
INSERT INTO login (account_id, pin_no) VALUES ('AH0002    ', '1005      ');
INSERT INTO login (account_id, pin_no) VALUES ('AH0003    ', '1251      ');
INSERT INTO login (account_id, pin_no) VALUES ('AH0004    ', '6129      ');
INSERT INTO login (account_id, pin_no) VALUES ('AH0005    ', '6613      ');



INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (100, 'Diana                                             ', 'Helbert                                           ', 'Bay Road, Singapore 5892                          ', 'Savings                       ', '$340,000.00', '02163467  ');
INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (101, 'Jim                                               ', 'Hopkins                                           ', 'Stockholm street, SW 678902                       ', 'Current                       ', '$600,000.00', '032234    ');
INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (102, 'Diana                                             ', 'Hayden                                            ', '10 Hays Street,NY 30570                           ', 'Savings                       ', '$240,000.00', '045678    ');
INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (103, 'Bob                                               ', 'Meakins                                           ', '23 SunLey House, AB 45678                         ', 'Fixed Deposit                 ', '$400,000.00', '02145     ');
INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (104, 'Laurry                                            ', 'Helbert                                           ', 'Rock St.Seattle 234657                            ', 'Fixed Deposit                 ', '$450,000.00', '0416348   ');
INSERT INTO registration (registration_id, firstname, lastname, address, account_type, annual_income, phone_no) VALUES (105, 'Shane                                             ', 'Cornway                                           ', '25,Mackin St. AB 31435                            ', 'Savings                       ', '$200,000.00', '041656    ');


SELECT pg_catalog.setval('registration_registration_id_seq', 105, true);

ALTER TABLE ONLY account_holder
    ADD CONSTRAINT account_holder_pkey PRIMARY KEY (account_id);
ALTER TABLE ONLY counter
    ADD CONSTRAINT counter_pkey PRIMARY KEY (counter_id);
ALTER TABLE ONLY counter_transaction
    ADD CONSTRAINT counter_transaction_pkey PRIMARY KEY (transaction_id);
ALTER TABLE ONLY loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (loan_id);
ALTER TABLE ONLY loan_registration
    ADD CONSTRAINT loan_registration_pkey PRIMARY KEY (loan_registration_id);
ALTER TABLE ONLY registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (registration_id);
ALTER TABLE ONLY account_holder
    ADD CONSTRAINT account_holder_registration_id_fkey FOREIGN KEY (registration_id) REFERENCES registration(registration_id);
ALTER TABLE ONLY account_holder_transaction
    ADD CONSTRAINT account_holder_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES account_holder(account_id);
ALTER TABLE ONLY counter_transaction
    ADD CONSTRAINT counter_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES account_holder(account_id);
ALTER TABLE ONLY counter_transaction
    ADD CONSTRAINT counter_transaction_counter_id_fkey FOREIGN KEY (counter_id) REFERENCES counter(counter_id);
ALTER TABLE ONLY loan_details
    ADD CONSTRAINT loan_details_loan_id_fkey FOREIGN KEY (loan_id) REFERENCES loan(loan_id);
ALTER TABLE ONLY loan_details
    ADD CONSTRAINT loan_details_loan_registration_id_fkey FOREIGN KEY (loan_registration_id) REFERENCES loan_registration(loan_registration_id);
ALTER TABLE ONLY login
    ADD CONSTRAINT login_account_id_fkey FOREIGN KEY (account_id) REFERENCES account_holder(account_id);