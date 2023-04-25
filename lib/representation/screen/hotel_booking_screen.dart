import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screen/guest_and_room_screen.dart';
import 'package:travel_app/representation/screen/hotels_screen.dart';
import 'package:travel_app/representation/screen/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_button_widget.dart';
import 'package:travel_app/representation/widgets/item_options_booking.dart';
import 'package:travel_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key, this.destination}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Đặt phòng khách sạn',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemOptionsBookingWidget(
              title: 'Điểm đến',
              value: widget.destination ?? ' Việt Nam',
              icon: AssetHelper.icoLocation,
              onTap: () {},
            ),
            ItemOptionsBookingWidget(
              title: 'Chọn ngày',
              value: selectDate ?? 'Chọn ngày',
              icon: AssetHelper.icoCalendal,
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            ItemOptionsBookingWidget(
              title: 'Khách và phòng',
              value: guestAndRoom ?? 'Khách và phòng',
              icon: AssetHelper.icoBed,
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            ItemButtonWidget(
              data: 'Tìm kiếm',
              onTap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
