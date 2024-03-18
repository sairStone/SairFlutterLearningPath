import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview_twodemo/data/model/applet.dart';
import 'package:flutter_inappwebview_twodemo/feature/frame/front/widgets/carousel_widgets.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<Applet> appList = [
    Applet(
        name: 'Applet 1',
        icon: 'assets/images/vue.png',
        url: 'applet://life.com'),
    Applet(name: 'Applet 2', icon: 'assets/images/vue.png', url: ''),
    Applet(name: 'Applet 3', icon: 'assets/images/vue.png', url: ''),
    Applet(name: 'Applet 4', icon: 'assets/images/vue.png', url: ''),
    Applet(name: 'Applet 5', icon: 'assets/images/vue.png', url: ''),
    Applet(name: 'Applet 6', icon: 'assets/images/vue.png', url: ''),
    Applet(name: 'Applet 6', icon: 'assets/images/vue.png', url: ''),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _toAppletView(String? url) {
    Navigator.of(context).pushNamed('/applet/index', arguments: url);
    logger.d("Logger is working!");
    logger.i(url);
  }

  Widget _buildAppletContent(Applet applet) {
    return InkWell(
        onTap: () => _toAppletView(applet.url),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0), // 圆角半径自定义，这里设为8.0
            child: Image.asset(
              applet.icon,
              width: MediaQuery.of(context).size.width / 5.9,
              fit: BoxFit.cover, // 保持图片填充整个区域，根据需要调整
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(applet.name),
          SizedBox(
            height: 10,
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            radius: 50,
          ),
        ),
        title: Text('前台页面'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselWidgets(),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '常用应用',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              '查看全部',
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            ))
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 8.0, // 子Widget之间的水平间距
                    runSpacing: 4.0, // 换行之间的垂直间距
                    direction: Axis.horizontal, // 水平方向排列
                    crossAxisAlignment:
                        WrapCrossAlignment.center, // 主轴交叉对齐方式，例如居中
                    children: appList.map(_buildAppletContent).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                       Navigator.of(context).pushNamed('/applet/server');
                    },
                    icon: const Icon(Icons.message_outlined,
                        color: Colors.redAccent),
                    label: Text('查看全部消息',
                        style: const TextStyle(
                            color: Colors.redAccent, fontSize: 18)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
