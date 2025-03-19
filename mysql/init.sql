CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255),
    stock INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    quantity INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

INSERT INTO books (title, author, description, price, image_url, stock) VALUES
('Мастер и Маргарита', 'Михаил Булгаков', 'Великий мистический роман о визите Воланда в Москву, любви и вечной борьбе добра со злом', 2499, 'https://cdn.culture.ru/images/a0e70f0b-2ace-5f45-9fd7-b038ea2d3a56', 15),
('Метро 2033', 'Дмитрий Глуховский', 'Постапокалиптический роман о выживших в московском метро после ядерной войны', 1749, 'https://avatars.mds.yandex.net/i?id=5df81b33f7d0f9c0d674fd8f19927533_l-8497314-images-thumbs&n=13', 20),
('Тень ветра', 'Карлос Руис Сафон', 'Мистический детектив о книжном лабиринте и загадочном авторе в послевоенной Барселоне', 1899, 'https://i.pinimg.com/originals/5d/63/21/5d632160074b718629cb6e34208d9f83.png', 12),
('Цветы для Элджернона', 'Дэниел Киз', 'Трогательная история об умственно отсталом уборщике, ставшем гением благодаря научному эксперименту', 1599, 'https://ussrwine.site/uploads/cache/img_A_110534_6988df90cb4d581fcf23e258d83a5d3c-800x800.jpg', 18),
('Дюна', 'Фрэнк Герберт', 'Эпическая сага о пустынной планете Арракис, специях и борьбе за власть в галактической империи', 2199, 'https://cdn.culture.ru/images/a0e70f0b-2ace-5f45-9fd7-b038ea2d3a56', 25);
