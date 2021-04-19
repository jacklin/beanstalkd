#!/bin/bash
#
# ulimit # -l unlimited
# sysctl # -w vm.max_map_count=262144
# 运行服务
# -b DIR - wal目录

# -f MS - 指定MS毫秒内的 fsync (# -f0 为"always fsync")

# -F - 从不 fsync (默认)

# -l ADDR - 指定监听地址（默认为：0.0.0.0）

# -p PORT - 指定监听端口（默认为：11300）

# -u USER - 用户与用户组

# -z BYTE - 最大的任务大小（默认为：65535）

# -s BYTE - 每个wal文件的大小（默认为：10485760）

# -c - 压缩binlog（默认）

# -n - 不压缩binlog

/usr/bin/beanstalkd  -u root -b $BEANSTALKD_DATA_PATH  -z $BEANSTALKD_Z  -s $BEANSTALKD_S -p $BEANSTALKD_PORT