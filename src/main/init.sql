CREATE TABLE IF NOT EXISTS homework.homework
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    CONSTRAINT homework_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS homework.homework
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS homework."Lesson"
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    "updatedAt" timestamp without time zone,
    homework_id bigint NOT NULL,
    CONSTRAINT "Lesson_pkey" PRIMARY KEY (id),
    CONSTRAINT homework_fkey FOREIGN KEY (homework_id)
        REFERENCES homework.homework (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS homework."Lesson"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS homework."Schedule"
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    "updatedAt" timestamp without time zone,
    CONSTRAINT "Schedule_pkey" PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS homework."Schedule"
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS homework.lesson_schedule
(
    lesson_id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    CONSTRAINT lesson_schedule_pkey PRIMARY KEY (lesson_id, schedule_id),
    CONSTRAINT lesson_fkey FOREIGN KEY (lesson_id)
        REFERENCES homework."Lesson" (id),
    CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
        REFERENCES homework."Schedule" (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS homework.lesson_schedule
    OWNER to postgres;


