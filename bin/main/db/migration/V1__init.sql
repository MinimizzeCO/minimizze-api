    create table marca (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB charset=utf8;