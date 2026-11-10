# 🏪 Web Quản Lý Pro

Hệ thống quản lý sản phẩm, người dùng và đặt hàng với Spring Boot + Node.js + JavaScript.

## 🏗️ Kiến trúc

```
Browser → Node.js BFF (port 3000) → Spring Boot API (port 8080) → MySQL Database
```

## 📁 Cấu trúc dự án

```
web quản lý/
├── backend/            # Spring Boot REST API (Java)
│   ├── src/main/java/com/quanly/app/
│   │   ├── model/      # Entity classes (User, Product, Order, OrderItem)
│   │   ├── repository/ # JPA Repositories
│   │   ├── controller/ # REST Controllers
│   │   ├── security/   # JWT Auth
│   │   ├── dto/        # Data Transfer Objects
│   │   └── config/     # Spring Security Config
│   └── pom.xml
├── bff/                # Node.js Express (BFF/Gateway)
│   ├── server.js       # Main server
│   └── package.json
├── frontend/           # HTML/CSS/Vanilla JS
│   ├── pages/          # login, dashboard, products, users, orders
│   ├── js/app.js       # Core utilities
│   └── css/style.css   # Main stylesheet
├── start-spring.bat    # Khởi động Spring Boot
└── start-bff.bat       # Khởi động Node.js BFF
```

## 🚀 Hướng dẫn chạy

### Bước 1: Tạo cơ sở dữ liệu MySQL

Đảm bảo MySQL đang chạy, sau đó chạy file [`backend/database/create-database.sql`](backend/database/create-database.sql)
trong MySQL Workbench hoặc bằng MySQL CLI. Ứng dụng mặc định kết nối tới `localhost:3306/quanlydb`.

Nếu tài khoản MySQL có mật khẩu, đặt biến môi trường `DB_PASSWORD` trước khi chạy backend:

```powershell
$env:DB_PASSWORD="mat_khau_mysql"
```

Có thể sao chép [`backend/.env.example`](backend/.env.example) để tham khảo các biến kết nối. Không commit mật khẩu thật vào repository.

### Bước 2: Chạy Spring Boot Backend
```bash
# Mở Terminal 1
cd backend
mvn spring-boot:run
# API sẽ chạy tại: http://localhost:8080/api
```

### Bước 3: Chạy Node.js BFF
```bash
# Mở Terminal 2
cd bff
npm install
npm start
# Server sẽ chạy tại: http://localhost:3000
```

### Bước 4: Truy cập
Mở trình duyệt: **http://localhost:3000**

### 🔑 Tài khoản mẫu
| Tài khoản | Mật khẩu | Vai trò |
|-----------|----------|---------|
| `admin`   | `admin123` | Admin |
| `nguyenvana` | `123456` | User |
| `tranthib`   | `123456` | User |

## 🌟 Tính năng

### 📊 Dashboard
- Thống kê tổng quan: sản phẩm, người dùng, đơn hàng, doanh thu
- Biểu đồ trạng thái đơn hàng
- Danh sách đơn hàng, sản phẩm, người dùng gần đây

### 📦 Quản lý Sản phẩm
- ✅ Danh sách sản phẩm với hình ảnh
- ✅ Thêm / Sửa / Xóa sản phẩm
- ✅ Tìm kiếm theo tên
- ✅ Lọc theo danh mục và trạng thái
- ✅ Xem chi tiết sản phẩm

### 👥 Quản lý Người dùng
- ✅ Danh sách người dùng
- ✅ Thêm / Sửa / Xóa người dùng
- ✅ Phân quyền Admin / User
- ✅ Khóa / mở khóa tài khoản
- ✅ Tìm kiếm và lọc

### 🛒 Quản lý Đặt hàng
- ✅ Danh sách đơn hàng
- ✅ Tạo đơn hàng mới (chọn sản phẩm, số lượng)
- ✅ Cập nhật trạng thái đơn hàng
- ✅ Xóa đơn hàng
- ✅ Lọc theo trạng thái
- ✅ Thống kê doanh thu

## 🔌 API Endpoints

### Auth
- `POST /api/auth/login` - Đăng nhập
- `POST /api/auth/register` - Đăng ký

### Products
- `GET /api/products` - Lấy tất cả sản phẩm
- `GET /api/products/{id}` - Lấy sản phẩm theo ID
- `POST /api/products` - Tạo sản phẩm (cần auth)
- `PUT /api/products/{id}` - Cập nhật (cần auth)
- `DELETE /api/products/{id}` - Xóa (cần auth)
- `GET /api/products/stats` - Thống kê

### Users
- `GET /api/users` - Lấy tất cả người dùng (cần auth)
- `GET /api/users/{id}` - Lấy theo ID
- `POST /api/users` - Tạo người dùng
- `PUT /api/users/{id}` - Cập nhật
- `DELETE /api/users/{id}` - Xóa

### Orders
- `GET /api/orders` - Lấy tất cả đơn hàng (cần auth)
- `GET /api/orders/{id}` - Lấy theo ID
- `POST /api/orders` - Tạo đơn hàng
- `PUT /api/orders/{id}/status` - Cập nhật trạng thái
- `DELETE /api/orders/{id}` - Xóa
- `GET /api/orders/stats` - Thống kê

## 🗄️ Database

Ứng dụng sử dụng **MySQL** với database `quanlydb`. Hibernate tự tạo/cập nhật các bảng
khi backend khởi động (`spring.jpa.hibernate.ddl-auto=update`).

## 🛠️ Công nghệ sử dụng

| Layer | Công nghệ |
|-------|-----------|
| Backend | Spring Boot 2.7, Spring Security, JPA/Hibernate, JWT |
| Database | MySQL 8+ |
| BFF | Node.js 20, Express.js, http-proxy-middleware |
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| Build | Maven 3.9, npm |
