class Dashboardcontoller{
  int calculateTotalDays({required String startDate, required String endDate}) {
    DateTime startDateTime = DateTime.parse(startDate);
    DateTime endDateTime = DateTime.parse(endDate);
print(endDateTime);
    Duration difference = endDateTime.difference(startDateTime);
    int totalDays = difference.inDays;
    return totalDays;
  }

}