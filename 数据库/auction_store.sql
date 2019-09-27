#用户表
create table t_user (
	uid int(11) not null auto_increment primary key,
	uname varchar(255) comment'用户注册登录时使用的用户名，需唯一' unique key,
	upass varchar(255) comment'登录密码',
	email varchar(255) comment '邮箱',
	tel varchar(255) comment '手机号',
	userStatus varchar(255) comment '用户状态（正常、禁言、禁止出价……）',
	accountStatus varchar(255) comment '注销，待激活…………',
	accountPassWord varchar(255) comment '支付密码，管理多张银行卡（待激活到正常的条件？）',
	idCard varchar(255) comment '身份证号',
	utime datetime comment '创建时间'
);
#商品表
create table t_goods (
	gid int(11) not null auto_increment primary key,
	gname varchar(20) comment'商品名称',
	uid int(11) comment'该拍品属于哪个用户',
	upload_time datetime comment '该商品的上传时间（商品的最后一次编辑时间）',
	good_status varchar(255) comment '竞拍状态（待拍卖，拍卖中，已成交，流拍……)',
	cid int(11) comment '类别',
	remark varchar(255) comment '描述',
	addressid varchar(255) comment '发布地址'
);
#订单表
create table t_order (
	oid int(11) not null auto_increment primary key,
	orderGenerateId varchar(20) comment'订单号：uuid等方式生成唯一订单号，在前端显示',
	u_bid int(11) comment'买家id',
	u_sid int comment '卖家id',
	getid int(11) comment '收货地址id',
	dealPrice double comment '成交金额',
	commision double comment '佣金（根据成交金额计算）',
	orderTotalPrice double comment '订单总金额，等于商品价格+佣金（财政收入来源1）',
	dealTime datetime comment '交易时间（付款时间）',
	gid int(11) comment '商品id',
	buyCount int(11) comment '购买数量（设置默认值为1）',
	orderStatus varchar(255) comment '订单状态：未付款、已付款、待发货、已发货、完成、退货（涉及退款）、卖家关闭（前提：流拍）、……',
	paymentChannel varchar(255) comment '支付方式（微信、支付宝、网银）及支付交易号',
	orderTrade varchar(255) comment '流水号：已付款之后才会生成唯一流水号'
);
#财务统计表
create table t_finance (
	finnanceId int(11) not null auto_increment primary key,
	orderGenerateId int(11) comment'订单号',
	gid int(11) comment'商品id，外键到商品表（取商品描述）',
	dealTime datetime comment '交易时间（来自订单表）',
	dealPrice double comment '成交金额（来自订单表）',
	commission double comment '订单表的佣金金额（即使退货，也不退佣金，所以订单状态与收入无关）',
	totalRevenue double comment '总计收入',
	u_bid int(11) comment '买家id，外键到用户id（来自订单表）',
	s_sid int(11) comment '卖家id，外键到用户id（来自订单表）',
	paymentChannel varchar(255) comment '支付渠道（支付宝、微信、银行卡）（来自订单表）'
);
#竞价记录表
create table t_record (
	rid int(11) not null auto_increment primary key,
	gid int(11) comment'拍品，外键到商品',
	u_bid int(11) comment'出价人,外键到用户id',
	u_sid int(11) comment '卖家id',
	recordTime datetime comment '出价时间',
	recordPrice double comment '出价价格',
	recordNum int(11) comment '出价次数',
	transactionStatus varchar(255) comment '成交状态'
);
#管理员表
create table t_admin (
	adminId int(11) not null auto_increment primary key,
	adminName varchar(11) comment'管理员账号',
	adminPass varchar(11) comment'管理员密码',
	adminPhone int(11) comment '管理员手机'
);

#竞拍商品表
create table t_auctiongoods (
	agid int(11) not null auto_increment primary key,
	gid int(11) comment'商品id',
	firstPrice double comment'起拍价',
	addPrice double comment '加价幅度',
	startTime datetime comment '起拍时间',
	endingTime datetime comment '结束时间',
	focusNum int(11) comment '围观次数',
	currentPrice double comment '当前价格',
	actualParticipateCount int(11) comment '实际参拍人数',
	endingPrice double comment '结束价（无论是流拍还是成交都有结束价）'
);

#参与拍卖
create table t_auction (
	aid int(11) not null auto_increment primary key,
	deposit double comment'保证金（押金）',
	u_bid int(11) comment'买家id',
	u_sid int(11) comment '卖家id',
	agid int(11) comment '竞拍商品'
);

#商品图片
create table t_goodsimgs (
	pid int(11) not null auto_increment primary key,
	gid int(11) comment'商品id',
	imgPath varchar(11) comment'路径'
);

#个人收藏表
create table t_favorites (
	fid int(11) not null auto_increment primary key,
	uid int(11) comment'用户id',
	gid int(11) comment'商品id'
);

#类别表
create table t_category (
	cid int(11) not null auto_increment primary key,
	cname varchar(20) comment'类别名'
);


#发布地址表
create table t_address (
	addressid int(11) not null auto_increment primary key,
	name varchar(20) comment'省/市/区'
	pid  int(11) comment'自连接 id'
);

#收货地址表
create table t_getAddress (
	getid int(11) not null auto_increment primary key,
	province varchar(30) comment'省',
	city  varchar(30) comment'市 ',
	county  varchar(30) comment'县/区',
	detail  varchar(30) comment'详细地址',
	getPerson  varchar(30) comment'收货人',
	getTel  varchar(30) comment'收货人电话',
	uid  int(11) comment'用户id'
);



















