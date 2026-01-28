#!/bin/bash

# Створити пароль з ENV змінної
python3 << EOF
from tabpy.tabpy_server.app.util import hash_password
import os

username = os.environ.get('TABPY_USER', 'tableau')
password = os.environ.get('TABPY_PASSWORD', 'changeme')

with open('/app/config/passwords.txt', 'w') as f:
    f.write(f"{username}:{hash_password(password)}")

print(f"Created password file for user: {username}")
EOF

# Запустити TabPy
tabpy --config /app/config/tabpy.conf
