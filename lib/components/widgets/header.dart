import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/config/app_size.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/global_controller.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  String locality = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  void initState() {
    super.initState();

    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
  }

  Future getAddress(latitude, longitude) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);

    setState(() {
      locality = placeMarks[0].locality!;
    });

    debugPrint(placeMarks[0].locality);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // locality
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            locality,
            style: TextStyle(
              fontSize: AppSize.baseSize * 3.5,
            ),
          ),
        ),

        // date
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            date,
            style: TextStyle(
              fontSize: AppSize.baseSize * 1.7,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
