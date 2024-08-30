#!/bin/bash                                                               

    echo

    # Nhắc nhở người dùng nhập giá trị commit
    # read -p 'Nhập commit: ' msg
    
    # Gán đầu vào vào biến                                                    
    # comsg=$msg                                                              
    msg="$(date)"
                                                                              
    # In giá trị của biến                                                     
    # echo "Bạn vừa comment: $msg !"
    
    # echo
                                                                              
    # Thêm các tệp chưa theo dõi                                              
    git add --all                                                             
    
    echo

    # Ghi chú thông tin thay đổi                                              
    git commit -m "$(date) -- $msg"                                        
    
    echo
                                                                              
    # Đẩy lên nhánh chính                                                     
    git push -u origin main            


    
