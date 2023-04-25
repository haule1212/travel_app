import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/textstyle_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screen/main_app.dart';
import 'package:travel_app/representation/widgets/item_intro_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    ItemIntroWidget(
      title: 'Đặt một chuyến bay',
      description: 'Tìm thấy một chuyến bay phù hợp với điểm đến và lịch trình của bạn? Đặt nó ngay lập tức.',
      sourceImage: AssetHelper.slide1,
      aligment: Alignment.centerRight,
    ),
    ItemIntroWidget(
      title: 'Tìm phòng khách sạn',
      description: 'Chọn ngày, đặt phòng. Chúng tôi cung cấp cho bạn giá tốt nhất.',
      sourceImage: AssetHelper.slide2,
      aligment: Alignment.center,
    ),
    ItemIntroWidget(
      title: 'Tận hưởng chuyến đi',
      description: 'Dễ dàng khám phá những địa điểm mới và chia sẻ những địa điểm này với bạn bè của bạn và cùng nhau đi du lịch.',
      sourceImage: AssetHelper.slide3,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Navigator.of(context).pushNamed(MainApp.routeName);
                    } else {
                      _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(kMediumPadding),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: kMediumPadding * 2, vertical: kDefaultPadding),
                    child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Tiếp theo' : 'Bắt đầu',
                          style: TextStyles.defaultStyle.whiteTextColor.bold,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
