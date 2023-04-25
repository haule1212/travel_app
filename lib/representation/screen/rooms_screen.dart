import 'package:flutter/material.dart';
import 'package:travel_app/data/model/room_model.dart';
import 'package:travel_app/representation/screen/check_out_screen.dart';
import 'package:travel_app/representation/widgets/item_room_widget.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/app_bar_container.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  static const String routeName = '/rooms_screen';

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Phòng Deluxe',
      size: 27,
      utility: 'Không hoàn trả',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Phòng Suite',
      size: 32,
      utility: 'Không hoàn trả',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'Phòng có giường cở lớn',
      size: 24,
      utility: 'Không hoàn trả',
      price: 214,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Chọn phòng',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
              .map(
                (e) => ItemRoomWidget(
                  roomModel: e,
                  onTap: () {
                    Navigator.of(context).pushNamed(CheckOutScreen.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
