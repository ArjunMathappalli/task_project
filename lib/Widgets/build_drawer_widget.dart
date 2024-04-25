import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Model/sidebar_response_model.dart'as side_bar_data;
import 'build_text_widget.dart';

class BuildDrawerWidget extends StatefulWidget {
final List<side_bar_data.Datum> sideBarItem;
  const BuildDrawerWidget({super.key, required this.sideBarItem});

  @override
  State<BuildDrawerWidget> createState() => _BuildDrawerWidgetState();
}

class _BuildDrawerWidgetState extends State<BuildDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assests/background_image/sidebar.png"),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 19),
                child: SvgPicture.asset("assests/icon_image/backarrow.svg"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 50),
              child: BuildTextWidget(
                  text: "Hi,",
                  color: Colors.black,size: 13,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: BuildTextWidget(
                  text: "Arjun",
                  size: 18,
                  color: Colors.black,
                  ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          width: 50,
                          height:
                          MediaQuery.of(context).size.height / 3,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assests/icon_image/myprofile_image.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/work_image.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/dashboard_image.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/batch_image.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/event_image.svg"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          height:
                          MediaQuery.of(context).size.height / 3,
                          color: Colors.transparent,
                          child: ListView.builder(
                            physics:
                            const NeverScrollableScrollPhysics(),
                            itemCount: widget.sideBarItem.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  BuildTextWidget(
                                    text:widget.sideBarItem[index].englishName.toString(),
                                    size: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // Text('Name $index'),
                                  const SizedBox(
                                      height:
                                      30), // Add SizedBox as separator
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 5, color: Colors.white),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white),
                          width: 50,
                          height:
                          MediaQuery.of(context).size.height / 3,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assests/icon_image/settings_icon.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/terms_and_condition.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/refund_icon.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/app_info.svg"),
                              SvgPicture.asset(
                                  "assests/icon_image/logout.svg"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(color: Colors.transparent,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 3,
                        child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              BuildTextWidget(text: "Settings",size: 16,fontWeight: FontWeight.w600),
                              BuildTextWidget(text: "Terms & Condition",size: 16,fontWeight: FontWeight.w600),
                              BuildTextWidget(text: "Refund & Cancellation",size: 16,fontWeight: FontWeight.w600),
                              BuildTextWidget(text: "App Info",size: 16,fontWeight: FontWeight.w600),
                              BuildTextWidget(text: "logout",size: 16,fontWeight: FontWeight.w600),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
