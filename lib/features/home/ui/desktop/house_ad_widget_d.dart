import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/house_model.dart';
import '../../../../utils/common/constant.dart';
import 'item_detail_page.dart';

class HouseAdWidget extends StatefulWidget {
  final House house;
  final int imgPathIndex;

  const HouseAdWidget({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  State<HouseAdWidget> createState() => _HouseAdWidgetState();
}

class _HouseAdWidgetState extends State<HouseAdWidget> {
  late House house;

  @override
  void initState() {
    house = widget.house;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              house: house,
              imgPathIndex: widget.imgPathIndex,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  Constants.imageList[widget.imgPathIndex],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
