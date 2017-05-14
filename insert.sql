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
INSERT INTO `product` VALUES ('10000', '10000', '1', '小米note3', '小米note3全网通', '1000', 'img/hot/xiaomi.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10001', '10000', '1', '魅族', '魅蓝metal', '1000', 'img/hot/meizu.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10002', '10000', '1', '魅族pro6', '魅族pro6 小得大不一样', '1000', 'img/hot/meizu2.png', '1000', '1200');
INSERT INTO `product` VALUES ('10003', '10000', '1', '数码', '全场特价', '1000', 'img/hot/shuma.jpg', '10', '1200');
INSERT INTO `product` VALUES ('10004', '10000', '1', '热销手机', '热销手机提前放价', '1000', 'img/hot/shuma2.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10005', '10000', '1', '小米max', '小米max全网通', '1000', 'img/hot/xiaomi1.jpg', '1499', '1500');
INSERT INTO `product` VALUES ('10006', '10000', '1', 'ipad2', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10007', '10000', '1', 'opp7', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('10008', '10000', '1', '三星s7', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10009', '10000', '1', 'ifff', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10010', '10000', '1', 'dfasdf', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('10011', '10000', '1', 'fsdfddsf', '三fdsf7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10016', '10000', '1', 'dsafdsafsd', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('10018', '10000', '1', 'fsdfsdrsdaf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10019', '10000', '1', 'fdsfsrwedsvc', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('10020', '10000', '1', 'fdsfvczs', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10021', '10000', '1', 'iffsfdsdf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10022', '10000', '1', 'dfdfasff', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('10023', '10000', '1', 'fsfsadfdfsf', '三fdsf7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('10028', '10000', '1', 'dsafdsfsd', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('100012', '10000', '1', 'idfffdsf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100013', '10000', '1', 'fdsdssf', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('100014', '10000', '1', 'fdsdsf', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100015', '10000', '1', 'fasddsaf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100017', '10000', '1', 'fsdffsdsdf', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100024', '10000', '1', 'idfffsdffdsf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100025', '10000', '1', 'fdfdsfsf', 'opp7', '1000', 'img/show/oppor7.png', '1000', '1200');
INSERT INTO `product` VALUES ('100026', '10000', '1', 'fdfasdsf', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100027', '10000', '1', 'fdsfsdfaf', 'ipad2', '1000', 'img/show/ipad.jpg', '1000', '1200');
INSERT INTO `product` VALUES ('100029', '10000', '1', 'fsdfsdadf', '三星s7', '1000', 'img/show/sanxing.jpg', '1000', '1200');

-- ----------------------------
-- Records of hot
-- ----------------------------
INSERT INTO `hot` VALUES ('10000', '10000');
INSERT INTO `hot` VALUES ('10001', '10001');
INSERT INTO `hot` VALUES ('10003', '10003');
INSERT INTO `hot` VALUES ('10004', '10004');
INSERT INTO `hot` VALUES ('10002', '10008');

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


