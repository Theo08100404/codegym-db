CREATE TABLE members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) not null,
    email VARCHAR(100) not null,
    password VARCHAR(100) not null,
    introduction VARCHAR(1000),
    phonenumber VARCHAR(13),
    cellphonenumber VARCHAR(13),
    created_at DATETIME not null,
    update_at DATETIME not null,
    is_deleted TINYINT(1) DEFAULT 0 
)ENGINE=InnoDB;

CREATE TABLE entries(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT not null REFERENCES members (id),
    chatroom_id INT not null REFERENCES chatrooms (id),
    entried_at DATETIME not null
)ENGINE=InnoDB;;

CREATE TABLE chats(
    id INT PRIMARY KEY AUTO_INCREMENT,
    chat VARCHAR(1000) not null,
    file_name VARCHAR(100),
    chat_user_id INT not null,
    chatroom_id INT not null,
    chated_at DATETIME not null,
    update_user_id INT not null,
    update_at DATETIME,
    is_deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY(chat_user_id,update_user_id) REFERENCES members (id),
    FOREIGN KEY(chatroom_id) REFERENCES chatrooms(id)
)ENGINE=InnoDB;;

CREATE TABLE tasks(
    id INT PRIMARY KEY AUTO_INCREMENT,
    task VARCHAR(1000) not null,
    task_user_id INT not null,
    chatroom_id INT not null,
    deadline DATETIME,
    is_finished TINYINT(1) DEFAULT 0,
    create_user_id INT not null,
    created_at DATETIME not null,
    update_user_id INT not null,
    update_at DATETIME not null,
    is_deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY(task_user_id,create_user_id,update_user_id) REFERENCES members (id),
    FOREIGN KEY(chatroom_id) REFERENCES chatrooms(id)
)ENGINE=InnoDB;;

CREATE TABLE chatrooms(
    id INT PRIMARY KEY AUTO_INCREMENT,
    chatroom_name VARCHAR(100) not null,
    description VARCHAR(1000),
    file_flag TINYINT(1) DEFAULT 1,
    direct_flag TINYINT(1) DEFAULT 0,
    create_user_id INT not null,
    created_at DATETIME not null,
    update_user_id INT not null, 
    update_at DATETIME not null,
    is_deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY(create_user_id,update_user_id) REFERENCES members (id)
)ENGINE=InnoDB;;
