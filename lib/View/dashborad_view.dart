import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:task_project/Model/sidebar_response_model.dart'
    as side_bar_data;
import 'package:task_project/Services/api_client.dart';
import 'package:task_project/Widgets/build_card_widget.dart';
import 'package:task_project/Widgets/build_drawer_widget.dart';
import 'package:task_project/Widgets/build_textform_field_widget.dart';
import '../Controller/dashboard_controller.dart';
import '../Model/dashboard_response_api_model.dart';

class DashBoradView extends StatefulWidget {
  const DashBoradView({super.key});
  @override
  State<DashBoradView> createState() => _DashBoradViewState();
}

class _DashBoradViewState extends State<DashBoradView> {
  Dashboardcontoller dashboardController = Dashboardcontoller();
  bool isLoading = true;
  DashboardResponseApiModel dashboardResponse = DashboardResponseApiModel();
  List<side_bar_data.Datum> sideMenuBarList = [];

  getDashboradData() async {
    dashboardResponse = await getdashbordData();
  }
  getSideBarData() async {
    sideMenuBarList = await getsideBarData();
    setState(() {
      isLoading = false;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getDashboradData();
    getSideBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black, // Change selected item color
            selectedLabelStyle:
                const TextStyle(color: Colors.black), // Ensure fixed type
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    "assests/bootom_navigatn_icon/home_icon.svg"),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    "assests/bootom_navigatn_icon/Batch_icon.svg"),
                label: "Batch",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    "assests/bootom_navigatn_icon/profile_icon.svg"),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    "assests/bootom_navigatn_icon/report_icon.svg"),
                label: "Report",
              ),
            ],
          ),
          drawer: Drawer(
              width: MediaQuery.of(context).size.width / 1.3,
              child: BuildDrawerWidget(sideBarItem: sideMenuBarList)),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue[100],
                ))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assests/background_image/newbackgrd.png",
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: SvgPicture.asset(
                                      "assests/icon_image/drawer_icon.svg"),
                                  onPressed: () {
                                    scaffoldKey.currentState?.openDrawer();
                                  }),
                              SvgPicture.asset(
                                  "assests/icon_image/appbar title.svg"),
                              Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                    bottom: 20,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue.shade50,
                                      radius: 8,
                                      child: SizedBox(
                                        width: 8,
                                        height: 10,
                                        child: SvgPicture.asset(
                                            'assests/icon_image/1.svg',
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Container(
                                      height: 37,
                                      width: 20,
                                      child: SvgPicture.asset(
                                        'assests/icon_image/notification.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: BuildTexFormFieldWidget(
                            hintText: "Search...",
                            radius: 10,
                            suffix: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: SizedBox(
                                width: 25,
                                height: 15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 1.5,
                                      height: 20,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset(
                                          "assests/icon_image/Group 2086 (1).svg"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: dashboardResponse.data!.length,
                            itemBuilder: (context, index) {
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(dashboardResponse
                                      .data![index].startDate!
                                      .toLocal());
                              String endDate = DateFormat('yyyy-MM-dd').format(
                                  dashboardResponse.data![index].endDate!
                                      .toLocal());
                              int totalDays =
                                  dashboardController.calculateTotalDays(
                                      startDate: formattedDate,
                                      endDate: endDate);
                              return BuildCardWidget(
                                totalDays: totalDays.toString(),
                                name: dashboardResponse.data![index].name
                                    .toString(),
                                branch: dashboardResponse
                                    .data![index].branch!.name
                                    .toString(),
                                course: dashboardResponse
                                    .data![index].course!.name
                                    .toString(),
                                endDate: endDate,
                                startDate: formattedDate,
                                uniqueId: dashboardResponse
                                    .data![index].uniqueId
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
