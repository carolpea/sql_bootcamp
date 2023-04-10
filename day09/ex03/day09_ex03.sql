DROP TRIGGER trg_person_delete_audit on person;
DROP TRIGGER trg_person_update_audit on person;
DROP TRIGGER trg_person_insert_audit ON person;

-- DROP FUNCTION fnc_trg_person_update_audit CASCADE;
-- DELETE FROM person_audit
-- WHERE row_id BETWEEN 10 AND 11;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        SELECT new.*;
        RETURN null;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
        SELECT 'U', old.*;
        RETURN null;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
        SELECT 'D', old.*;
        RETURN null;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE ON person FOR EACH ROW
execute procedure fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

DELETE FROM person WHERE id = 10;

-- DELETE FROM person_audit WHERE row_id = 10;