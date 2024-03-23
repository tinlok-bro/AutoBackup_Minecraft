#!/bin/bash

# 脚本名称：minecraft_backup.sh

# 配置部分
#目录：Minecraft服务器的世界存档目录（请修改为正确的路径）
SOURCE_DIR="/path/to/minecraft/world"
# 备份目录：备份文件将被存放在这里（请修改为正确的路径）
BACKUP_DIR="/path/to/backup/directory"
# 备份文件名前缀
BACKUP_PREFIX="minecraft_backup_"
# 压缩备份文件（使用zip）
COMPRESS=true

# 获取当前日期，格式为YYYYMMDD
CURRENT_DATE=$(date +"%Y%m%d")

 构建备份文件名
BACKUP_FILE_NAME="${BACKUP_PREFIX}${CURRENT_DATE}"

# 检查zip是否已安装
if ! command -v zip &> /dev/null; then
    echo "zip未安装，正在尝试安装..."
    # 更新软件包信息
    sudo apt update
    # 安装zip
    sudo apt install -y zip
    if [[ $? -eq 0 ]]; then
        echo "zip安装成功。"
    else
        echo "zip安装失败。"
        exit 1
    fi
else
    echo "zip已安装。"
fi

# 检查备份目录是否存在，如果不存在则创建
if [ ! -d "${BACKUP_DIR}" ]; then
    mkdir -p "${BACKUP_DIR}"
fi

# 执行备份操作
if ${COMPRESS}; then
    # 压缩备份
    BACKUP_FILE_NAME="${BACKUP_FILE_NAME}.zip"
    zip -r "${BACKUP_DIR}/${BACKUP_FILE_NAME}" "${SOURCE_DIR}" || { echo "备份失败"; exit ; }
else
    # 不压缩备份，应该复制到目录
    BACKUP_FILE_NAME="${BACKUP_DIR}/${BACKUP_FILE_NAME}"
    mkdir -p "${BACKUP_FILE_NAME}"
    cp -r "${SOURCE_DIR}/." "${BACKUP_FILE_NAME}" || echo "备份失败"; exit 1; }
fi

echo "Minecraft 打包成功."
echo "打包到: ${BACKUP_DIR}/${BACKUP_FILE_NAME}"

# 结束本脚本
exit 0
