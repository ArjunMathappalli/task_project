import 'package:dio/dio.dart';
import 'package:task_project/Model/dashboard_response_api_model.dart';

import '../Model/sidebar_response_model.dart' as side_bar_data;
import '../Model/sidebar_response_model.dart';

final dio = Dio();

Future<DashboardResponseApiModel> getdashbordData() async {
  Response response = await dio.get(
      options: Options(headers: {
        "x-access-token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU1NjIyYjhhOTExMjcxMGZkZGE5ZjYiLCJpYXQiOjE3MTM4NDUyODUsImV4cCI6MTcxNTU3MzI4NX0.9Je7bJl4tnR18tc0k7pT7kQ38jB1PZDsIZHoI6ltv2I"
      }),
      "https://asapapi.srvinfotech.com/staff/api/dashboard/batch/card");
  DashboardResponseApiModel dashboardData =
      DashboardResponseApiModel.fromJson(response.data);

  return dashboardData;
}

List<side_bar_data.Datum> sideMenuBar = [];
Future<List<side_bar_data.Datum>> getsideBarData() async {
  Response response = await dio.get(
      options: Options(headers: {
        "x-access-token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU1NjIyYjhhOTExMjcxMGZkZGE5ZjYiLCJpYXQiOjE3MTM4NDUyODUsImV4cCI6MTcxNTU3MzI4NX0.9Je7bJl4tnR18tc0k7pT7kQ38jB1PZDsIZHoI6ltv2I"
      }),
      "https://asapapi.srvinfotech.com/staff/api/auth/sidebar");

  SidebarResponseApiModel sidebarData =
      SidebarResponseApiModel.fromJson(response.data);
  sideMenuBar.addAll(sidebarData.data!);

  return sideMenuBar;
}
