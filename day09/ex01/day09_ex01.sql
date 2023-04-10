CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    returns trigger as $$
begin
insert into person_audit(type_event, row_id, name, age, gender, address)
SELECT 'U', old.*;
return null;
end;
$$ language plpgsql;

CREATE TRIGGER trg_person_update_audit
    after update on person for each row
    execute procedure fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
--
-- DELETE FROM person
-- WHERE id = 10;