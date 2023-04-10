CREATE TABLE person_discounts
(
    id          bigint primary key,
    person_id   bigint not null,
    pizzeria_id bigint not null,
    discount    numeric,
    CONSTRAINT fk_person_discounts_person_id foreign key (person_id) REFERENCES person,
    CONSTRAINT fk_pizzeria_discounts_pizzeria_id foreign key (pizzeria_id) REFERENCES pizzeria
);