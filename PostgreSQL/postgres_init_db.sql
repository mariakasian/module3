CREATE TABLE worker (
    worker_id BIGSERIAL PRIMARY KEY,
    wname VARCHAR(1000) NOT NULL,
    birthday DATE,
    wlevel VARCHAR(10) NOT NULL,
    salary INTEGER,
    CONSTRAINT name_values CHECK (LENGTH(wname) >= 2 AND LENGTH(wname) <= 1000),
    CONSTRAINT birthday_values CHECK (DATE(birthday) >= '1900-01-01'),
    CONSTRAINT level_values CHECK (wlevel IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    CONSTRAINT salary_values CHECK (salary >=100 AND salary <=100000)
);

CREATE TABLE client (
    client_id BIGSERIAL PRIMARY KEY,
    cname VARCHAR(1000) NOT NULL,
    CONSTRAINT cname_values CHECK (LENGTH(cname) >= 2 AND LENGTH(cname) <= 1000)
);

CREATE TABLE project (
    project_id BIGSERIAL PRIMARY KEY,
    pname VARCHAR(300),
    client_id BIGINT,
    start_date DATE,
    finish_date DATE,
    FOREIGN KEY(client_id) REFERENCES client(client_id)
);

CREATE TABLE project_worker (
    project_id BIGINT,
    worker_id BIGINT,
    PRIMARY KEY(project_id, worker_id),
    FOREIGN KEY(project_id) REFERENCES project(project_id),
    FOREIGN KEY(worker_id) REFERENCES worker(worker_id)
);
