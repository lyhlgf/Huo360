# Huo360
+ Huo360是一个针对[火星360](http://huo360.com)网站设计的客户端。
+ 目前实现了可以查看最新美剧新闻资讯的功能。


## 项目结构
+ 项目根目录里的Huo360.xcworkspace是项目的配置文件，可以直接在xcode中打开。
+ 项目采用了解析HTML/XML的库[Fuzi](https://github.com/cezheng/Fuzi)，采用cocoapod的方式安装，项目根目录下的podfile写明了安装的库的内容。
+ 项目通过HTTP GET从火星360网站获取网页的HTML源码，采用Fuzi对HTML进行解析，解析完成后将解析结果构造成各个定义好的HuoObject类的对象，最后根据这些对象在屏幕上上显示相应信息。
+ Huo360文件夹下存放了项目的源代码:
```
Huo360
  |
  |--AppDelegate.swift // 项目的入口
  |--Base.Iproj
  |   |
  |   |--Main.storyboard // 主界面的storyboard
  |--Controllers
  |   |
  |   |--NewsViewController.swift // 新闻TableView的controller
  |   |--NewsArticleController.swift // 新闻内容的Controller
  |   |--SecondViewController.swift
  |--Models
  |   |
  |   |--Crawler.swift // 爬取、解析、构造的总控制类
  |   |--HTTP.swift // 使用URLSession实现了对HTTP GET方法的封装
  |   |--HTMLParser.swift // 使用Fuzi对具体的HTML页面进行解析
  |   |--HuoObject.swift // 根据要解析的页面定义不同的类来保存解析结果
  |   |--Parse2HuoObj.swift // 根据HTML的解析结果构造需要的HuoObject对象
  |   |--Data.swift // 对HTML源码的数据封装
  |   |--CloseHTML.swift // 处理HTML源码中可能存在的错误情况
  |--Views
  |   |
  |   |--NewsViewCell.swift // 新闻TableView的TableCell的定义
  |   |--UIImageExtension.swift // 对UIImage的扩展，实现了可根据url加载图片的功能
  |   |--UILabelExtension.swift // 对UILabel的扩展，实现了自动调节Label高度的功能
```
