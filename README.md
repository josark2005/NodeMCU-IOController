# NodeMCU-IO Controller

远程NodeMCU IO控制

---

![NodeMCU](https://raw.githubusercontent.com/jokin1999/NodeMCU-IOController/master/iot.png)

## 简介

此项目用于远程控制IO电平

额外依赖组件：`http`、`sjson`

## 使用方法

- 修改`init.lua`文件中的`ap`和`wifi connection`设置
- 上传所有文件至NodeMCU
- 通过`ap`的ssid和pwd连接到NodeMCU或使其连接至路由器
- 获取MCU的ip地址并打开
- 可以在手机端打开ip地址直接控制

## 默认设置

- `ap_ssid` node_wifi
- `ap_pwd` 12345678

请自行在`init.lua`文件中修改设置
