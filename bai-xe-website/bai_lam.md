# BÀI LÀM – HACKATHON 02

- **Mã đề:** 02
- **Họ tên:**
- **Lớp:**
- **Link repository:**
- **Hệ điều hành (Windows/macOS):**

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
cd /Users/phamdao/Documents/starter-kit\ 2/bai-xe-website 
pwd
ls -a
mv huong_dan_van_hanh.txt docs 
ls docs 
mkdir backup 
cp data/luot_gui_xe_thang_2.xlsx backup 
rm *.tmp
cd logs 
ls
cd ..
ls -aR
```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text
.        .DS_Store    backup        data        evidence    web
..        .env        bai_lam.md    docs        logs

./backup:
.                ..                luot_gui_xe_thang_2.xlsx

./data:
.                ..                luot_gui_xe_thang_2.xlsx

./docs:
.            ..            huong_dan_van_hanh.txt

./evidence:
.    ..

./logs:
.        ..        gate.log

./web:
.        ..        app.js        images        index.html    style.css

./web/images:
.            ..            logo-parkeasy.png


```

## 4.3. Lọc log truy cập website

### a) Lệnh lọc các dòng status=500

```shell
grep -E 'status=500' /Users/phamdao/Documents/starter-kit\ 2/bai-xe-website/logs/gate.log   > loi_500.txt       


```

### 2 dòng đầu tiên trong logs/loi_500.txt

```text
2026-02-28 08:08:39 POST /api/cho-trong status=500
2026-02-28 08:23:23 POST /api/cho-trong status=500

```

### b) Lệnh đếm số dòng status=404 và kết quả

```shell
# Ghi lệnh vào đây (xoá dòng này)
cd logs
cat gate.log | grep "status=404" | wc -l
```

```text
 4

```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
# touch tong_hop.sh
cat > tong_hop.sh <<'EOF'

# Script: tong_hop.sh 
# Tac gia: Pham Thanh Dao
# Ngay tao: 11/11/2026

                          

echo "Đang tạo báo cáo..."

                                                        

echo "=== BAO CAO SU CO WEBSITE ===" > logs/tong_hop.txt

                                                            

cat logs/access.log | grep "status=404" >> logs/tong_hop.txt

                                                                                           

echo "So luong loi 500: $(cat logs/access.log | grep -c 'status=500')" >> logs/tong_hop.txt

                  

echo "Hoan thanh!"

EOF

bash tong_hop.sh

```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO SU CO WEBSITE ===
2026-02-28 08:12:50 GET /tin-tuc status=404
2026-02-28 08:31:56 GET /images/so-do-bai.jpg status=404
2026-02-28 08:36:18 GET /images/so-do-bai.jpg status=404
2026-02-28 08:47:02 GET /tin-tuc status=404
So luong loi 500: 6

```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [ ] README.md: Heading 1, mô tả có **in đậm** và *in nghiêng*, bảng, code block, task list, blockquote
- [ ] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [ ] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | --- | --- | --- |
| 1 |network|index.html|Uncaught ReferenceError: hienThiGiaGui is not defined
index.html:1 Unsafe attempt to load URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html from frame with URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html. 'file:' URLs are treated as unique security origins.|Đổi tên file Đổi biến javascript|
| 2 |console|logo.png|Failed to load resource: net::ERR_FILE_NOT_FOUND
app.js:18 Uncaught ReferenceError: hienThiGiaGui is not defined
index.html:1 Unsafe attempt to load URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html from frame with URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html. 'file:' URLs are treated as unique security origins.|Đổi tên file Đổi biến javascript|

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

**1. Context (Bối cảnh):**

Khi truy cập giu xe, logo không hiển thị

trên giao diện trang chủ.

 

**2. Expected (Kết quả mong đợi):**

Logo website phải hiển thị đầy đủ, đúng vị trí

và kích thước trên trang chủ.

 

**3. Actual (Kết quả thực tế):**

Logo không hiển thị do đường dẫn hoặc tên file

ảnh trong thuộc tính src không chính xác.

 

**4. Log (Thông báo lỗi):**
Uncaught ReferenceError: hienThiGiaGui is not defined
index.html:1 Unsafe attempt to load URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html from frame with URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html. 'file:' URLs are treated as unique security origins.
Failed to load resource: net::ERR_FILE_NOT_FOUND
app.js:18 Uncaught ReferenceError: hienThiGiaGui is not defined
index.html:1 Unsafe attempt to load URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html from frame with URL file:///Users/phamdao/Documents/starter-kit%202/bai-xe-website/web/index.html. 'file:' URLs are treated as unique security origins.

### Câu tìm kiếm Google

```text
site:stackoverflow.com "ERR_FILE_NOT_FOUND"

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/luot_gui_xe_thang_2.xlsx`, không cần ghi vào đây.
