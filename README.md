# AutoBackup_Minecraft

自动备份minecraft的服务器存档文件的脚本

# How to use:

1.下载minecraft_backup.sh

2.使用记事本打开，然后修改存档所在位置、备份存储位置。

3.运行脚本测试是否工作正常：`./minecraft_backup.sh。`

# 定时运行？

要每天凌晨1点自动执行备份，你可以编辑你的crontab文件（crontab -e）并添加以下行：

`0 1 * * * /path/to/minecraft_backup.sh`

注意替换/path/to/为你的脚本实际所在的路径。

然后，你的Minecraft服务器的存档将每天自动备份一次。
