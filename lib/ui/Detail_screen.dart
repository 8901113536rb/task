import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:task_project/constants/StringConstants.dart';
import 'package:task_project/controller/userdetail_controller.dart';
import 'package:get/get.dart';


class Detail_screen extends StatefulWidget {
  int id;

  Detail_screen({super.key, required this.id});

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  final userdetail_controller =
      Get.put(Userdetail_controller());
  MapController? mapController;
  double mapZoom = 7.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdetail_controller.userdetail(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(()=> SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
            // userdetail_controller.userdetailModel != null
            userdetail_controller.responseresult.value==true
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      StringConstants.id,
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.id
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${StringConstants.name} :-",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.name
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      StringConstants.username,
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.username
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${StringConstants.email}:-",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.email
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.address,
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width /
                            100 *
                            60,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              userdetail_controller
                                  .userdetailModel!.address!.street
                                  .toString(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      100 *
                                      2.5),
                            ),
                            Text(
                              userdetail_controller
                                  .userdetailModel!.address!.suite
                                  .toString(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      100 *
                                      2.5),
                            ),
                            Text(
                              userdetail_controller
                                  .userdetailModel!.address!.city
                                  .toString(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      100 *
                                      2.5),
                            ),
                            Text(
                              userdetail_controller
                                  .userdetailModel!.address!.zipcode
                                  .toString(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height /
                                      100 *
                                      2.5),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${StringConstants.phonenumber}:-",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.phone
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      StringConstants.websitename,
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller.userdetailModel!.website
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      StringConstants.companyname,
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                    Text(
                      userdetail_controller
                          .userdetailModel!.company!.name
                          .toString(),
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.height /
                              100 *
                              2.5),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  width: 500,
                  child: OSMFlutter(
                    controller: mapController?? MapController.withPosition(initPosition: GeoPoint(
                      latitude: double.parse(userdetail_controller.userdetailModel!.address!.geo!.lat.toString()),
                      longitude: double.parse(userdetail_controller.userdetailModel!.address!.geo!.lng.toString()),
                    )),
                    trackMyPosition: false,
                    initZoom: mapZoom,
                    minZoomLevel: 7,
                    maxZoomLevel: 19,
                    stepZoom: 1.0,
                    userLocationMarker: UserLocationMaker(
                      personMarker: MarkerIcon(
                        icon: Icon(
                          Icons.location_history_rounded,
                          color: Colors.red,
                          size: 48,
                        ),
                      ),
                      directionArrowMarker: MarkerIcon(
                      icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                      ),
                    ),
                    ),
                    markerOption: MarkerOption(
                        defaultMarker: MarkerIcon(
                          assetMarker: AssetMarker(
                              image: const AssetImage("assets/images/location.png"),
                              scaleAssetImage: 1),
                        )),
                  ),
                )
              ],
            )
                : const Center(child: CircularProgressIndicator()),
          )))
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    userdetail_controller.responseresult.value = false;
    super.dispose();
  }

}
