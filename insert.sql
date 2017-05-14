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
INSERT INTO `user`(`username`,`password`,`email`,`level`,`tel`,`sex`,`level`,`score`)
 VALUES ('myq', '123456', 'myq@shop.com', '15959787657', '男', '1', '50');
INSERT INTO `user`(`username`,`password`,`email`,`level`,`tel`,`sex`,`level`,`score`)
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
INSERT INTO `product`(`uId`,`kId`,`pName`,`pDesc`,`pNum`,`pImage`,`realPrice`,`originPrice`)
 VALUES ('10000', '1','魅族pro6', '魅族pro6 小得大不一样', '1', 'img/hot/meizu2.png', '1000', '1200');
