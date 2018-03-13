# SecondHand

标签（空格分隔）：project

---

>Bootstrap+SpringMVC+Spring+Mybatis+MySQL搭建的二手交易网站

## 效果展示：
首页：
![index][1]
登录页面：
![login][2]
注册页面：
![register][3]
商品页：
![prodoct_info][4]
购物车：
![shop cart][5]
下单页面：
![dingdang][6]
订单详情页：
![订单详情][7]
搜索：
![search][8]
后台页面：
![用户管理][9]
删除操作：
![delete user][10]
## 如何运行
下载压缩包到本地磁盘或者克隆到本地
>git clone git@github.com:ctbuCodeLife/secondHand.git

连接数据库，执行secondHand目录下的`create.sql`和`insert.sql`:
![image_1c8fbmm0iskr1gtmgh91mbl1hn6p.png-88.5kB][11]

![image_1c8fbnifr1ln72rv1pdhod5kgm16.png-93.2kB][12]

用IDEA打开项目：
![image_1c8frs5chitfrfn1nnj18oo1od656.png-219kB][13]
然后设置project structure里面的SDK，src，test等：
![project][14]
![modules][15]
![artifacts][16]
配置tomcat，点击Edit Configerations,然后添加：
![tomcat local][17]
![tomcat 9][18]
![deployment][19]
修改resource目录下的mybatis-conf.xml下的数据库配置：
![mysql config][20]
如何点击运行即可。


  [1]: http://static.zybuluo.com/danerlt/8sxlve194fj5kzhaey6448tv/image_1c8g3b8nsv2ud955gtv8l10orfl.png
  [2]: http://static.zybuluo.com/danerlt/ejvmh7ewc3mtcygzdhwytl50/image_1c8g3c50ujga116c1r8v1i281cg2.png
  [3]: http://static.zybuluo.com/danerlt/g59097waezk6ajo1mqzd1ro3/image_1c8g3dlm51ahh1ehr174p16b811e4gf.png
  [4]: http://static.zybuluo.com/danerlt/z6xjeyasj4xsjj9vv6cx665v/image_1c8g3l4lv19cr1723192o7pr1ekhhm.png
  [5]: http://static.zybuluo.com/danerlt/lxg31bd2sbbez6c3tf7ypzz9/image_1c8g3nie51t3tm32juds37131mi3.png
  [6]: http://static.zybuluo.com/danerlt/do5lbdmnz31b8r30sjgsifx9/image_1c8g3p2odeufmlugo13q61uolig.png
  [7]: http://static.zybuluo.com/danerlt/zpefh7fl23du7yn6cslvex5d/image_1c8g3q2p4hf0qcr7201ns1s0dit.png
  [8]: http://static.zybuluo.com/danerlt/if3ibvxpl8q9t06uqoxuuavk/image_1c8g3sm851sem189b12rf1djn5ruja.png
  [9]: http://static.zybuluo.com/danerlt/d0wctikkimvgkhdeb1roi1ix/image_1c8g3gegt1q3j1d0i1kgsq001qedgs.png
  [10]: http://static.zybuluo.com/danerlt/8y8s8p1mgd6ta1z1tq347bu7/image_1c8g3icji8af14q7qm1v1n1e5eh9.png
  [11]: http://static.zybuluo.com/danerlt/p0i7a7zq0djpx80830ggt0gh/image_1c8fbmm0iskr1gtmgh91mbl1hn6p.png
  [12]: http://static.zybuluo.com/danerlt/oxie8j75mm9xegnpjkbozye3/image_1c8fbnifr1ln72rv1pdhod5kgm16.png
  [13]: http://static.zybuluo.com/danerlt/pdrwl7hlxb28bl0q06s60e59/image_1c8frs5chitfrfn1nnj18oo1od656.png
  [14]: http://static.zybuluo.com/danerlt/m2qazbr5hxxkegeh5wi411vj/image_1c8fs4phpfn7sk25so1kmg1gib9t.png
  [15]: http://static.zybuluo.com/danerlt/cpss3q279rypwjdcw3d7r0do/image_1c8fs5h722bn17as3kg1j9a1rjqaa.png
  [16]: http://static.zybuluo.com/danerlt/6z8o641tts6eza5djrlsx5j5/image_1c8fsm57d1pvmnbk7t91qij1c6ccu.png
  [17]: http://static.zybuluo.com/danerlt/nissqafn2jz21z0dv1iy23iw/image_1c8fsaqar1r3mfb5g3julrdk3c4.png
  [18]: http://static.zybuluo.com/danerlt/kak5ry7di8dyq5hb60966yqg/image_1c8fsehfl1u0p1fquu8jr6g1glfch.png
  [19]: http://static.zybuluo.com/danerlt/hieqed1shho6qnsz823kxwkv/image_1c8fsqbc6etr1krfh10fva1itner.png
  [20]: http://static.zybuluo.com/danerlt/bxus1xh2g883ylzy04m5tj93/image_1c8g32u7q1pkbpsi1skm18r01dfsf8.png
