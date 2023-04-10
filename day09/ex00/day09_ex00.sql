CREATE TABLE person_audit
(
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id bigint,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null ,
    address varchar
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    returns trigger as $$
    begin
        insert into person_audit(row_id, name, age, gender, address)
        SELECT new.*;
        return null;
    end;
$$ language plpgsql;

CREATE TRIGGER trg_person_insert_audit
    after insert on person for each row
execute procedure fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- DELETE FROM person
-- WHERE id BETWEEN 10 AND 13;