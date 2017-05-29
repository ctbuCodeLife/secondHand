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
INSERT INTO `product` VALUES ('100037', '10000', '5', 'xds山地车', '高端上帝单车，拔速快，喜德盛山地自行车27速X6铝合金油压碟刹锁死前叉逐日600自行车山地车运动健身单车 黑红色17寸 ( 适合身高1.65-1.80米) 已有900+条评价 关注 < > ¥799.00', '100', 'img/hot/qita1.png', '2000', '1699', '1');
INSERT INTO `product` VALUES ('100038', '10000', '3', '战争就是这么回事', '二手战争书籍', '100', 'img/hot/shu1.png', '100', '20','1');
INSERT INTO `product` VALUES ('100039', '10000', '4', '小裙子', '粉色的裙子', '100', 'img/hot/clothes1.png', '169', '69', '1');
INSERT INTO `product` VALUES ('100040', '10000', '1', '华为nova2', '高端智能机，你值得拥有', '1000', 'img/hot/huawei1.png', '2499', '2299', '1');
INSERT INTO `product` VALUES ('100041', '10000', '2', '拉柜', '清新托熟的柜子，又大又卫生', '399', 'img/hot/shenghuo1.png', '699', '599', '1');

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


