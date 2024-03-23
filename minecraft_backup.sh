#!/bin/bash

# 脚本名称：minecraft_backup.sh

# 配置部分
# 源目录：Minecraft服务器的世界存档目录
SOURCE_DIR="/"
# 备份目录：备份文件将被存放在这里
BACKUP_DIR="/"
# 备份文件名前缀
BACKUP_PREFIX="minecraft_backup_"
# 压缩备份文件（使用zip）
COMPRESS=true

# 获取当前日期，格式为YYYYMMDD
CURRENT_DATE=$(date +"%Y%m%d")

# 构建备份文件名
BACKUP_FILE_NAME="${BACKUP_PREFIX}${CURRENT_DATE}.zip"

# 检查备份目录是否存在，如果不存在则创建
if [ ! -d "${BACKUP_DIR}" ]; then
    mkdir -p "${BACKUP_DIR}"
fi

# 执行备份操作
if ${COMPRESS}; then
    # 压缩备份
    zip -r "${BACKUP_DIR}/${BACKUP_FILE_NAME}" "${SOURCE_DIR}"
else
    # 不压缩备份
    cp -r "${SOURCE_DIR}" "${BACKUP_DIR}/${BACKUP_FILE_NAME}"
fi


echo "Minecraft 打包成功."
echo "打包到: ${BACKUP_DIR}/${BACKUP_FILE_NAME}"

# 结束脚本
exit 0
