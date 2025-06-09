import os
import sys

# Lấy đường dẫn hiện tại của file train_vlm.py
current_dir = os.path.dirname(os.path.abspath(__file__))  # .../src/train

# Đường dẫn thư mục src (lùi ra 1 cấp)
src_dir = os.path.abspath(os.path.join(current_dir, '..'))  # .../src

# Đường dẫn ra ngoài folder src (lùi ra thêm 1 cấp nữa)
parent_dir = os.path.abspath(os.path.join(src_dir, '..'))  # ra ngoài src

# Thêm vào sys.path để Python có thể import module từ thư mục này
sys.path.append(parent_dir)

print("Added to sys.path:", parent_dir)