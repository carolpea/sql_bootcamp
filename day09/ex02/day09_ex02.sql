CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    returns trigger as $$
begin
insert into person_audit(type_event, row_id, name, age, gender, address)
SELECT 'D', old.*;
return null;
end;
$$ language plpgsql;

CREATE TRIGGER trg_person_delete_audit
    after DELETE on person for each row
    execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id BETWEEN 10 AND 11;
