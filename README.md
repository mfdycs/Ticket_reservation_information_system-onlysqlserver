# 机票预定信息系统 —— 数据库原理大作业


## 注意

本系统基于MS SQL SERVER2018 实现，仅仅包含数据库设计部分，不具有完整操作能力

## 要求

本小组通过小范围内的初步调研，以及通过网络搜寻收集客运订票机构相关资料和指导教师的指导下，完成设计课题的全部内容，使“民航订票管理系统”实现航空公司、飞机、航班、航线、客户信息的录入，查询，修改，删除功能以及客户订票和查询航班剩余座位数的功能。
1. 系统功能的基本要求：每个航班信息的输入;当旅客进行机票预定时，输入旅客基本信息，系统为旅客安排航班；旅客能够退订和改签机票；能够查询每个航班的预定情况。
2. 数据库要求：在数据库中至少应该包含下列数据表:航班信息表；航班坐位情况表；旅客订票信息表；取票通知表；帐单。


## 特点

1. 本系统满足BCNF
2. 含有单表查询和多表连接查询
3. 创建了完整性约束和自定义约束
4. 具有多个触发器
4. 进行了数据可的备份和恢复处理
6. 有权限分配和角色设置

## E-R 图
![](https://github.com/mfdy/Ticket_reservation_information_system-onlysqlserver/blob/master/images/%E6%9C%BA%E7%A5%A8%E9%A2%84%E8%AE%A2%E4%BF%A1%E6%81%AF%E7%B3%BB%E7%BB%9F%E5%AE%8C%E6%95%B4E-R%E5%9B%BE.png)

## 流程图
![](https://github.com/mfdy/Ticket_reservation_information_system-onlysqlserver/blob/master/images/%E6%9C%BA%E7%A5%A8%E9%A2%84%E5%AE%9A%E4%BF%A1%E6%81%AF%E7%B3%BB%E7%BB%9F%E6%B5%81%E7%A8%8B%E5%9B%BE.png)

<br/> <br/>

## 打赏
<img src="https://github.com/mfdy/private-things/blob/master/wechat.png" width=200 float：left />
<img src="https://github.com/mfdy/private-things/blob/master/alpay.jpg" width=200 />