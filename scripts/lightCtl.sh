#!bin/sh

# sudo light -S 50

# Kiểm tra xem light có được cài đặt chưa 
if ! command -v light &> /dev/null; then 
    echo "Cần cài đặt light." 
    exit 1                                                                
fi                                                                        

Hỏi người dùng mật khẩu root 
echo "Nhập mật khẩu root:" 
sudo -S light
echo

# Hỏi người dùng muốn tăng hay giảm độ sáng 
echo "Bạn muốn tăng hay giảm độ sáng?" 
read -p "(t) Tăng / (g) Giảm: " action 
                                                                          
# Tăng hoặc giảm độ sáng 
case "$action" in 
    t)                                                                    
        sudo light -A 10                                              
        ;;                                                                
    g)                                                                    
        sudo light -U 10                                              
        ;;                                                                
    *)                                                                    
        echo "Lựa chọn không hợp lệ." 
        exit 1                                                            
        ;;                                                                
esac                                                                      
                                                                          
# In thông báo xác nhận 
sudo light





