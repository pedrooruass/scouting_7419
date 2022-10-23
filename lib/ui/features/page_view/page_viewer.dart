import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:scoring_7419/ui/features/home/home_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class PageViewer extends StatefulWidget {
  const PageViewer({Key? key}) : super(key: key);

  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final _controller = PageController(initialPage: 1);
  var heart = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const <Widget>[
          ColoredBox(color: black),
          HomePage(),
          ColoredBox(color: black),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        flat: true,
        useActiveColorByDefault: false,
        color: grey,
        itemColor: black,
        items: const [
          RollingBottomBarItem(
            Icons.data_saver_off,
            label: 'Data',
            activeColor: darkGrey,
          ),
          RollingBottomBarItem(
            Icons.sports_basketball,
            label: 'Scout',
            activeColor: darkGrey,
          ),
          RollingBottomBarItem(
            Icons.chat,
            label: 'Chat',
            activeColor: darkGrey,
          ),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
