
# Script: tong_hop.sh
# Tac gia: Pham Thanh Dao
# Ngay tao: 11/11/2026

 

echo "Đang tạo báo cáo..."

 

echo "=== BAO CAO SU CO WEBSITE ===" > logs/tong_hop.txt

 

cat logs/access.log | grep "status=404" >> logs/tong_hop.txt

 

echo "So luong loi 500: $(cat logs/access.log | grep -c 'status=500')" >> logs/tong_hop.txt

 

echo "Hoan thanh!"

