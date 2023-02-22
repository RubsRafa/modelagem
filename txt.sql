create table users(
    id serial primary key, 
    name varchar(100) not null,
    email text unique not null,
    password text not null
    );
create type category as enum ('Camisa', 'Calça', 'Vestido');

create table categories(
    id serial primary key,
    type category not null
);

create type size as enum ('P', 'M', 'G', 'GG', 'EXG');

create table sizes(
    id serial primary key,
    type size not null
);
create table products(
    id serial primary key,
    name varchar(255) not null,
    price integer not null,
    main_image text not null,
    second_image text,
    third_image text,
    id_category integer not null references categories(id),
    id_size integer not null references sizes(id)
);
create table sales(
    id serial primary key,
    id_product integer not null references products(id),
    id_user integer not null references users(id),
    quantity integer not null
);
create type status as enum ('criada','paga','entregue', 'cancelada');

create table purchase_progress(
    id serial primary key,
    id_sales integer not null references sales(id),
    status status not null
);
create table sales_users_info(
    id serial primary key,
    id_user integer not null references users(id),
    date_bought date not null,
    street text not null,
    number varchar(10) not null,
    complement text,
    city text not null,
    state text not null,
    cep varchar(8) not null
);