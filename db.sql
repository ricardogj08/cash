CREATE DATABASE IF NOT EXISTS cash
    CHARACTER SET = 'utf8mb4'
    COLLATE = 'utf8mb4_spanish_ci';

USE cash;

CREATE TABLE IF NOT EXISTS roles (
    id TINYINT UNSIGNED NOT NULL,
    name VARCHAR(8) NOT NULL,
    description VARCHAR(16) NOT NULL,
    CONSTRAINT roles_id_pk PRIMARY KEY(id),
    CONSTRAINT roles_name_uk UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS users (
    id CHAR(36) NOT NULL DEFAULT UUID(),
    email VARCHAR(256) NOT NULL,
    role_id TINYINT UNSIGNED NOT NULL,
    name VARCHAR(64) NOT NULL,
    password VARCHAR(256) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    CONSTRAINT users_id_pk PRIMARY KEY(id),
    CONSTRAINT users_email_uk UNIQUE(email),
    CONSTRAINT users_role_id_fk FOREIGN KEY(role_id)
        REFERENCES roles(id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS products (
    id CHAR(36) NOT NULL DEFAULT UUID(),
    code VARCHAR(64) NOT NULL,
    name VARCHAR(256) NOT NULL,
    price DECIMAL(6, 2) UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    updated_at DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    CONSTRAINT products_id_pk PRIMARY KEY(id),
    CONSTRAINT products_code_uk UNIQUE(code)
);

INSERT IGNORE INTO roles VALUES
    (1, 'admin', 'Administrador'),
    (2, 'cashier', 'Cajero');

INSERT IGNORE INTO users(email, role_id, name, password) VALUES
    ('admin@example.com', 1, 'admin', 'd83f900baedb967c3b4e5fb5411abb4ea1986b018804bfea9887345626e9a36efb711872a76fa212ab83e634f96bb7c711808bc8231db849777361eb7ae409db
');
