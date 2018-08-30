
    create table categoria_produto (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        created_at datetime(6),
        updated_at datetime(6),
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)

    create table categoria_produto (
       id bigint not null auto_increment,
        nome varchar(255),
        categoria_produto_pai_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra (
       id bigint not null auto_increment,
        nome varchar(255),
        status bit not null,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table lista_compra_orcamentos (
       lista_compra_id bigint not null,
        orcamentos_id bigint not null
    ) engine=InnoDB

    create table lista_compra_produtos (
       lista_compra_id bigint not null,
        produtos_id bigint not null
    ) engine=InnoDB

    create table marca (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table orcamento (
       id bigint not null auto_increment,
        nome varchar(255),
        similar bit not null,
        lista_compra_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table orcamento_ponto_vendas (
       orcamento_id bigint not null,
        ponto_vendas_id bigint not null
    ) engine=InnoDB

    create table orcamento_preco_produto (
       orcamento_id bigint not null,
        preco_produto_id bigint not null
    ) engine=InnoDB

    create table ponto_venda (
       id bigint not null auto_increment,
        descricao varchar(255),
        foto longblob,
        latitude integer not null,
        longitude integer not null,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        rede_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table preco_produto (
       id bigint not null auto_increment,
        pontuacao integer not null,
        preco double precision,
        valido bit,
        ponto_venda_id bigint,
        produto_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto (
       id bigint not null auto_increment,
        codigo_barra varchar(255) not null,
        foto longblob,
        nome varchar(255),
        pontuacao integer not null,
        qtd_medida double precision,
        valido bit,
        categoria_produto_id bigint,
        marca_id bigint,
        unidade_medida_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table produto_lista_compra (
       produto_id bigint not null,
        lista_compra_id bigint not null
    ) engine=InnoDB

    create table produto_similares (
       produto_id bigint not null,
        similares_id bigint not null
    ) engine=InnoDB

    create table rede (
       id bigint not null auto_increment,
        nome varchar(255),
        pontuacao integer not null,
        valido bit,
        primary key (id)
    ) engine=InnoDB

    create table similar (
       id bigint not null auto_increment,
        produto_origem_id bigint,
        user_id bigint,
        primary key (id)
    ) engine=InnoDB

    create table similar_produtos_similares (
       similar_id bigint not null,
        produtos_similares_id bigint not null
    ) engine=InnoDB

    create table unidade_medida (
       id bigint not null auto_increment,
        nome varchar(255),
        sigla varchar(255),
        primary key (id)
    ) engine=InnoDB

    create table user (
       id bigint not null auto_increment,
        email varchar(255),
        fbid varchar(255),
        nome varchar(255),
        pontuacao integer not null,
        primary key (id)
    ) engine=InnoDB

    create table user_favoritos (
       user_id bigint not null,
        favoritos_id bigint not null
    ) engine=InnoDB

    alter table lista_compra_orcamentos 
       drop index UK_9iw3bldkbpc0keu386q3nn3nb

    alter table lista_compra_orcamentos 
       add constraint UK_9iw3bldkbpc0keu386q3nn3nb unique (orcamentos_id)

    alter table user 
       drop index UKob8kqyqqgmefl0aco34akdtpe

    alter table user 
       add constraint UKob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table categoria_produto 
       add constraint FK5xq3gbjvkjav3x56qj41g5p1e 
       foreign key (categoria_produto_pai_id) 
       references categoria_produto (id)

    alter table lista_compra 
       add constraint FKd4rjli4fyaj493nlubhjtv6fa 
       foreign key (user_id) 
       references user (id)

    alter table lista_compra_orcamentos 
       add constraint FK427a2ub1k4gtyivdt6psbja23 
       foreign key (orcamentos_id) 
       references orcamento (id)

    alter table lista_compra_orcamentos 
       add constraint FKdc3yi7gcwuw58uehry1dyot06 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table lista_compra_produtos 
       add constraint FKll9r6btjj7fa0b1sqi7ayv936 
       foreign key (produtos_id) 
       references produto (id)

    alter table lista_compra_produtos 
       add constraint FKdjiuomelusitdols4wxhsb91w 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento 
       add constraint FKog7gpy4na2jhl3pva0en2lwss 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table orcamento_ponto_vendas 
       add constraint FK36acoqpns8pkjqgpuyrs9ws8d 
       foreign key (ponto_vendas_id) 
       references ponto_venda (id)

    alter table orcamento_ponto_vendas 
       add constraint FKk52p08axfwmgtk7y4cfpapr0t 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table orcamento_preco_produto 
       add constraint FKnvloke08qjhyqdtrmp5qtta8p 
       foreign key (preco_produto_id) 
       references preco_produto (id)

    alter table orcamento_preco_produto 
       add constraint FKehm2iwklqmhqsj3b9s8pksb7o 
       foreign key (orcamento_id) 
       references orcamento (id)

    alter table ponto_venda 
       add constraint FKpgal5f1p2ttbkixycugqdu8f1 
       foreign key (rede_id) 
       references rede (id)

    alter table preco_produto 
       add constraint FKi69ed18juxs9e1q0dlf0cv1tj 
       foreign key (ponto_venda_id) 
       references ponto_venda (id)

    alter table preco_produto 
       add constraint FKql1woy8t37mjj96lyiflhfd85 
       foreign key (produto_id) 
       references produto (id)

    alter table preco_produto 
       add constraint FKtc3tkagaoi8qf31sdo6iilav8 
       foreign key (user_id) 
       references user (id)

    alter table produto 
       add constraint FKrbuq25gvnudtlehjqc3ps0vhs 
       foreign key (categoria_produto_id) 
       references categoria_produto (id)

    alter table produto 
       add constraint FKjwfodivt9e04sad1s7u0ya4jq 
       foreign key (marca_id) 
       references marca (id)

    alter table produto 
       add constraint FKjr47qxuim8x2c4po42keccqdd 
       foreign key (unidade_medida_id) 
       references unidade_medida (id)

    alter table produto 
       add constraint FKokvqal41t8l71vc64dmpw2k4u 
       foreign key (user_id) 
       references user (id)

    alter table produto_lista_compra 
       add constraint FKq84mw5c5g3e4bceqos0figp6f 
       foreign key (lista_compra_id) 
       references lista_compra (id)

    alter table produto_lista_compra 
       add constraint FKodoae4qofk8f8v0ejs7pydqoq 
       foreign key (produto_id) 
       references produto (id)

    alter table produto_similares 
       add constraint FKr3k9tekkjsknpaedutlg8iknx 
       foreign key (similares_id) 
       references similar (id)

    alter table produto_similares 
       add constraint FKaqw7elwosbs2weigukmnqx4gl 
       foreign key (produto_id) 
       references produto (id)

    alter table similar 
       add constraint FKj8fdx5nbup2ec05u3rr6icoet 
       foreign key (produto_origem_id) 
       references produto (id)

    alter table similar 
       add constraint FK71gl5l12mg84vtcc9omb6o88q 
       foreign key (user_id) 
       references user (id)

    alter table similar_produtos_similares 
       add constraint FKkxa331tf5flw31h13k7lqeh71 
       foreign key (produtos_similares_id) 
       references produto (id)

    alter table similar_produtos_similares 
       add constraint FK2jkmfcdxsyi4mwpeakxa6tfj 
       foreign key (similar_id) 
       references similar (id)

    alter table user_favoritos 
       add constraint FKg0iabckjb9yvog86rm16enldp 
       foreign key (favoritos_id) 
       references produto (id)

    alter table user_favoritos 
       add constraint FKe6ff496l7cypcw2966in96it3 
       foreign key (user_id) 
       references user (id)
