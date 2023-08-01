-- create patients table:
CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    data_of_birth DATE
);

-- Create medical hestories table:
CREATE TABLE medical_hestories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admotted_at TIMESTAMP,
    patient_id INT FOREIGN KEY REFERENCES patients(id),
    status VARCHAR
);

-- Create table treatments:
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR,
    name VARCHAR
);

--Create join table for many to many relationship between medical_hestories and treatments tables:
CREATE TABLE medical_hestories_for_treatments(
    medical_hestories_id INT FOREIGN KEY REFERENCES medical_hestories(id),
    treatments_id INT FOREIGN KEY REFERENCES treatments(id)
);

-- Create invoices table:
CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount Float,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_hestory_id FOREIGN KEY REFERENCES medical_hestories(id)
);

-- Create table invoice items:
CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price Float,
    quantity INT,
    total_price Float,
    invoice_id INT FOREIGN KEY REFERENCES invoices(id),
    treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);