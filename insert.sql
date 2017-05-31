-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`(`username`,`password`,`email`,`level`) VALUES ('admin', 'admin', 'admin@shop.com', '2');
INSERT INTO `admin`(`username`,`password`,`email`,`level`) VALUES ('root', 'root', 'root@shop.com', '1');

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`(`username`,`password`,`email`,`tel`,`sex`,`level`,`score`)
 VALUES ('litao', '123456', 'litao@shop.com', '15959787657', '男', '1', '50');
INSERT INTO `user`(`username`,`password`,`email`,`tel`,`sex`,`level`,`score`)
 VALUES ('myq', '123456', 'myq@shop.com', '15959787657', '男', '1', '50');
INSERT INTO `user`(`username`,`password`,`email`,`tel`,`sex`,`level`,`score`)
 VALUES ('test', '123456', 'test@shop.com', '15959787657', '男', '1', '50');

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES ('3', '二手书');
INSERT INTO `kind` VALUES ('5', '其他');
INSERT INTO `kind` VALUES ('1', '手机数码');
INSERT INTO `kind` VALUES ('4', '服装');
INSERT INTO `kind` VALUES ('2', '生活用品');



-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('10000', '10000', '1', '小米note3', '小米note3全网通模式：移动3G(TD-SCDMA)\r\n类型：4G手机,3G手机,智\r\n模式：4G网络\r\n外观：直板\r\n特性：4G手机 3G手机 智能手机', '1000', 'img/hot/xiaomi.jpg', '1000', '1200', '1');
INSERT INTO `product` VALUES ('10002', '10000', '1', '魅族pro6', '魅族pro6 小得大不一样,主屏：5.2英寸1920x1080\r\n摄像：2116万像素\r\n系统：FlymeOS\r\n模式：4G网络\r\n特性：双卡盲插 3D Press悬浮压力触控 VoLTE高清语音', '1000', 'img/hot/meizu2.png', '1000', '1200', '1');
INSERT INTO `product` VALUES ('10005', '10000', '1', '小米max', '主屏：6.44英寸1920x108\r\n摄像：1600万像素\r\n系统：MIUI8\r\n模式：4G网络\r\n特性：伪基站识别 大屏黄金尺寸 悬浮球 指纹识别', '1000', 'img/hot/xiaomi1.jpg', '1499', '1500', '1');
INSERT INTO `product` VALUES ('10008', '10000', '1', '三星s7', '主屏：5.1英寸2560x1440\r\n系统：Android6.0\r\n摄像：1200万像素\r\n模式：4G网络\r\n特性：息屏提醒 防水功能 快速充电 Samsung Pay三星智', '1000', 'img/show/sanxing.jpg', '1000', '1200', '1');
INSERT INTO `product` VALUES ('100037', '10000', '5', 'xds山地车', '高端上帝单车，拔速快，喜德盛山地自行车27速X6铝合金油压碟刹锁死前叉逐日600自行车山地车运动健身单车 黑红色17寸 ( 适合身高1.65-1.80米) 已有900+条评价 关注', '100', 'img/hot/qita1.png', '1699', '1999', '1');
INSERT INTO `product` VALUES ('100038', '10000', '3', '战争就是这么回事', '二手战争书籍', '100', 'img/hot/shu1.png', '20', '70', '1');
INSERT INTO `product` VALUES ('100039', '10000', '4', '小裙子', '粉色的裙子', '100', 'img/hot/clothes1.png', '69', '168', '1');
INSERT INTO `product` VALUES ('100040', '10000', '1', '华为nova2', '高端智能机，你值得拥有', '1000', 'img/hot/huawei1.png', '2299', '2499', '1');
INSERT INTO `product` VALUES ('100041', '10000', '2', '拉柜', '清新托熟的柜子，又大又卫生', '399', 'img/hot/shenghuo1.png', '599', '699', '1');
INSERT INTO `product` VALUES ('100042', '10000', '2', '苏泊尔不沾锅', '苏泊尔不粘锅是国内的知名品牌，苏泊尔不粘锅涂层的主要还是特氟龙，特氟龙的特性是，如果温度超过400度，那么它会释放有毒物质。可是家里烹饪不会超过这个温度，因为无论是电磁炉还是明火炉具它的温度城市节制在400度以下。另外要注意的就是要保养好不粘锅，不要做一些酸性的食物，炒菜尽量用木质东西等等。', '100', 'img/2/2-1.png', '699', '899', '1');
INSERT INTO `product` VALUES ('100043', '10000', '2', '套装锅', '美味一套搞定', '100', 'img/2/2-2.png', '299', '599', '1');
INSERT INTO `product` VALUES ('100044', '10000', '2', '刀具', '好厨配好刀', '100', 'img/2/2-3.png', '299', '399', '1');
INSERT INTO `product` VALUES ('100045', '10000', '2', '高级保温杯', '时刻给你温暖', '100', 'img/2/2-4.png', '339', '439', '1');
INSERT INTO `product` VALUES ('100046', '10000', '2', '闷骚杯', '百变魔法闷骚杯', '100', 'img/2/2-5.png', '299', '399', '1');
INSERT INTO `product` VALUES ('100047', '10000', '2', '碗具', '景德镇风俗碗具', '100', 'img/2/2-6.png', '300', '499', '1');
INSERT INTO `product` VALUES ('100048', '10000', '2', '景德镇碗具', '景德镇的高端产品', '100', 'img/2/2-7.png', '499', '599', '1');
INSERT INTO `product` VALUES ('100049', '10000', '2', '咖啡杯', '英国进口咖啡杯，你值得拥有', '100', 'img/2/2-8.png', '59', '68', '1');
INSERT INTO `product` VALUES ('100050', '10000', '2', '皮沙发', '美国白宫专用沙发', '100', 'img/2/2-9.png', '4999', '6999', '1');
INSERT INTO `product` VALUES ('100051', '10000', '2', '茶几', '黑白简约茶几', '100', 'img/2/2-10.png', '799', '999', '1');
INSERT INTO `product` VALUES ('100052', '10000', '2', '好床垫', '天然椰粽+乳胶,睡眠在云端', '100', 'img/2/2-11.png', '2699', '2999', '1');
-- ----------------------------
-- Records of hot
-- ----------------------------
INSERT INTO `hot` VALUES ('10000', '100037');
INSERT INTO `hot` VALUES ('10001', '100038');
INSERT INTO `hot` VALUES ('10002', '100039');
INSERT INTO `hot` VALUES ('10003', '100040');
INSERT INTO `hot` VALUES ('10004', '100041');

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('25', '10000', '10001', '1', '否', '1000');

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('10', '10002', '100039', '1', '443', '2017-05-15 03:57:17', '1494791837355', '卖家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('11', '10002', '100039', '1', '443', '2017-05-15 03:57:41', '1494791861806', '卖家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('12', '10002', '100039', '1', '443', '2017-05-15 03:59:47', '1494791987060', '卖家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('13', '10002', '10002', '1', '1000', '2017-05-15 04:01:23', '1494792083008', '卖家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('14', '10002', '10000', '1', '1000', '2017-05-15 04:02:39', '1494792159405', '卖家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('15', '10002', '10002', '1', '1000', '2017-05-15 04:05:23', '1494792323063', '买家已取消', null, '', '', '');
INSERT INTO `sales` VALUES ('16', '10002', '10000', '1', '1000', '2017-05-15 04:05:45', '1494792345247', '卖家已取消', null, '', '', '');


